function Patients = initialize_patients(database_type)
    if database_type == 1
        load patient_database12.mat % change here for other patient database
    else
        load patient_database24.mat
    end

    Patients = [];
    for i = 1 : size(patients,1)
        age = patients(i,1);
        height = patients(i,2);
        weight = patients(i,3);
        sex = patients(i,4);

        Patients = [Patients; Patient(i, age, height, weight, sex)];
    end
end