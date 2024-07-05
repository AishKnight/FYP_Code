% Code for MATLAB connectivity to BLE
clear
close all

% Setup BLE

%Starting from a default position.
disp("Sit still for 10 seconds")
countdowntimer = 10;
while countdowntimer > 0 
    disp(countdowntimer)
    pause(1);
    countdowntimer = countdowntimer - 1; 
end

list = blelist("Timeout",5);
b = ble("38558A87-1060-AD1A-62CC-57AD41A18DA8"); %or use address "38558A87-1060-AD1A-62CC-57AD41A18DA8"
b.Characteristics

% %Access Characteristic within Service UUID
FLAGChar = characteristic(b,"30cae40d-2b16-4606-8949-c82ff7af2b96","9763C033-530B-4103-846D-CF294E9A5E95");
tempchar = characteristic(b,"30cae40d-2b16-4606-8949-c82ff7af2b96","B6F56B47-272B-45D6-8E3D-FB0E5687CDFF");
IRchar = characteristic(b,"30cae40d-2b16-4606-8949-c82ff7af2b96","02f3a6f2-6095-4d7a-a7d0-f2c471fecb0e");
Redchar = characteristic(b,"30cae40d-2b16-4606-8949-c82ff7af2b96","cd06f064-2738-4288-8f71-803cdc477dc5");
Coil1Char = characteristic(b,"30cae40d-2b16-4606-8949-c82ff7af2b96","e6530d8f-8bb8-4f2e-b511-347d67af1f75");
Coil2Char = characteristic(b,"30cae40d-2b16-4606-8949-c82ff7af2b96","18055d48-da50-4b74-abb6-4e6b613f2898");
ECGChar = characteristic(b,"30cae40d-2b16-4606-8949-c82ff7af2b96","fbb31c84-4a34-40c9-bbb8-64366848f400");
TimeChar = characteristic(b,"30cae40d-2b16-4606-8949-c82ff7af2b96","7a7e98c2-1f80-4fcb-974e-66546f21af03");

% Arrays to hold data
% temprecent = zeros(3000,1);
% IRrecent = zeros(3000,1);
% Redrecent = zeros(3000,1);
% Coil1recent = zeros(3000,1);
% Coil2recent = zeros(3000,1);
% ECGrecent = zeros(3000,1);
% FLAGrecent = zeros(3000,1);
% timemillisrecent = zeros(3000,1);
data = zeros(3000,8);

figure(10);
axIR = axes('XLim', [-inf, inf], 'YLim', [-inf, inf]);
xlabel(axIR, 'Time (s)');
ylabel(axIR, 'IR');
% subplot(2, 2, 1, axIR);
hIR = animatedline(axIR, 'Marker', 'none', 'MarkerFaceColor', 'blue');
title("IR - Raw Data");

figure(11);

subplot(2, 2, 1);
hRed = animatedline('Color','r','LineWidth',1);
ax1 = gca;          % NEED TO DISTINGUISH UPPER SUBPLOT AND LOWER ONE
ax1.YLim = [0 400000];
% axRed = gca;
xlabel(ax1, 'Time (s)');
ylabel(ax1, 'Red');
title("Red - Raw Data");

% figure(3);

subplot(2, 2, 2);
hCoil1 = animatedline('Color','b','LineWidth',1);
hCoil2 = animatedline('Color','g','LineWidth',1);
ax2 = gca;
ax2.YLim = [0 400000];
legend('Abdomen','Chest')
xlabel(ax2, 'Time (s)');
ylabel(ax2, 'Frequency change');
title("Coil data");

subplot(2, 2, 3);
hFlag = animatedline('Color',[0.4940 0.1840 0.5560],'LineWidth',1);
ax3 = gca;
ax3.YLim = [0 400000];
xlabel(ax3, 'Time (s)');
ylabel(ax3, 'Value');
title("Flag");

subplot(2, 2, 4);
hECG = animatedline('Color','m','LineWidth',1);
ax4 = gca;
ax4.YLim = [0 400000];
xlabel(ax4, 'Time (s)');
ylabel(ax4, 'V (mV)');
title("ECG");


% axRed = axes('XLim', [-inf, inf], 'YLim', [-inf, inf]);
% xlabel(axRed, 'Data number');
% ylabel(axRed, 'Red');
% subplot(2, 2, 2, axRed);
% hRed = animatedline(axRed, 'Marker', 'none', 'MarkerFaceColor', 'red');
% title("Red - Raw Data");

% figure(2);
% axECG = axes('XLim', [-inf, inf], 'YLim', [-10, 10]);
% xlabel(axECG, 'Data number');
% ylabel(axECG, 'ECG');
% % subplot(3, 2, 2, axIR);
% hECG = animatedline(axECG, 'Marker', 'o', 'MarkerFaceColor', 'red');
% title("ECG data");

% Counter for data
counter = 1;




