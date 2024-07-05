clear
close
load("multidata1.mat");
time = data(1499:6000,1)-data(1499,1);
IR = data(1499:6000,2);
Red = data(1499:6000,3);
Coil1 = data(1499:6000,4);
Coil2 = data(1499:6000,5);
ECG = data(1499:6000,7);
Temp = data(1499:6000,6);
Flag = data(1499:6000,8);

figure (1)
subplot(2,2,1)
plot(time,Flag,"LineWidth",3)
title("Flag")
ylabel("Flag value",FontSize=12)
xlabel("Time (s)",FontSize=12)

subplot(2,2,2)
plot(time,IR)
hold on
plot(time,Red)
ylim([220000 280000])
xlim([0 140])
title("PPG data")
ylabel("Raw values",FontSize=12)
xlabel("Time (s)",FontSize=12)
legend("IR data", "Red data")

subplot(2,2,3)
plot(time,Coil1)
hold on
plot(time,Coil2)
xlim([0 140])
ylim([40000 80000])
title("RIP data")
ylabel("Frequency (Hz)",FontSize=12)
xlabel("Time (s)",FontSize=12)
legend("Abdomen coil with 40pF", "Chest coil with 160pF")

% subplot(3,2,5.5)
% plot(time,ECG)
% ylim([-10 10])
% title("ECG data")
% ylabel("V (mV)",FontSize=12)
% xlabel("Time (s)",FontSize=12)

subplot(2,2,4)
plot(time,Temp)
ylim([20 30])
xlim([0 140])
title("Temperature")
ylabel("Temperature (C°)",FontSize=12)
xlabel("Time (s)",FontSize=12)

figure (2)
plot(time,ECG)
ylim([-10 10])
title("ECG data")
ylabel("V (mV)",FontSize=12)
xlabel("Time (s)",FontSize=12)

hightimeP1 = time(993:2328);
hightimeP2 = time(3375:4502);
Guassiansmooth1a = smoothdata(Coil1(993:2328),"gaussian",10);
[pks1a,locs1a] = findpeaks(Guassiansmooth1a,"MinPeakDistance",50);

Guassiansmooth1b = smoothdata(Coil2(993:2328),"gaussian",10);
[pks1b,locs1b] = findpeaks(Guassiansmooth1b,"MinPeakDistance",50);

Guassiansmooth2a = smoothdata(Coil1(3375:4502),"gaussian",10);
[pks2a,locs2a] = findpeaks(Guassiansmooth2a,"MinPeakDistance",50);

Guassiansmooth2b = smoothdata(Coil2(3375:4502),"gaussian",10);
[pks2b,locs2b] = findpeaks(Guassiansmooth2b,"MinPeakDistance",50);

figure (3)
subplot(2,1,1)
plot(hightimeP1,Guassiansmooth1a)
hold on
plot(hightimeP1,Guassiansmooth1b)
plot(hightimeP1(locs1a),pks1a,"om")
hold on
plot(hightimeP1(locs1b),pks1b,"o")
title("RIP data P1")
ylabel("Frequency (Hz)",FontSize=12)
xlabel("Time (s)",FontSize=12)
legend("Abdomen coil with 40pF", "Chest coil with 160pF")
subplot(2,1,2)
plot(hightimeP2,Guassiansmooth2a)
hold on
plot(hightimeP2,Guassiansmooth2b)
plot(hightimeP2(locs2a),pks2a,"om")
hold on
plot(hightimeP2(locs2b),pks2b,"o")
title("RIP data P2")
ylabel("Frequency (Hz)",FontSize=12)
xlabel("Time (s)",FontSize=12)
legend("Abdomen coil with 40pF", "Chest coil with 160pF")

timeelapsed1 = time(2328)-time(993);
BPMC1Phase1 = size (hightimeP1(locs1a),1) / (timeelapsed1/60)
BPMC2Phase1 = size (hightimeP1(locs1b),1) / (timeelapsed1/60)

timeelapsed2 = time(4502)-time(3375);

BPMC1Phase2 = size (hightimeP2(locs2a),1) / (timeelapsed2/60)
BPMC2Phase2 = size (hightimeP2(locs2b),1) / (timeelapsed2/60)


