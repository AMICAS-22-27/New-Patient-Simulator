%% Initialisation of disturbance models
%The disturbance is a signal tailored for surgical actions and is the
%stimulus which will be filtered through the effect-site model.
%Additionally, there is a bolus from the anesthesiologist modelled.

%% 1- No Disturbance
D_no_dist = [zeros(1,500)];
time = 5*[1:length(D_no_dist)]/60; % seconds to minutes

no_disturbance = timeseries(D_no_dist, time); %% 

%% 2- Circumcision Surgery Disturbance Profile (almost 25 min)
D_circum = [zeros(1,24) 30*ones(1,36) zeros(1,6) ...
          5*ones(1,36) 20*ones(1,72) 5*ones(1,12) 25*ones(1,48) ... 
          15*ones(1,60) zeros(1,24)];
D_circum_s = smoothdata(D_circum,"gaussian",30);
time = 5*[0:length(D_circum)-1]/60; % seconds to minutes

circumcision = timeseries(D_circum_s, time); %% 

%% 3 - Knee Arthroscopy (approx 50 min)
D_arth = [zeros(1,36) (30:-5/35:25) zeros(1,36) 20*ones(1,60) ...
       zeros(1,12) 15*ones(1,120) 10*ones(1,120) ...
       15*ones(1,60) 5*ones(1,75) zeros(1,24)];
D_arth_s = smoothdata(D_arth,"gaussian",30);
time = 5*[0:length(D_arth)-1]/60; % seconds to minutes

arthroscopy = timeseries(D_arth_s, time);

%% 4- Epididymal Cystectomy (approx - 40 min)
D_epi = [zeros(1,36) 30*ones(1,36) zeros(1,24) ...
          20*ones(1,36) zeros(1,24) 25*ones(1,120) zeros(1,24) 5*ones(1,36) ...
          zeros(1,24) 10*ones(1,60) zeros(1,48)];
D_epi_s = smoothdata(D_epi,"gaussian",20);
time = 5*[0:length(D_epi)-1]/60; % seconds to minutes

epi_cystectomy = timeseries(D_epi_s, time);

%% 5 - Scrotal Exploration (approx 60 min)
D_scro = [zeros(1,36) 30*ones(1,36) zeros(1,24) ...
          20*ones(1,48) 5*ones(1,36) zeros(1,24) 15*ones(1,96) 25*ones(1,120) ...
          25*ones(1,120) 10*ones(1,96) 10*ones(1,96) zeros(1,24)];
D_scro_s = smoothdata(D_scro,"gaussian",40);
time = 5*[0:length(D_scro)-1]/60; % seconds to minutes

scrotal_exp = timeseries(D_scro_s, time);

%% 6- Myomectomy - (between 2-3 hours)
D_myo = [zeros(1,12) 30*ones(1,36) zeros(1,60) ...
    20*ones(1,36) 25*ones(1,300) 20*ones(1,24) 25*ones(1,360) 20*ones(1,36)...
    zeros(1,36) 20*ones(1,360) 10*ones(1,120) zeros(1,96) 20*ones(1,36) zeros(1,24)];
D_myo_s = smoothdata(D_myo,"gaussian",40);
time = 5*[0:length(D_myo)-1]/60; % seconds to minutes

myomectomy = timeseries(D_myo_s, time);

%% 7- Urethroplasty - (between 2-3 hours)
D_Ureth = [zeros(1,12) 30*ones(1,36) zeros(1,36) ...
          10*ones(1,120) 20*ones(1,240) zeros(1,120) 5*ones(1,240) 20*ones(1,240) 10*ones(1,240) ...
          zeros(1,120) 5*ones(1,360) zeros(1,60)];
D_Ureth_s = smoothdata(D_Ureth,"gaussian",60);
time = 5*[0:length(D_Ureth)-1]/60; % seconds to minutes

urethroplasty = timeseries(D_Ureth_s, time);

%% 8- Breast augmentation (almost 110-120 min)
D_mam = [zeros(1,36) 30*ones(1,36) 5*ones(1,60) zeros(1,72) 20*ones(1,60) ...
    15*ones(1,300) 10*ones(1,180) 10*ones(1,240) 5*ones(1,120) 5*ones(1,180) zeros(1,60)];
D_mam_s = smoothdata(D_mam,"gaussian",60);
time = 5*[0:length(D_mam)-1]/60; % seconds to minutes

mammoplasty = timeseries(D_mam_s, time);

%% 9- Open Cholecystectomy (approx 100 min)
D_cys = [zeros(1,36) 30*ones(1,72) zeros(1,36) 20*ones(1,60) zeros(1,72) ...
     5*ones(1,96) 20*ones(1,240) 10*ones(1,240) zeros(1,96) 5*ones(1,240) ...
     zeros(1,36)];
D_cys_s = smoothdata(D_cys,"gaussian",60);
time = 5*[0:length(D_cys)-1]/60; % seconds to minutes

cholecystectomy = timeseries(D_cys_s, time);

%% 10 - Vasovasostomy (approx 3h)
D_vaso = [zeros(1,36) 30*ones(1,36) zeros(1,36) ...
          20*ones(1,60) zeros(1,36) 15*ones(1,180) ...
          20*ones(1,180) zeros(1,60) 5*ones(1,480) zeros(1,180) 5*ones(1,180) ...
          zeros(1,36) 5*ones(1,180) zeros(1,180) 5*ones(1,180) zeros(1,120)];
D_vaso_s = smoothdata(D_vaso,"gaussian",40);
time = 5*[0:length(D_vaso)-1]/60; % seconds to minutes

vasovasostomy = timeseries(D_vaso_s, time);

%% 11- Hysterectomy (approx - 2 hours)
D_hys = [zeros(1,36) 30*ones(1,36) zeros(1,60) ...
    20*ones(1,36) zeros(1,96) 20*ones(1,240) 25*ones(1,24) zeros(1,36) ...
    15*ones(1,180) zeros(1,180) 15*ones(1,60) zeros(1,36) 10*ones(1,36) ...
    zeros(1,60) 10*ones(1,36) zeros(1,36) 10*ones(1,36) zeros(1,84) ...
    10*ones(1,60) zeros(1,60)];
D_hys_s = smoothdata(D_hys,"gaussian",30);
time = 5*[0:length(D_hys)-1]/60; % seconds to minutes

hysterectomy = timeseries(D_hys_s, time);

%% Anesthesiologist in the loop or not
bolus = 1; %[mg/s]
anestS = [zeros(1,80) bolus*ones(1,20) zeros(1,60) bolus*ones(1,20)...
    zeros(1,40) [0:-(bolus/10):-bolus] zeros(1,30) bolus*ones(1,10)...
    zeros(1,130) bolus*ones(1,20) zeros(1,60) bolus*ones(1,20)...
    zeros(1,220) bolus*ones(1,20) zeros(1,310)] ;
no_anest = zeros(1, length(anestS));
