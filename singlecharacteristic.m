clear 
close all

% Setup BLE
list = blelist("Timeout",2);
b = ble("38558A87-1060-AD1A-62CC-57AD41A18DA8");
b.Characteristics

%Access Characteristic within Service UUID
temp = characteristic(b,"30CAE40D-2B16-4606-8949-C82FF7AF2B96","B6F56B47-272B-45D6-8E3D-FB0E5687CDFF");
% Counter for data
time = 1;
%Set up graphs for characteritics
axTemp = axes('XLim', [-inf, inf], 'YLim', [-inf, inf]);
x = xlabel(axTemp, 'Date');
ylabel(axTemp, 'Temperature (degrees)');
subplot(3, 2, 1, axTemp);
hTemp = animatedline(axTemp, 'Marker', 'o', 'MarkerFaceColor', 'green');

%helps break code
f = figure;

%Loop to get data
tic
while time < 101

    % Read Characteristic Values
    datatemp = read(temp);

    
    %Convert temperature from string to double

    %Convert PPG data from int and uint to double
    Counterval= double(typecast(uint8(datatemp), 'double'));

    
    % Update plot with new data
    addpoints(hTemp, time,Counterval);
    drawnow;

    %Increment Time counter
    time = time + 1;

    %If any key is clicked, loop will break
    % if f.CurrentCharacter > 0
    %     break;
    % end

end
toc


