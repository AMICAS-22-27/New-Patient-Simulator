function [PKmodelR, CPmodelR] = MintoModel(patient)
            %% Minto Model for Propofol
                    %Input:  1) patient
                    %Output: 1) PK and PD models for Remifentanil

age = patient.age;
lbm = patient.lbm;

%% MODEL PARAMETERS REMIFENTANIL

%Volume of the compartments [L]
VcR = 5.1 - 0.0201 * (age - 40) + 0.072 * (lbm - 55);                
V2R = 9.82 - 0.0811 * (age - 40) + 0.108 * (lbm - 55);               
V3R = 5.42;                                                          

%Clearance of compartments [L/min]
Cl1R = 2.6 - 0.0162 * (age - 40) + 0.0191 * (lbm - 55);             
Cl2R = 2.05 - 0.0301 * (age - 40);                                  
Cl3R = 0.076 - 0.00113 * (age - 40);                                

%Transfer Rate of Drug kij transfer rate from i to j [1/min]
k10R = Cl1R / VcR;                                          
k12R = Cl2R / VcR;                                          
k13R = Cl3R / VcR;                                          
k21R = Cl2R / V2R;                                         
k31R = Cl3R / V3R;                                          

%% STATE SPACE PHARMACOKINETIC MODEL REMIFENTANIL(PK)

%State Matrix
AssR =[-(k10R+k12R+k13R)  k21R   k31R;
        k12R           -k21R     0;
        k13R              0  -k31R];

%Input Matrix
BssR = [ 1; 0; 0 ];

%Output Matrix
CssR = [ 1 0 0 ] / VcR;

%Feedthrough Matrix
DssR = 0;

PKmodelR = ss(AssR , BssR , CssR , DssR);

%% STATE SPACE COMPARTMENT MODEL REMIFENTANIL (CP)

ke0R = (0.595 - 0.007 * (age - 40)); % L/min
k1eR = ke0R;

%State Matrix
AecR = -ke0R;

%Input Matrix
BecR = k1eR;

%Output Matrix
CecR = 1;

DecR = 0;

CPmodelR = ss( AecR , BecR , CecR , DecR );

end