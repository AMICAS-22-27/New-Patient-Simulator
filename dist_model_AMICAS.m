%% Initialisation of disturbance models
%The disturbance is a signal tailored for surgical actions and is the
%stimulus which will be filtered through the effect-site model.
%Additionally, there is a bolus from the anesthesiologist modelled.

%% 1- No Disturbance
D_no_dist = [zeros(1,500)];
time = 5*[1:length(D_no_dist)]/60; % seconds to minutes

no_disturbance = timeseries(D_no_dist, time); %% 

% It will be updated

%% Anesthesiologist in the loop or not
bolus = 1; %[mg/s]
anestS = [zeros(1,80) bolus*ones(1,20) zeros(1,60) bolus*ones(1,20)...
    zeros(1,40) [0:-(bolus/10):-bolus] zeros(1,30) bolus*ones(1,10)...
    zeros(1,130) bolus*ones(1,20) zeros(1,60) bolus*ones(1,20)...
    zeros(1,220) bolus*ones(1,20) zeros(1,310)] ;
no_anest = zeros(1, length(anestS));
