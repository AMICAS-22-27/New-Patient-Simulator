%% Propofol 
[PKmodelP, CPmodelP] = SchniderModel(patient);

%% Remifentanil
[PKmodelR, CPmodelR] = MintoModel(patient);

%% Hill Functions for Propofol and Remifentanil
% Hill function params from Surface Model paper Erhan

% Minto Model parameters
E0_M = 93.97;
Emax_M = E0_M;
C50P_M = 7.53; 
C50R_M = 160.25;
beta_M = 10.74;
gamma_M = 4.13;

% Greco Model parameters
E0_G = 93.97;
Emax_G = E0_G;
C50P_G = 7.66; 
C50R_G = 149.62;
gamma_G = 4.07;
alpha_G = 15.03;

% Reduced Greco Model parameters
E0_RG = 93.97;
Emax_RG = E0_RG;
C50P_RG = 8.26; 
gamma_RG = 3.59;
alpha_RG = 0.33;

%% RASS - take this with a grain of salt
% Remifentanil effect site concentration to RASS
k1r = 0.81; k0r = 0.81;

sysRASS1 = tf(1,[k1r*15 k0r]);
sysRASS2 = tf(-2, [1 2]);

%% Neuromuscular blockade (NMB)
% Atracurium input to effect site concentration - Wiener model
k1a = 1; k2a = 4; k3a = 10; alphaNMB = 0.0374;
sysNMB=zpk([],[-k1a*alphaNMB, -k2a*alphaNMB, -k3a*alphaNMB],k1a*k2a*k3a*alphaNMB^3); 

% Hill Atracurium
gammaN = 2.6677; C50N = 3.2425;