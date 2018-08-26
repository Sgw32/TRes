
%% Z-plot
title('Depth/temperature/time 3d-plot');
figure
[z,t] = meshgrid(0:.01:1,0:.01:1);
t = t.*3600*48;
z = z.*1;%.*1e-12;
theta = CC1*cos(w.*t-psi-sqrt(w/2/at).*z).*exp(-sqrt(w/2/at).*z)-CC2.*cos(w.*t-deltaphi_rad_conv).*exp(-b.*z);
mesh(z,t,theta)
xlabel('Глубина Z, м');
ylabel('Время, с');
zlabel('Температура, С');
xlabel('{\itDepth Z}, m');
ylabel('{\itTime}, s');
zlabel('{\itTemperature}, C');
set(gca, 'FontName', 'Arial')
set(gcf,'color','w');

%%

figure 
theta = CC1*cos(w.*t-psi-sqrt(w/2/at).*z).*exp(-sqrt(w/2/at).*z)-CC2.*cos(w.*t-deltaphi_rad_conv).*exp(-b.*z);
plot(z,theta);
title('Depth/temperature chart');
xlabel('{\itDepth Z}, m');
ylabel('{\itTemperature}, C');
set(gca, 'FontName', 'Arial')
set(gcf,'color','w');

