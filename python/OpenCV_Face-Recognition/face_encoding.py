from imutils import paths
import face_recognition
import pickle
import cv2
import os


#getting path for each file from folder (it should contain images of various persons)
imagePaths = list(paths.list_images('Images'))
knownEncodings = []
knownNames = []

#loop over paths
for (i, imagePaths) in enumerate(imagePaths):
    #extract person name from image path
    name = imagePath.split(os.path.sep)[-2]
    #load the input image and convert it to dlib ordering
    image = cv2.imread(imagePath)
    rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    #use face_recognition for faces location
    boxes = face_recognition.face_locations(rgb, model='hog0')
    #compute facial embedding for the face
    encodings = face_recognition.face_encodings(rgb, boxes)
    #loop over encodings
    for encoding in encodings:
        knownEncodings.append(encoding)
        knownNames.append(name)

#save encoding along appropriate names in dict data
data = {"encodings": knownEncodings, "names": knownNames}

#use pickle to save data for later use
f = open("face_encoding", "wb")
f.write(pickle.dumps(data))
f.close()