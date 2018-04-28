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
The TensorFlow object detection uses the Inception-v3 model definition and weights. More information can be found in the [TensorFlow Image Recognition Demo](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/examples/label_image). Create the directory `data` and download the file to the directory:
```bash
$ curl -L "https://storage.googleapis.com/download.tensorflow.org/models/inception_v3_2016_08_28_frozen.pb.tar.gz" |
  tar -C data -xz
```
This step is required to run the object detection, optional otherwise.
### Images
A collection of 900 artist images was gathered to calculate object detection and color scores. The image set can be downloaded [here](https://www.dropbox.com/s/nkm9oosdaet3hsd/images.zip?dl=0).

This step is optional.

### Database
Scripts for creating the PostgreSQL tables are located in the db folder. The scripts also contain data for the object and color detection scoring based on the images described in the last section.

This step is optional.

## Usage
### Image Scoring
The image scoring functionality is used to establish a base of object and color metrics for searching. The script score_image.py takes in a set of jpg image files, runs both object detection and 'colorfulness' analysis on each image, and then constructs SQL statements to either directly insert into a specified DB, or print out to the terminal. Each filename must contain the name of the artist, with spaces replaced by underscores and a suffix of “-n”, with n as a numerical value (ie. 'kacey_musgraves-1.jpg').

Usage is simple, run the score_image.py script with a path to an image directory. Example:
```
$ python score_image.py -i data/images
```
#### Command line arguments
```
usage: score_image.py [-h] -i IMAGES [-d DB]

optional arguments:
  -h, --help            show this help message and exit
  -i IMAGES, --images IMAGES
                        path to input directory of images
  -d DB, --db DB        optional PostgreSQL connection string - write to
                        specified DB instead of printing SQL statements.
```
### Artist Matching
The search_artist.py script takes in one artist name, matches them all other loaded artists based on common objects and 'colorfulness', and returns the top five ranked artists, as well as their corresponding scores. A loaded database with metrics based on 90 artists and 900 images is available. The 90 artists are listed in file artist_list.txt. The script connects automatically to the PostgreSQL DB on ElephantSQL. If another DB is desired, the connection string at the top of the script can be modified.

Run the search_artist.py script with the name of one of the listed artists. Running the script with no arguments will also return the list of available artists. Example of artist search:
```
$ python search_artist.py Perfume
```
## Acknowledgments
* Object detection uses TensorFlow and is based off the [TensorFlow C++ and Python Image Recognition Demo](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/examples/label_image)
* Image 'colorfulness' calculations were based off [Computing image “colorfulness” with OpenCV and Python](https://www.pyimagesearch.com/2017/06/05/computing-image-colorfulness-with-opencv-and-python/) by Adrian Rosebrock
