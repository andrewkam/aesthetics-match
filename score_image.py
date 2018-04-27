# Script to populate DB with object detection and color scores
# Object detection uses TensorFlow and is based off image recognition demo (https://github.com/tensorflow/tensorflow/tree/master/tensorflow/examples/label_image)
# Colorfulness detection uses OpenCV and is based off tutorial by Adrian Rosebrock (https://www.pyimagesearch.com/2017/06/05/computing-image-colorfulness-with-opencv-and-python)

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import imutils
import cv2
import os
import argparse
import psycopg2
import numpy as np
import tensorflow as tf
from imutils import build_montages
from imutils import paths

# Reads a model graph definition from disk
def load_graph(model_file):
  graph = tf.Graph()
  graph_def = tf.GraphDef()

  with open(model_file, "rb") as f:
    graph_def.ParseFromString(f.read())
  with graph.as_default():
    tf.import_graph_def(graph_def)

  return graph

# Given an image file name, read in the data, try to decode it as an image,
# resize it to the requested size, and then scale the values as desired
def read_tensor_from_image_file(file_name, input_height = 299, input_width = 299, input_mean = 0, input_std = 255):
  input_name = "file_reader"
  output_name = "normalized"
  file_reader = tf.read_file(file_name, input_name)

  if file_name.endswith(".png"):
    image_reader = tf.image.decode_png(file_reader, channels = 3, name = "png_reader")
  elif file_name.endswith(".gif"):
    image_reader = tf.squeeze(tf.image.decode_gif(file_reader, name = "gif_reader"))
  elif file_name.endswith(".bmp"):
    image_reader = tf.image.decode_bmp(file_reader, name = "bmp_reader")
  else:
    image_reader = tf.image.decode_jpeg(file_reader, channels = 3, name = "jpeg_reader")

  float_caster = tf.cast(image_reader, tf.float32)
  dims_expander = tf.expand_dims(float_caster, 0)
  resized = tf.image.resize_bilinear(dims_expander, [input_height, input_width])
  normalized = tf.divide(tf.subtract(resized, [input_mean]), [input_std])
  sess = tf.Session()
  result = sess.run(normalized)

  return result

# Read labels fiile
def load_labels(label_file):
  label = []
  proto_as_ascii_lines = tf.gfile.GFile(label_file).readlines()

  for l in proto_as_ascii_lines:
    label.append(l.rstrip())
  return label

# Return colorfulness metric associated with image
def image_colorfulness(image):
  # split the image into its respective RGB components
  (B, G, R) = cv2.split(image.astype("float"))

  # compute rg = R - G
  rg = np.absolute(R - G)

  # compute yb = 0.5 * (R + G) - B
  yb = np.absolute(0.5 * (R + G) - B)

  # compute the mean and standard deviation of both `rg` and `yb`
  (rgMean, rgStd) = (np.mean(rg), np.std(rg))
  (ybMean, ybStd) = (np.mean(yb), np.std(yb))

  # combine the mean and standard deviations
  stdRoot = np.sqrt((rgStd ** 2) + (ybStd ** 2))
  meanRoot = np.sqrt((rgMean ** 2) + (ybMean ** 2))

  # derive the "colorfulness" metric and return it
  return stdRoot + (0.3 * meanRoot)

if __name__ == "__main__":

  # Parse arguments
  ap = argparse.ArgumentParser()
  ap.add_argument("-i", "--images", required = True, help = "Path to input directory of images.")
  ap.add_argument("-d", "--db", help = "Postgres connection string. Write to specified DB instead of printing SQL statements.")
  args = vars(ap.parse_args())

  folder_path = args["images"]
  model_file = "data/inception_v3_2016_08_28_frozen.pb"
  label_file = "data/imagenet_slim_labels.txt"
  input_height = 299
  input_width = 299
  input_mean = 0
  input_std = 255
  input_layer = "input"
  output_layer = "InceptionV3/Predictions/Reshape_1"

  # Make postgres connection if DB string is specified
  if(args["db"]):
    conn = psycopg2.connect(args["db"])
    cur = conn.cursor()

  for filename in os.listdir(folder_path):
    artist = filename.split('-')[0]
    artist = artist.replace('_',' ')
    file_path = folder_path + "/" + filename

    # Get the image from disk as a float array of numbers, resized and normalized
    # to the specifications the main graph expects
    graph = load_graph(model_file)
    t = read_tensor_from_image_file(file_path, input_height = input_height, input_width = input_width, input_mean = input_mean, input_std = input_std)

    input_name = "import/" + input_layer
    output_name = "import/" + output_layer
    input_operation = graph.get_operation_by_name(input_name)
    output_operation = graph.get_operation_by_name(output_name)

    # Run the image through the model
    with tf.Session(graph=graph) as sess:
      results = sess.run(output_operation.outputs[0], {input_operation.outputs[0]: t})
    results = np.squeeze(results)

    top_k = results.argsort()[-5:][::-1]

    # Match ranking indices with labels
    labels = load_labels(label_file)

    for i in top_k:
      # Print out formatted SQL statements with object detection results
      # Or directly insert results into DB
      if(args["db"]):
        cur.execute("INSERT INTO artist_object_score SELECT a.id, o.id, %s FROM artist a, object o WHERE a.name = %s and o.label = %s;", (np.asscalar(results[i]), artist, labels[i]))
      else:  
        insertObjectScore = "INSERT INTO artist_object_score SELECT a.id, o.id, " + str(np.asscalar(results[i]))+ " FROM artist a, object o WHERE a.name = '" + artist + "' and o.label = '" + labels[i] + "';"
        print(insertObjectScore)

    # Get the colorfulness rating of the image
    image = cv2.imread(file_path)
    image = imutils.resize(image, width=250)
    colorValue = image_colorfulness(image)

    # Print out formatted SQL statements with colorfulness results
    # Or directly insert results into DB
    if(args["db"]):
      cur.execute("INSERT INTO artist_color_score SELECT a.id, %s FROM artist a WHERE a.name = %s;", (colorValue, artist))
    else:
      insertColorScore = "INSERT INTO artist_color_score SELECT a.id, " + str(colorValue)+ " FROM artist a WHERE a.name = '" + artist + "';"
      print(insertColorScore)

  # Disconnect from DB
  if(args["db"]):
    conn.commit()
    cur.close()
    conn.close()