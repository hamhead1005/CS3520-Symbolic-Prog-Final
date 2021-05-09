# CS3520-Symbolic-Prog-Final

COVID Severity Predictor

Description: This Expert System is used to indicate whether someone with covid should a. stay home, b. contact a doctor, c. visit the hospital, based on their age, the symptoms they have and any preconditions they have been diagnosed with. 

Below are the instructions on how to run the program.

1. This program runs on SWI Prolog. First you have to install SWI Prolog.
	- We will focous on windows for now.
	- Download Link: https://www.swi-prolog.org/download/daily/bin/
		- Select the latest version. Download.
	- After you download Run the Executable and follow the install steps.
	
2. Load the COVID_Severity_Predictor.pl program.
	- Start SWI Prolog
	- Click File -> Consult -> find the COVID_Severity_Predictor.pl File.
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
