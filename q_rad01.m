close all
format long
thetaa1 = 1000; % начальная температура
w = 2*pi*1/4/3600; %частота
t = 0:10:3600; %время
q1rad = 900000; %%переменная лучистая компонента
k = 1; %% показатель поглощения
sigma = 100; %% показатель рассеяния
B = 20; %%коэффициент теплоотдачи воздушная среда-поверхность
b = sqrt(k*k+k*sigma);
A = (b-k)/(b+k); %% альбедо
c = 450; %%теплоёмкость
rho = 4000; %%плотность
Kt = 0.1; %% коэффициент теплопроводности
at = Kt/c/rho; %%коэффициент температуропроводности
z = 0:0.0005:0.01;
deltaphi_rad_conv = 0;

thetaa = thetaa1*cos(w*t);
figure
title('Ambient temperature');
plot(t,thetaa);
xlabel('{\itTime}, s');
ylabel('{\itTemperature}, C');
set(gca, 'FontName', 'Arial')
set(gcf,'color','w');
qrad = q1rad*cos(w*t-deltaphi_rad_conv);

figure
title('Heat flux chart');
plot(t,qrad);
xlabel('{\itTime}, s');
ylabel('{\itHeat flux}, MW/m^2');
set(gca, 'FontName', 'Arial')
set(gcf,'color','w');


l2 = sin(deltaphi_rad_conv);
l1 = cos(deltaphi_rad_conv);
phi1 = asin((l2*at*b*b-l1*w)/(sqrt(w*w+at*at*b*b*b*b)));
d1 = -(l1*at*b*b+l2*w)/(w*w+at*at*b^4);
d2 = (w*l1-at*b*b*l2)/(w*w+at*at*b^4);
F1 = B*thetaa1-(Kt*b+B)*q1rad*b*(1-A)*d1/c/rho;
F2 = q1rad*b*(1-A)*(Kt*b+B)*d2/c/rho;
delta = (Kt*sqrt(w/(2*at))+B)^2+Kt^2*w/(2*at);

c1 = ((Kt*sqrt(w./(2*at))+B)*F1+Kt*sqrt(w/(2*at))*F2)./delta; %%3.25
c2 = ((Kt*sqrt(w./(2*at))*F1)-(Kt*sqrt(w./(2*at))+B)*F2)./delta; %%3.25

psi = asin(c2/(c1*c1+c2*c2));
CC1 = sqrt(c1*c1+c2*c2);
CC2 = b*(1-A)./(sqrt(w.*w+at.*at.*b.*b.*b.*b)).*q1rad./c/rho;
theta = CC1*cos(w.*t-psi)-CC2.*cos(w.*t-phi1);
figure
plot(t/3600/4*2*pi,theta)
maxx = find(theta==max(theta));
hold on
plot(t(maxx)/3600/4*2*pi,max(theta),'rx');
title('Surface temperature (3.28)');
xlabel('Время, с');
ylabel('Температура, С');
xlabel('{\itTime}, s');
ylabel('{\itTemperature}, C');
set(gca, 'FontName', 'Arial')
set(gcf,'color','w');

t(maxx)/3600/4*2*pi
phi1

%%%%2

k = 2; %% показатель поглощения
sigma = 100; %% показатель рассеяния
B = 20; %%коэффициент теплоотдачи воздушная среда-поверхность
b = sqrt(k*k+k*sigma);
A = (b-k)/(b+k); %% альбедо

l2 = sin(deltaphi_rad_conv);
l1 = cos(deltaphi_rad_conv);
phi1_1 = asin((l2*at*b*b-l1*w)/(sqrt(w*w+at*at*b*b*b*b)));
d1 = -(l1*at*b*b+l2*w)/(w*w+at*at*b^4);
d2 = (w*l1-at*b*b*l2)/(w*w+at*at*b^4);
F1 = B*thetaa1-(Kt*b+B)*q1rad*b*(1-A)*d1/c/rho;
F2 = q1rad*b*(1-A)*(Kt*b+B)*d2/c/rho;
delta = (Kt*sqrt(w/(2*at))+B)^2+Kt^2*w/(2*at);

c1 = ((Kt*sqrt(w./(2*at))+B)*F1+Kt*sqrt(w/(2*at))*F2)./delta; %%3.25
c2 = ((Kt*sqrt(w./(2*at))*F1)-(Kt*sqrt(w./(2*at))+B)*F2)./delta; %%3.25

psi = asin(c2/(c1*c1+c2*c2));
CC1 = sqrt(c1*c1+c2*c2);
CC2 = b*(1-A)./(sqrt(w.*w+at.*at.*b.*b.*b.*b)).*q1rad./c/rho;
theta = CC1*cos(w.*t-psi)-CC2.*cos(w.*t-phi1_1);

