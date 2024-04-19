from keras.models import load_model
from keras.preprocessing.image import img_to_array
from keras.preprocessing import image
from PIL import Image
import numpy as np
import face_recognition

emotion_labels = ['Angry', 'Disgust', 'Fear', 'Happy', 'Neutral', 'Sad', 'Surprise']

#loads the model
def LoadModel():
    loded_model = load_model(r'model.h5')
    return loded_model

def GetMoodByImage(img,classifier):

    frame = np.array(img)

    # Find face locations using face_recognition
    face_locations = face_recognition.face_locations(frame)

    if len(face_locations) == 0:
        return "None"

    for (top, right, bottom, left) in face_locations:
        # Extract and preprocess the face region
        face_frame = frame[top:bottom, left:right]

        # Resize the face to match the input size of the model
        face_frame = Image.fromarray(face_frame).resize((48, 48))

        # Convert the face to grayscale
        face_frame_gray = face_frame.convert('L')

        roi = np.array(face_frame_gray).astype('float') / 255.0
        roi = img_to_array(roi)
        roi = np.expand_dims(roi, axis=0)

        # Make emotion prediction
        prediction = classifier.predict(roi)[0]
        label = emotion_labels[prediction.argmax()]

        return label


#getting the mood using image path
def GetMoodByImagePath(classifier,imgPath="angry.jpeg"):
    # Specify the path to image
    image_path = imgPath

    # Load the image using PIL
    img = Image.open(image_path)
    print(img)
    frame = np.array(img)

    # Find face locations using face_recognition
    face_locations = face_recognition.face_locations(frame)


    for (top, right, bottom, left) in face_locations:
        # Extract and preprocess the face region
        face_frame = frame[top:bottom, left:right]

        # Resize the face to match the input size of the model
        face_frame = Image.fromarray(face_frame).resize((48, 48))

        # Convert the face to grayscale
        face_frame_gray = face_frame.convert('L')

        roi = np.array(face_frame_gray).astype('float') / 255.0
        roi = img_to_array(roi)
        roi = np.expand_dims(roi, axis=0)

        # Make emotion prediction
        prediction = classifier.predict(roi)[0]
        label = emotion_labels[prediction.argmax()]

        return label





