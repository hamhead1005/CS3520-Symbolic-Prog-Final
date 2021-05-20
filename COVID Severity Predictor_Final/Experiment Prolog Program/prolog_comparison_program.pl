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
    write('Do you have a Fever?: '),
    read(SF),
    write('Do you feel Severly-tired?: '),
    read(ST),
    write('Do you have a Dry-Cough?: '),
    read(SC),
    write('Do you have Difficulty Breathing?: '),
    read(SB),
    write('Do you have Diarrhea?: '),
    read(SD),
    write('Do you have a Sore-Throat?: '),
    read(SS),
    write('Do you have Nasal Congestion?: '),
    read(SN),
    write('Do you have Runny Nose?: '),
    read(SR),


    write('If "Low" you are ok to stay home.'), nl,
    write('If "Mild" call a Doctor.'), nl,
    write('If "Severe" go to the hospital.'), nl,
    severity(D,SF,ST,SC,SB,SD,SS,SN,SR).

%Mapping for those with "Low" Severity

severity('Low',SF,ST,SC,SB,SD,SS,SN,SR) :-
    (SF = n),
    (ST = n; ST = y),
    (SC = n),
    (SB = n),
    (SD = n; SD = y),
    (SS = n; SS = y),
    (SN = n),
    (SR = n; SR = y),!.

%Mapping for those with "Mild" Severity

severity('Mild',SF,ST,SC,SB,SD,SS,SN,SR) :-
    (SF = n),
    (ST = y; ST = n),
    (SC = y),
    (SB = n),
    (SD = y; SD = n),
    (SS = y),
    (SN = y; SN = n),
    (SR = y; SR = n),!.

severity('Mild',SF,ST,SC,SB,SD,SS,SN,SR) :-
    (SF = y),
    (ST = y),
    (SC = y),
    (SB = y),
    (SD = n),
    (SS = n),
    (SN = y; SN = n),
    (SR = y; SR = n),!.

%Mapping for those with "Severe" Severity

severity('Severe',SF,ST,SC,SB,SD,SS,SN,SR) :-
    (SF = y),
    (ST = y; ST = n),
    (SC = y),
    (SB = y),
    (SD = y; SD = n),
    (SS = y),
    (SN = y; SN = n),
    (SR = y; SR = n),!.
