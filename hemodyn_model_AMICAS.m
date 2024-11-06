%% Initialisation of hemodynamic models

%% Set basis MAP and CO
Cobasis = 5; MAPbasis = 80;

%% Interaction Prop to hemodynamic

%Interaction from Propofol to CO
k1Pco = 0.81; k0Pco = 0.81; E0Pco = 5; EmaxPco = 5; gainPco=10; gammaPco = 4.5; C50Pco = 8;

%Interaction model from Propofol to MAP
k1Pmap = 0.61; k0Pmap = 0.81; E0Pmap = 5; EmaxPmap = 5; gainPmap=15; gammaPmap = 4.5; C50Pmap = 6;

%% Interaction Remi to hemodynamic
%Interaction model from Remi to CO
k1Rco = 0.51; k0Rco = 0.51; E0Rco = 15; EmaxRco = 5; gainRco=10; gammaRco = 4.5; C50Rco = 12;

%Interaction model from Remi to MAP
k1Rmap = 0.31; k0Rmap = 0.31; E0Rmap = 70; EmaxRmap = 70; gainRmap=10; gammaRmap = 4.5; C50Rmap = 17;
% k1Rmap = 0.81; k0Rmap = 0.81; E0Rmap = 70; EmaxRmap = 70; gainRmap=15; gammaRmap = 4.5; C50Rmap = 17;

%% Hemodynamic model for a nominal patient
K11 = 5; tau11 = 300; T11 = 60; K21 = 12; tau21 = 150; T21 = 50; %dopamine
K12 = 3; tau12 = 40; T12 = 60; K22 = -15; tau22 = 40; T22 = 50; %snp

s = tf('s');
g11 = ((K11)/(1+tau11*s))*(1)/(1+T11*s+(T11*s)^2/2+(T11*s)^3/6 + (T11*s)^4/24);
g12 = ((K12)/(1+tau12*s))*(1)/(1+T12*s+(T12*s)^2/2+(T12*s)^3/6 + (T12*s)^4/24);
g21 = ((K21)/(1+tau21*s))*(1)/(1+T21*s+(T21*s)^2/2+(T21*s)^3/6 + (T21*s)^4/24);
g22 = ((K22)/(1+tau22*s))*(1)/(1+T22*s+(T22*s)^2/2+(T22*s)^3/6 + (T22*s)^4/24);