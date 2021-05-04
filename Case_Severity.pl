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
    write('If "Low" you are ok to stay home. If "Mild" call a Doctor. If "Severe" go to the hospital'),
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
    PL = n,!.

%Mapping for those with "Mild" Severity%

severity('Mild',A,SR,SC,SF,SB,PO,PI,PH,PL) :-
    (A=(10-30) ; A=(30-59) ; A=(60)),
    (SR = n; SR = y),
    SC = y,
    (SF = y; SR = n),
    SB = n,
    (PO = n; PO = y),
    PI = n,
    PH = n,
    PL = n,!.

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
    PL = y,!.
