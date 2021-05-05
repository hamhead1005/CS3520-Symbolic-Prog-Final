%D = Result
%A = Age (60 = 60+)
%SR = Runny-Nose
%SC = Cough
%SF = Fever
%SB = Difficuly-Breathing
%PO = Obesity
%PI = Immunocompromised
%PH = Heart-Condition
%PL = Lung-Disease

check(D) :-
    write('What is your age range?: '),
    read(A),
    write('Do you have a Runny Nose?: '),
    read(SR),
    write('Do you have a Cough?: '),
    read(SC),
    write('Do you have a Fever?: '),
    read(SF),
    write('Do you have Difficulty Breathing?: '),
    read(SB),
    write('Have you been diagnosed with Obesity?: '),
    read(PO),
    write('Have you been diagnosed as Immunocompromised?: '),
    read(PI),
    write('Have you been diagnosed with a Heart Condition?: '),
    read(PH),
    write('Have you been diagnosed with a Lung Disease?: '),
    read(PL), nl,
    write('If "Low" you are ok to stay home.'), nl,
    write('If "Mild" call a Doctor.'), nl,
    write('If "Severe" go to the hospital.'), nl,
    severity(D,A,SR,SC,SF,SB,PO,PI,PH,PL).

%Mapping for those with "Low" Severity%

severity('Low',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    (A=(0-9) ; A=(10-30) ; A=(30-59) ; A=(60)),
    (SR = n; SR=y),
    SC = n,
    SF = n,
    SB = n,
    (PO = y; PO = n),
    PI = n,
    PH = n,
    PL = n,!. %Tested

severity('Low',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    (A=(0-9) ; A=(10-30) ; A=(30-59)),
    (SR = n; SR=y),
    (SC = n; SC = y),
    SF = n,
    SB = n,
    (PO = y; PO = n),
    PI = n,
   (PH = n; PH = y),
    PL = n,!. %Tested

severity('Low',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    (A=(0-9) ; A=(10-30) ; A=(30-59)),
    (SR = n; SR=y),
    (SC = n),
    SF = n,
    SB = n,
    (PO = y; PO = n),
    (PI = n; PI = y),
   (PH = n; PH = y),
    (PL = n; PL = y),!.

severity('Low',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    (A=(0-9)),
    (SR = n; SR=y),
    (SC = n; SC = y),
    (SF = n; SF = y),
    (SB = n),
    (PO = y; PO = n),
    (PI = n),
    (PH = n),
    (PL = n),!.

%Mapping for those with "Mild" Severity%

severity('Mild',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    (A=(0-9)),
    (SR = n; SR=y),
    (SC = y),
    (SF = y),
    (SB = n),
    (PO = y; PO = n),
    (PI = n; PI = y),
    (PH = n; PI = y),
    (PL = n),!.

severity('Mild',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    (A=(10-30)),
    (SR=y),
    (SC = y),
    (SF = y),
    (SB = n),
    (PO = y; PO = n),
    (PI = n),
    (PH = n),
    (PL = n),!.

severity('Mild',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    (A=(10-30)),
    (SR=y),
    (SC = y),
    (SF = y),
    (SB = n),
    (PO = y; PO = n),
    (PI = n),
    (PH = y),
    (PL = n),!. %tested

severity('Mild',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    (A=(30-59)),
    (SR=y; SR = n),
    (SC = y),
    (SF = y),
    (SB = n),
    (PO = y; PO = n),
    (PI = y),
    (PH = n; PH = y),
    (PL = n),!. %tested

severity('Mild',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    (A=(60)),
    (SR=y; SR = n),
    (SC = y),
    (SF = n),
    (SB = n),
    (PO = y; PO = n),
    (PI = n),
    (PH = n),
    (PL = n),!.

severity('Mild',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    (A=(60)),
    (SR=y),
    (SC = y; SC = n),
    (SF = n),
    (SB = n),
    (PO = y),
    (PI = y),
    (PH = n),
    (PL = n),!.

severity('Mild',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    (A=(30-59); A = 60),
    (SR=y),
    (SC = y),
    (SF = n),
    (SB = n),
    (PO = y),
    (PI = y),
    (PH = y),
    (PL = n; PL = y),!.

%Mapping for those with "Severe" Severity%

severity('Severe',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    A=(60),
    (SR = n; SR=y),
    SC = y,
    (SF = n; SF = y),
    SB = y,
    (PO = y; PO = n),
    (PI = n; PI = y),
    (PH = n; PH = y),
    PL = y,!. %Tested

severity('Severe',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    A=(60),
    (SR=y),
    (SC = y; SC = n),
    (SF = y),
    (SB = y; SB = n),
    (PO = y),
    (PI = y; PI = n),
    (PH = y),
    (PL = n),!. %Tested

severity('Severe',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    A=(60),
    (SR=y; SR = n),
    (SC = y),
    (SF = y; SF = n),
    (SB = y),
    (PO = y; PO = n),
    (PI = y; PI = n),
    (PH = y; PH = n),
    (PL = y),!.

severity('Severe',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    A=(60),
    (SR = n),
    (SC = n),
    (SF = y),
    (SB = y; SB = n),
    (PO = y; PO = n),
    (PI = y),
    (PH = n),
    (PL = n),!.

severity('Severe',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    A=(60),
    (SR = n; SR = y),
    (SC = y),
    (SF = y; SF = n),
    (SB = y),
    (PO = y; PO = n),
    (PI = y),
    (PH = y),
    (PL = n; PL = y),!.

severity('Severe',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    A=(60),
    (SR = n; SR = y),
    (SC = y; SC = n),
    (SF = y; SF = n),
    (SB = y),
    (PO = y; PO = n),
    (PI = y; PI = n),
    (PH = y; PH = n),
    (PL = n; PL = y),!.

% Fever with at least 1 pre Condition (60)
severity('Severe',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    A=(60),
    (SR = n; SR = y),
    (SC = y; SC = n),
    (SF = y),
    (SB = n),
    (PO = y),
    (PI = n),
    (PH = n),
    (PL = n),!.

severity('Severe',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    A=(60),
    (SR = n; SR = y),
    (SC = y; SC = n),
    (SF = y),
    (SB = n),
    (PO = n),
    (PI = y),
    (PH = n),
    (PL = n),!.

severity('Severe',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    A=(60),
    (SR = n; SR = y),
    (SC = y; SC = n),
    (SF = y),
    (SB = n),
    (PO = n),
    (PI = n),
    (PH = y),
    (PL = n),!.

severity('Severe',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    A=(60),
    (SR = n; SR = y),
    (SC = y; SC = n),
    (SF = y),
    (SB = n),
    (PO = n),
    (PI = n),
    (PH = n),
    (PL = y),!.
%end Fever with 1 PreCondition (60)


severity('Severe',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    A=(0-9),
    (SR=y),
    (SC = y),
    (SF = y),
    (SB = y),
    (PO = y; PO = n),
    (PI = y),
    (PH = n; PH = y),
    (PL = y),!. %Tested