IRP1 = IR(993:2328);
RedP1 = Red(993:2328);
fs = 1/mean(abs(diff(hightimeP1)));
IRP1filt = bandpass(IRP1,[0.1 0.4],fs);
RedP1filt = bandpass(RedP1,[0.1 0.4],fs);
[pks1IR,locs1IR] = findpeaks(IRP1filt,"MinPeakDistance",50);
[pks1Red,locs1Red] = findpeaks(RedP1filt,"MinPeakDistance",50);

BPMIRPhase1 = size (hightimeP1(locs1IR),1) / (timeelapsed1/60)
BPMRedPhase1 = size (hightimeP1(locs1Red),1) / (timeelapsed1/60)

hightimeP2 = time(3375:4502);
IRP2 = IR(3375:4502);
RedP2 = Red(3375:4502);
fs = 1/mean(abs(diff(hightimeP2)));
IRP2filt = bandpass(IRP2,[0.1 0.4],fs);
RedP2filt = bandpass(RedP2,[0.1 0.4],fs);
[pks2IR,locs2IR] = findpeaks(IRP2filt,"MinPeakDistance",50);
[pks2Red,locs2Red] = findpeaks(RedP2filt,"MinPeakDistance",50);

BPMIRPhase2 = size (hightimeP2(locs2IR),1) / (timeelapsed2/60)
BPMRedPhase2 = size (hightimeP2(locs2Red),1) / (timeelapsed2/60)


figure (4)
subplot(2,1,1)
plot(hightimeP1,IRP1filt)
hold on
plot(hightimeP1,RedP1filt)
hold on
plot(hightimeP1(locs1IR),pks1IR,"o")
plot(hightimeP1(locs1Red),pks1Red,"o")
legend("IR data", "Red data")
title("Filtered PPG data P1")
ylabel("Raw values",FontSize=12)
xlabel("Time (s)",FontSize=12)
subplot(2,1,2)
plot(hightimeP2,IRP2filt)
hold on
plot(hightimeP2,RedP2filt)
hold on
plot(hightimeP2(locs2IR),pks2IR,"o")
hold on
plot(hightimeP2(locs2Red),pks2Red,"o")
legend("IR data", "Red data")
title("Filtered PPG data P2")
ylabel("Raw values",FontSize=12)
xlabel("Time (s)",FontSize=12)
% [yupper,ylower] = envelope(ECG(2329:3375));

[yupper,ylower] = envelope(ECG(2400:3375),1,"analytic");
fsecg = 1/mean(abs(diff(time(2400:3375))));
ECGfilt = bandpass(ECG(2400:3375),[0.1 0.4],fsecg);
[pksECG,locsECG] = findpeaks(ECG(2400:3375),"MinPeakDistance",20);
[troughsECG,troughlocsECG] = findpeaks(-ECG(2400:3375),"MinPeakDistance",20);
lowtime = time(2400:3375);
timeelapsedecg = time(3375)-time(2400);
yOut = spline(locsECG, pksECG, 1:length(ECG(2400:3375)));
[pksspline,locsspline] = findpeaks(yOut,"MinPeakDistance",50);
yOutlow = spline(troughlocsECG, -troughsECG, 1:length(ECG(2400:3375)));
[pksspline1,locsspline1] = findpeaks(-yOutlow,"MinPeakDistance",50);
[pksECGfilt,locsECGfilt] = findpeaks(ECGfilt,"MinPeakDistance",50);

BPMECGfiltspline = size (time(locsECGfilt),1) / (timeelapsedecg/60)
BPMECGupperspline = size (time(locsspline),1) / (timeelapsedecg/60)
BPMECGlowerspline = size (time(locsspline1),1) / (timeelapsedecg/60)

figure (6)
plot(lowtime,ECG(2400:3375));
hold on
plot(lowtime,yOut);
hold on
plot(lowtime,yOutlow,'-r');
 %plot(time(2400:3375),yupper,time(2400:3375),ylower)
hold on
plot(time(2400:3375),ECGfilt,'-k')
hold on
plot(lowtime(locsspline),pksspline,"ok")
hold on
plot(lowtime(locsspline1),-pksspline1,"ob")
hold on
plot(lowtime(locsECGfilt),pksECGfilt,"or")

title("ECG data P1.5")
ylabel("V (mV)",FontSize=12)
xlabel("Time (s)",FontSize=12)
legend("ECG", "Upper envelope","Lower Envelope","ECG filtered")


