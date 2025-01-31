%% Initialisation of disturbance models
%The disturbance is a signal tailored for surgical actions and is the
%stimulus which will be filtered through the effect-site model.
%Additionally, there is a bolus from the anesthesiologist modelled.

%% 1- No Disturbance
D_no_dist = [zeros(1,500)];
time = 5*[1:length(D_no_dist)]/60; % seconds to minutes

no_disturbance = timeseries(D_no_dist, time); %% 

%% 2- Disturbance Profile 1 (almost 80 min)
dist_1 = [zeros(1,100) 20*ones(1,50) ...
                zeros(1,50) 20*ones(1,50) ...
                [0:-1:-20] 20*ones(1,50) ...
                zeros(1,100) 20*ones(1,20) ...
                zeros(1,60) 20*ones(1,50) ...
                zeros(1,200) 20*ones(1,100) zeros(1,150)];

time = 5*[0:length(dist_1)-1]/60; % seconds to minutes
disturbance_1 = timeseries(dist_1, time); %% 

%% 3 - Disturbance Profile 2 (approx 50 min)
dist_2 =[0*ones(1,60) ... % No stimulus (5 min)
                    20*ones(1,24) ... % (A) arousal due to intubation (3 min)
                    [20:-20/11:0] ...
                    0*ones(1,24) ... % Tm 10 min -maintainance phase starts
                    0*ones(1,48)  ... % Tm-Tb (4 min)
                    20*ones(1,36) ... % (B) surgical incision followed by a period of no stimulation, 
                    [20:-20/11:0] ...
                    0*ones(1,12) ... 
                    [0:-20/35:-20] ... % Tc-Tb = 8 min, total samples = 8 (3+1+4)
                    20*ones(1,36) ...  % (C) abrupt stimulus after a period of low-level stimulation, 
                    ...               % Td-Tc = 3 min,
                    10*ones(1,84) ...  % (D) onset of a continuous normal surgical stimulation, 
                    ...               % Te-Td = 7 min
                    30*ones(1,12) ...  % (E) shorter but larger stimuli during surgery 
                    10*ones(1,48) ...  % Tf-Te = 5 min
                    30*ones(1,24) ...  % (F) shorter but larger stimuli during surgery 
                    [30:-20/23:10] ...
                    10*ones(1,24) ...  % Tg-Tf = 6 min 
                    30*ones(1,48) ...  % (G) shorter but larger stimuli during surgery 
                    [30:-20/23:10] ...
                    10*ones(1,24) ...  % Th-Tg = 8 min       
                    0*ones(1,24) ...  % end of the surgery
                    ];

time = 5*[0:length(dist_2)-1]/60; % seconds to minutes
disturbance_2 = timeseries(dist_2, time);

%% Anesthesiologist in the loop or not
bolus = 1; %[mg/s]
anestS = [zeros(1,80) bolus*ones(1,20) zeros(1,60) bolus*ones(1,20)...
    zeros(1,40) [0:-(bolus/10):-bolus] zeros(1,30) bolus*ones(1,10)...
    zeros(1,130) bolus*ones(1,20) zeros(1,60) bolus*ones(1,20)...
    zeros(1,220) bolus*ones(1,20) zeros(1,310)] ;
no_anest = zeros(1, length(anestS));
