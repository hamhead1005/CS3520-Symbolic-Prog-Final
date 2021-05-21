# CS3520-Symbolic-Prog-Final

COVID Severity Predictor

Description: This Expert System is used to indicate whether someone with covid should a. stay home, b. contact a doctor, c. visit the hospital, based on their age, the symptoms they have and any preconditions they have been diagnosed with. 

I. PROLOG PROGRAM

Below are the instructions on how to run the program.

1. This program runs on SWI Prolog. First you have to install SWI Prolog.
	- We will focous on windows for now.
	- Download Link: https://www.swi-prolog.org/download/daily/bin/
		- Select the latest version. Download.
	- After you download Run the Executable and follow the install steps.
	
2. Load the COVID_Severity_Predictor.pl program.
	- Start SWI Prolog
	- Click File -> Consult -> find the COVID_Severity_Predictor.pl File that you downloaded from our git-hub.
		- If program loaded correctly you will see a green message with the directory of the file the time it took to compile and x amount of clauses.
		
3. Using the Program.
	- Note: Every Command is ended/entered with a '.'
	
	- Type Check(Case). to start the program.
	= Enter your age Range.
		- Options include:
			- 0-9.
			- 10-59.
			- Note: use 60. for ages 60+)
	- Use y. or n. to answer any questions about what symptoms you have.
	- Use y. or n. to answer any questions about what Preconditions you have.
	- The program will then output your case result
		- Case = 'Low'
		- Case = 'Mild'
		- Case = 'Severe'
		- Case = 'False'
		
4. Interpret Results
	- If you get 'Low' you are ok to stay home.
	- If you get 'Mild' you need to contact a doctor.
	- If you get 'Severe' you need to go to the hospital immediately or call for an ambulance.
	- If you get 'False' based on your input a severity could not be determined.
<br/>
II. NEURAL NETWORK MODEL - PYTHON PROGRAM<br/><br/>

The Keras, a high level API of TensorFlow 2 is used in building the neural network model in Python for the purpose of fast experimentation. Keras and TensorFlow 2 are compatible with: <br/>
	- Python 3.5–3.8
	- Ubuntu 16.04 or later
	- Windows 7 or later
	- macOS 10.12.6 (Sierra) or later. <br/>

1. Setup a Python Environment for Deep Learning<br/><br/>
It is highly recommended to use Anaconda for these settings. Downloading Anaconda instructions could be found at https://www.anaconda.com/products/individual.
	- Installing Anaconda already includes scikit-learn Library, but other deep learning libraries needs installing seperately.
	- Install the Theano deep learning library by typing: conda install theano 
	- Install the TensorFlow deep learning library by typing: conda install -c conda-forge tensorflow
	- Install Keras by typing: pip install keras
	
2. Load the Files Related To the Model<br/><br/>
The dataset(modified).cvs is the dataset with only symptoms playing as indicators for the model (from the raw dataset, age ranges, gender, and country were eliminated). <br/>
The raw dataset includes 306K cases; the dataset used in the experiment is 11K-size. <br/>
The running of the program requires keras_network.py and dataset1.cvs files. <br/>
Download those two files and put them in the directory specified when installing Anaconda. <br/>
Then open the Anaconda Prompt and type: python keras_network.py<br/>
It may take up to 5 minutes for the program to get the model ready before prompting inputs from active user. <br/>

3. Interacting with the Program<br/><br/>
Please answer questions relating to symptoms with either "yes" or "no". The program allows the user to get as many trials as he wishes to. <br/>
After printing a result, the program asks if the user wants to get another prediction, and please enter "yes" for continue and "no" otherwise.<br/>

4. Interpret the Results<br/><br/>
The results could be interpreted the same way as the Proglog program does except that the Python program also provides the numerical probability for getting Covid. 

