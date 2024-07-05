clear
close
load("data.mat");
Coil1 = data (1:7900,4);
Coil2 = data (1:7900,5);
Smoothdata1 = smoothdata(Coil1,"lowess");
Smoothdata2 = smoothdata(Coil2,"lowess");
t = data (1:7900,1);
Smoothdata1time = smoothdata(Coil1,"SamplePoints",t);
Guassiansmooth = smoothdata(Coil1,"gaussian",200);
Guassiansmooth2 = smoothdata(Coil2,"gaussian",200);
[pks,locs] = findpeaks(Smoothdata2);
% plot(data([1:7900],1),Coil1)
% hold on
% plot(data([1:7900],1),Smoothdata1)
% hold on
% % plot(data([1:7900],1),Smoothdata1time)
% % hold on 
% plot(data([1:7900],1),Guassiansmooth)

figure(1)
plot(data([1:7900],1),Coil2)
hold on
plot(data([1:7900],1),Smoothdata2)
hold on
% plot(data([1:7900],1),Smoothdata1time)
% hold on 
plot(data([1:7900],1),Guassiansmooth2)
hold on
% plot(data([1:7900],1),Smoothdata2,data(locs,1),pks,"o")
legend("Coil2 Data","Smoothed Data - Lowess","Gaussian method - 200 sample window")

 BPM = size (data(locs,1),1) / (data(7900,1)/60)
figure(2)
plot(data([1:7900],1),Coil1)
hold on