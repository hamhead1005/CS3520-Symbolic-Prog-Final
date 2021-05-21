
import numpy as np
from numpy import loadtxt
import matplotlib.pyplot as plt
from keras.models import Sequential
from keras.layers import Dense
from keras.optimizers import SGD
from keras.optimizers import RMSprop

# Open the file of dataset and preprocess the data
with open('dataset1.csv','r') as infile:
    # Get the header line
    header = infile.readline().rstrip().split(',')
    data = []
    # Read it in
    for line in infile:
        data.append([float(s) for s in line.rstrip().split(',')])
    # Turn the list of lists into a numpy array
    data = np.array(data)


# Split the data into input (X) and output (y) variables
X = data[:,0:8]
y = data[:,8]

# Split the data into training set and validation set
from sklearn.model_selection import train_test_split
X_train,X_test,y_train,y_test = train_test_split(X,y,test_size = 0.2)

# Define the keras model
model = Sequential()
# add the first layer 
model.add(Dense(15, input_dim=8, activation='relu'))
# add the second layer
model.add(Dense(12, activation='relu'))
# add the output layer
model.add(Dense(1, activation='sigmoid'))

# Different optimizers for experiment: sgd = SGD(lr=0.01, decay=1e-6, momentum=0.9, nesterov=True), 'adam'
#sgd = SGD(lr=0.01, decay=1e-6, momentum=0.9, nesterov=True) optimizer = RMSprop(lr=2e-4)
# Compile the keras model
model.compile(loss = 'binary_crossentropy', optimizer = RMSprop(lr=2e-4) , metrics = ['accuracy'])


# Fit the model
# epochos and batch_size are subject to change with different-size dataset files.
history = model.fit(X_train, y_train, validation_data = (X_test, y_test), epochs = 100, batch_size = 25, verbose = 0)

# Make class predictions with the model
#predictions = (model.predict(X) > 0.5).astype("int32")

# Evaluate the model
_, accuracy = model.evaluate(X, y, verbose = 0)

#accuracy_average = np.mean(predictions == y)
print('The accuracy of the model is: %.2f percent' % (accuracy*100))


# Prompt the new user's input
print('\nWelcome to Covid-19 Prediction Tool!')

# Allow the user to try as many times as he wants
while True: 
    print("\nPlease answer the following questions with either 'yes' or 'no'. \n")
          
    new_user = []

    for i in range(8):
        val = input('Are you getting ' + header[i] + '? ')
        if val == 'yes':
            new_user.append(1)
        else:
            new_user.append(0)
            

    pred = model.predict(np.array([new_user], dtype = np.float32))

    # Inital purpose is to get numerical value.
    print('\nThe probability you get covid estimated by the model is: %.2f percent.' % ((1-pred[0][0])*100))

    # In the dataset, the result column entry is 0 if the person has got covid (labeled as None_Experiencing).
    prob = 1 - pred
    # Categorize the case into 3 severity levels. The range for each level was chosen after many case testing.
    if prob < 0.5:
        print('The case is Low.')
    if prob >= 0.5 and prob < 0.9:
        print('The case is Mild.')
    if prob >= 0.9:
        print('The case is Severe.')

    print('\nWould you like to make another prediction?')
    s = input("Please enter either 'yes' or 'no': ")
    if s == 'no':
        break

# List all data in history
#   print(history.history.keys())
# Summarize history for accuracy
plt.plot(history.history['accuracy'])
plt.plot(history.history['val_accuracy'])
plt.title('Model Accuracy')
plt.ylabel('Accuracy')
plt.xlabel('Epoch')
plt.legend(['Training', 'Validation'], loc='upper left')
plt.show()
# Summarize history for loss
plt.plot(history.history['loss'])
plt.plot(history.history['val_loss'])
plt.title('Model Loss')
plt.ylabel('Loss')
plt.xlabel('Epoch')
plt.legend(['Training', 'Validation'], loc='upper left')
plt.show()
