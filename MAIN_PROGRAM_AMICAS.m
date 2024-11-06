                            % MAIN PROGRAM FOR BENCHMARK PATIENT SIMULATOR
                                       % Ghent University, MAY 2024
                                       % ERC AMICAS 2022-2027

clearvars; clear memory; close all; clc;

% variable initialization
BIS_all= []; RASS_all = []; CO_all = []; MAP_all = []; NMB_all = [];  

Ts = 5/60; % sampling time 5 seconds (5/60 min)
ST = 0.1*Ts; % simulation step size 

% initialize patient independent models
hemodyn_model_AMICAS      % hemodynamic models
dist_model_AMICAS         % disturbance models

%% Choose patient database -> database_type = 1 (for 12 patient database - young patients), database_type = 2 (for 24 patient database - old patients)
database_type = 1;
Patients = initialize_patients(database_type);
[noOfPatients,~] = size(Patients); 

%% Choose simulation time (min) - See user manual
Tsim = 300; 

%% Choose input values
Propofol = 0.2;       % [mg/kg/min] 
Remifentanil = 0;     % [ug/kg/min] 
Atracurium = 0;       % [ug/kg/min] 
Dopamine = 0;         % [ug/kg/min] 
SNP = 0;              % [ug/kg/min]

initialize_inputs;

%% Choose surface model type ->  RSM_type=1 (for Greco) / RSM_type=2 (for Minto) / RSM_type=3 (for Reduced Greco)
RSM_type = 1;

%% Choose disturbance profile -> See user manual
Dist_type = 1;

%% Choose anesthesiologist in loop or not -> Anest_loop = 1 / Anest_loop = 2 
Anest_loop = 1;

%% run simulation for every patient

for index = 1 : 1 %noOfPatients
    patient = Patients(index);

    % Initialise patient dependent model
    anesthesia_model_AMICAS   % anesthetic models
    
    % run simulation
    sim('simulator_AMICAS_M2022a.slx');
    
    % save variables
    BIS_all = [BIS_all, BIS];
    RASS_all = [RASS_all, RASS]; 
    CO_all = [CO_all, CO]; 
    MAP_all = [MAP_all, MAP]; 
    NMB_all = [NMB_all, NMB];
    
end

%% Results - use plotValues(signal, type, safetyLimits - bool, showLegend - bool)

figure; 
subplot(3,2,1)
plotValues(BIS_all, OutputSignalType.BIS, false, false);
subplot(3,2,2) 
plotValues(RASS_all, OutputSignalType.RASS, false, false);
subplot(3,2,3) 
plotValues(CO_all, OutputSignalType.CO, false, false);
subplot(3,2,4)
plotValues(MAP_all, OutputSignalType.MAP, false, false);
subplot(3,2,5) 
plotValues(NMB_all, OutputSignalType.NMB, false, false);


