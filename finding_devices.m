% Code for MATLAB connectivity to BLE
clear
% list = blelist("Timeout",3);
% b = ble("99334AD4-17BD-CA77-9D80-F3643826732C");
% 
% 
% b.Characteristics;
% temp = characteristic(b,"30cae40d-2b16-4606-8949-c82ff7af2b96","B6F56B47-272B-45D6-8E3D-FB0E5687CDFF");
% time = 1;
% 
% axTemp = axes('XLim', [0, 50], 'YLim', [0, 50]);
% xlabel(axTemp, 'Data number');
% ylabel(axTemp, 'Temperature (degrees)');
% hTemp = animatedline(axTemp, 'Marker', 'o', 'MarkerFaceColor', 'green');
% 
% for loop = 1:30
%     % Get heart rate data
%     data = read(temp);
%     temperatureVal = char(data(1:5));
%     temperature = str2double(temperatureVal);
% 
%     % Update plot with new data
%     addpoints(hTemp, time, temperature);
%     drawnow;
%     time = time + 1;
% end