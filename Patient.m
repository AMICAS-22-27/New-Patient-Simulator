classdef Patient
    properties (SetAccess = immutable)
        id
        age     % years
        height  % cm
        weight  % kg
        sex     % 1 - male, 2 - female
        bmi
        lbm
    end

    methods
        function obj = Patient(id, age, height, weight, sex)
            obj.id = id;
            obj.age = age;
            obj.height = height;
            obj.weight = weight;
            obj.sex = sex;
            obj.bmi = weight / ((height/100)^2);

            switch sex 
                case 1
                    obj.lbm = 1.1 * weight - 128 * (weight/height)^2; % James Formula for Men
                case 2
                    obj.lbm = 1.07 * weight - 148 * (weight/height)^2; % James Formula for Women
                otherwise
                    disp('Error: undefined gender. You may consider defining new values in Patient.m class')
            end
        end
    end

end