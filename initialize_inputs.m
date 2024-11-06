inputStepP = [zeros(1,10) Propofol * ones(1,Tsim)]; %% 
inputStepR = [zeros(1,10) Remifentanil * ones(1,Tsim)]; %% 
inputStepA = [zeros(1,10) Atracurium * ones(1,Tsim)]; %% 
inputStepD = [zeros(1,10) Dopamine * ones(1,Tsim)]; %% 
inputStepS = [zeros(1,10) SNP * ones(1,Tsim)]; %% 

% input profiles
Propinput=timeseries(inputStepP); 
Reminput=timeseries(inputStepR); 
Atracinput=timeseries(inputStepA); 
Dopinput=timeseries(inputStepD); 
SNPinput=timeseries(inputStepS); 
anestS=timeseries(anestS); 
no_anest=timeseries(no_anest);