subscribe(FLAGChar);
subscribe(tempchar);
subscribe(IRchar);
subscribe(Redchar);
subscribe(Coil1Char);
subscribe(Coil2Char);
subscribe (ECGChar);
tic
while counter < 3001
    [dataflag,timestampflag] = read(FLAGChar);
    flag = double(typecast(uint8(dataflag), 'double'));

    if (flag == 1)
        disp("Reading PPG and others")

        [datatemp,timestamptemp] = read(tempchar);
        % a=1
        [dataIR,timestampIR] = read(IRchar);
        % a=2
        [dataRed,timestampRed] = read(Redchar);
        % a=3
        [dataCoil1,timestampcoil1] = read(Coil1Char);
        % a=4
        [dataCoil2,timestampcoil2] = read(Coil2Char);

        [datatimemillis,timestamptimemillis] = read(TimeChar);
        

        datatemprecent = double(typecast(uint8(datatemp), 'double'));
        dataIRrecent = double(typecast(uint8(dataIR), 'uint32'));
        dataRedrecent = double(typecast(uint8(dataRed), 'uint32'));
        dataCoil1recent = double(typecast(uint8(dataCoil1), 'uint16'));
        dataCoil2recent = double(typecast(uint8(dataCoil2), 'uint16'));
        datatimemillisrecent = double(typecast(uint8(datatimemillis), 'uint32'));
         
      
        data(counter,1) = datatimemillisrecent;
        data(counter,2)=dataIRrecent;
       data(counter,3)=dataRedrecent;
        data(counter,4)=dataCoil1recent;
        data(counter,5)= dataCoil2recent;
        data(counter,8)= flag;
        data(counter,6)=datatemprecent;
            
        addpoints(hIR, datatimemillisrecent, dataIRrecent);
        xlim([datatimemillisrecent-10000 datatimemillisrecent]);
        addpoints(hRed, datatimemillisrecent, dataRedrecent);
        addpoints(hCoil1, datatimemillisrecent, dataCoil1recent);
        addpoints(hCoil2, datatimemillisrecent, dataCoil2recent);
        addpoints(hFlag, datatimemillisrecent, flag);
        ax1.XLim = [datatimemillisrecent-10000 datatimemillisrecent];
        ax1.YLim = [dataRedrecent-2000 dataRedrecent+2000];
        ax2.XLim = [datatimemillisrecent-10000 datatimemillisrecent];
        ax2.YLim = [dataCoil1recent-20000 dataCoil1recent+30000];
        ax3.XLim = [datatimemillisrecent-10000 datatimemillisrecent];
        ax3.YLim = [-0.5 1.5];
        % % axRed.Xlim = [datatimemillisrecent-10000 datatimemillisrecent];
        % ax2.Xlim = datenum([datatimemillisrecent-seconds(15) datatimemillisrecent]);

        
      
    end
    if (flag == 0)
       disp("Reading ECG")
       [dataECG,timestampECG] = read(ECGChar);
       [datatimemillis,timestamptimemillis] = read(TimeChar);
       dataECGrecent = double(typecast(uint8(dataECG), 'int16'))
       datatimemillisrecent = double(typecast(uint8(datatimemillis), 'uint32'));
       data(counter,7)=dataECGrecent;
       data(counter,8)= flag;
       data(counter,1) = datatimemillisrecent;
       % [dataCoil1,timestampcoil1] = read(Coil1Char);
        % a=4
       % [dataCoil2,timestampcoil2] = read(Coil2Char);
       % dataCoil1recent = double(typecast(uint8(dataCoil1), 'uint16'));
       % dataCoil2recent = double(typecast(uint8(dataCoil2), 'uint16'));
       % Coil1recent(counter,1)=dataCoil1recent;
       % Coil2recent(counter,1)= dataCoil2recent;
       addpoints(hFlag, datatimemillisrecent, flag);
       addpoints(hECG, datatimemillisrecent, dataECGrecent);
       ax3.XLim = [datatimemillisrecent-100000 datatimemillisrecent];
       ax4.XLim = [datatimemillisrecent-10000 datatimemillisrecent];
       ax3.YLim = [-0.5 1.5];
       ax4.YLim = [-16 16];
    end
% Read Characteristic Values
%Convert PPG data from int and uint to double
% addpoints(hIR, time, dataIRrecent);
% addpoints(hECG, time, dataECGrecent);
% drawnow;
counter = counter + 1
end
toc

clear b; % clear ble object
data(:,1) = (data(:,1) - data(1,1))/1000;

figure(1)
plot(data(:,1), data(:,6));
title('Temperature vs Time')
xlabel('Time(s)') 
ylabel('Temperature (°C)') 

figure(2)
plot(data(:,1), data(:,2));
title('Raw IR value vs Time')
xlabel('Time(s)') 
ylabel('IR') 

figure(3)
plot(data(:,1), data(:,3));
title('Raw Red value vs Time')
xlabel('Time(s)') 
ylabel('Red') 

figure(4)
plot(data(:,1), data(:,4));
title('Coil 1 frequency vs Time')
xlabel('Time(s)') 
ylabel('Coil 1 frequency (Hz)')

figure(5)
plot(data(:,1), data(:,5));
title('Coil 2 frequency vs Time')
xlabel('Time(s)') 
ylabel('Coil 2 frequency (Hz)')

figure(6)
plot(data(:,1), data(:,7));
title('Raw ECG signal vs Time')
xlabel('Time(s)') 
ylabel('ECG signal (mV)')

figure(7)
plot(data(:,1), data(:,8));
title('Flag vs Time')
xlabel('Time(s)') 
ylabel('Flag')

