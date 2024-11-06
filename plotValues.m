function plotValues(timeseriesObject, outputType, showSafetyLimits, showLegend)
    % inputs: timeseriesObject - timeseries
    %         outputType       - 'BIS', 'RASS', 'CO', 'MAP', 'NMB'
    %         showSafetyLimits - bool: displays medical safety values
    %         showLegend       - bool 
    warning('off')

    obj = timeseries2timetable(timeseriesObject);
    plot(obj.Time, obj.Variables); xlabel('Time (min)');

    lowSafetyValue = 0;
    highSafetyValue = -1000;

    objLegend = [];
    if showLegend
        for i = 1 : 2 objLegend = [objLegend; sprintf("Patient %d", i)]; end
        leg = legend(objLegend);
    end

    switch outputType
        case OutputSignalType.BIS
            title('BIS'); ylabel('BIS');
            lowSafetyValue = 40;
            highSafetyValue = 60;

        case OutputSignalType.RASS
            title('RASS'); ylabel('RASS');
            highSafetyValue = -2.5;
            lowSafetyValue = -4;

        case OutputSignalType.CO
            title('CO'); ylabel('CO(l/min)');
            lowSafetyValue = 4.5;
            highSafetyValue = 6;

        case OutputSignalType.MAP
            title('MAP'); ylabel('MAP(mmHg)');
            lowSafetyValue = 70;
            highSafetyValue = 85;

        case OutputSignalType.NMB
            title('NMB'); ylabel('NMB(%)');
            lowSafetyValue = 12;

        otherwise
            disp('Error: Output signal type not implemented');
    end
    
    if showSafetyLimits
        yline(lowSafetyValue, '--b', 'Safety', 'LineWidth', 1.5);
        
        highSafetyValueExists = highSafetyValue ~= -1000;
        if highSafetyValueExists 
            yline(highSafetyValue, '--b', 'Safety', 'LineWidth', 1.5); 
        end

        if showLegend leg.String = cellstr(transpose(objLegend)); end
    end
    
    warning('on')

end