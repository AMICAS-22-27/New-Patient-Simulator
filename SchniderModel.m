function [PKmodelP, CPmodelP] = SchniderModel(patient)
        %% Schnider Model for Propofol
        %Input:  1) patient
        %Output: 1) PK and PD models for Propofol

age    = patient.age;
height = patient.height;
weight = patient.weight;
lbm = patient.lbm;

%% Model parameters [L]
V1 = 4.27;                                                          
V2 = 18.9 - 0.391 * (age - 53);                                     
V3 = 238;                                                          

%Clearance of compartments [L/min]
Cl1 = 1.89 + 0.0456 * (weight - 77) - 0.0681 * (lbm - 59) + 0.0264 * (height - 177);     
Cl2 = 1.29 - 0.024 * (age - 53);                                   
Cl3 = 0.836;                                                       

%Transfer Rate of Drug, where kij transfer rate from i to j [1/min]
k10 = Cl1 / V1;
k12 = Cl2 / V1;
k13 = Cl3 / V1;
k21 = Cl2 / V2;
k31 = Cl3 / V3; 

%% STATE SPACE PHARMACOKINETIC MODEL PROPOFOL (PK)

%State Matrix
AssP =[-(k10+k12+k13)  k21   k31;
        k12           -k21     0;
        k13              0  -k31];

%Input Matrix
BssP = [1; 0; 0 ];

%Output Matrix
CssP = [ 1 0 0 ] / V1;

%Feedthrough Matrix
DssP = 0;

PKmodelP = ss(AssP , BssP , CssP , DssP);

%% STATE SPACE COMPARTMENT MODEL PROPOFOL (CP)
ke0P = 0.456; % L/min

%equivalence hypothesis
k1eP = ke0P;

%State Matrix
AecP = -ke0P;

%Input Matrix
BecP = k1eP;

%Output Matrix
CecP = 1;

DecP = 0;

CPmodelP = ss(AecP, BecP, CecP, DecP);

end