hold on
plot(t/3600/4*2*pi,theta)
maxx = find(theta==max(theta));
hold on
plot(t(maxx)/3600/4*2*pi,max(theta),'gx');

t(maxx)/3600/4*2*pi
phi1_1
%%% sigma = 400

k = 1; %% показатель поглощения
sigma = 4000; %% показатель рассеяния
B = 20; %%коэффициент теплоотдачи воздушная среда-поверхность
b = sqrt(k*k+k*sigma);
A = (b-k)/(b+k); %% альбедо

l2 = sin(deltaphi_rad_conv);
l1 = cos(deltaphi_rad_conv);
phi1_2 = asin((l2*at*b*b-l1*w)/(sqrt(w*w+at*at*b*b*b*b)));
d1 = -(l1*at*b*b+l2*w)/(w*w+at*at*b^4);
d2 = (w*l1-at*b*b*l2)/(w*w+at*at*b^4);
F1 = B*thetaa1-(Kt*b+B)*q1rad*b*(1-A)*d1/c/rho;
F2 = q1rad*b*(1-A)*(Kt*b+B)*d2/c/rho;
delta = (Kt*sqrt(w/(2*at))+B)^2+Kt^2*w/(2*at);

c1 = ((Kt*sqrt(w./(2*at))+B)*F1+Kt*sqrt(w/(2*at))*F2)./delta; %%3.25
c2 = ((Kt*sqrt(w./(2*at))*F1)-(Kt*sqrt(w./(2*at))+B)*F2)./delta; %%3.25

psi = asin(c2/(c1*c1+c2*c2));
CC1 = sqrt(c1*c1+c2*c2);
CC2 = b*(1-A)./(sqrt(w.*w+at.*at.*b.*b.*b.*b)).*q1rad./c/rho;
theta = CC1*cos(w.*t-psi)-CC2.*cos(w.*t-phi1_2);

hold on
plotyy(t/3600/4*2*pi,theta,t/3600/4*2*pi,qrad)
maxx = find(theta==max(theta));
hold on
plot(t(maxx)/3600/4*2*pi,max(theta),'bx');
t(maxx)/3600/4*2*pi
phi1_2

%%Change Kt

Kt = 0.01; %% коэффициент теплопроводности
at = Kt/c/rho; %%коэффициент температуропроводности

k = 1; %% показатель поглощения
sigma = 4000; %% показатель рассеяния
B = 20; %%коэффициент теплоотдачи воздушная среда-поверхность
b = sqrt(k*k+k*sigma);
A = (b-k)/(b+k); %% альбедо

l2 = sin(deltaphi_rad_conv);
l1 = cos(deltaphi_rad_conv);
phi1_3 = asin((l2*at*b*b-l1*w)/(sqrt(w*w+at*at*b*b*b*b)));
d1 = -(l1*at*b*b+l2*w)/(w*w+at*at*b^4);
d2 = (w*l1-at*b*b*l2)/(w*w+at*at*b^4);
F1 = B*thetaa1-(Kt*b+B)*q1rad*b*(1-A)*d1/c/rho;
F2 = q1rad*b*(1-A)*(Kt*b+B)*d2/c/rho;
delta = (Kt*sqrt(w/(2*at))+B)^2+Kt^2*w/(2*at);

c1 = ((Kt*sqrt(w./(2*at))+B)*F1+Kt*sqrt(w/(2*at))*F2)./delta; %%3.25
c2 = ((Kt*sqrt(w./(2*at))*F1)-(Kt*sqrt(w./(2*at))+B)*F2)./delta; %%3.25

psi = asin(c2/(c1*c1+c2*c2));
CC1 = sqrt(c1*c1+c2*c2);
CC2 = b*(1-A)./(sqrt(w.*w+at.*at.*b.*b.*b.*b)).*q1rad./c/rho;
theta = CC1*cos(w.*t-psi)-CC2.*cos(w.*t-phi1_3);

hold on
plot(t/3600/4*2*pi,theta,'k--')
maxx = find(theta==max(theta));
hold on
plot(t(maxx)/3600/4*2*pi,max(theta),'kx');
t(maxx)/3600/4*2*pi
phi1_3

legend('k=1','k=1','k=2','k=2', 'sigma=400', 'sigma=400','Kt=0.01','Kt=0.01','qrad');

%%Z profile (at t=1800)

figure 
t=1800;
z = 0:0.001:0.3;
theta = CC1*cos(w.*t-psi-sqrt(w/2/at).*z).*exp(-sqrt(w/2/at).*z)-CC2.*cos(w.*t-phi1_3).*exp(-b.*z);
plot(z,theta);
title(sprintf('Z profile at t=%d',t));
xlabel('{\itDepth Z}, m');
ylabel('{\itTemperature}, C');
set(gca, 'FontName', 'Arial')
set(gcf,'color','w');


