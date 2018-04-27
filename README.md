# aesthetics-match
Match similar musical artists based on visual aesthetics

## Prerequisites
### Packages
* Python 2.7
* TensorFlow >= 1.7.0
* Psycopg >= 2.7.4
* Pandas >= 0.22.0
* Imutils >= 0.4.6
* OpenCV >= 3.4.0.12

Examples for installing with pip:
```
$ pip install tensorflow
$ pip install imutils
$ pip install opencv-python
$ pip install psycopg2-binary
$ pip install pandas
```
### Model Data
The TensorFlow object detection uses the Inception-v3 model definition and weights. More information can be found in the [TensorFlow Image Recognition Demo](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/examples/label_image). Download the file to the `data` directory in the source tree:
```bash
$ curl -L "https://storage.googleapis.com/download.tensorflow.org/models/inception_v3_2016_08_28_frozen.pb.tar.gz" |
  tar -C data -xz
```
This step is required to run the object detection, optional otherwise.
### Images
A collection of 900 artist images was gathered to calculate similarity scores. The image set can be downloaded [here](https://www.dropbox.com/s/nkm9oosdaet3hsd/images.zip?dl=0).

This step is optional.
