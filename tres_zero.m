close all

lambda_t = 2; %% коэффициент теплопроводности керамики

phi = 0:pi/72*pi/72:pi/2*pi/2; %% сдвиг фазы между температурой воздуха и падающим потоком излучения
%plot(sqrt(phi),ones(length(phi)),'x');
phi = sqrt(phi)

at = 3000000000; %%коэффициент температуропроводности (лёд)
cp = 450 %%теплоёмкость
%sigma = 2400;
% Температурный профиль

figure
T0 = 800
phi = 0;
w = 0.00000001;
b = 2000000; %показатель ослабления излучения светорассеивающей среды
q = 1800000 %% плотность потока энергии (солнечного излучения)


A=0.9   ;
t=0:100:3600*48;

q1 = 0.000001;
l2 = sin(phi);
l1 = cos(phi);
d1 = -(l1*at*b*b+l2*w)/(w*w+at*at*b^4);
d2 = (w*l1-at*b*b*l2)/(w*w+at*at*b^4);
B = 20; %%коэффициент теплоотдачи воздушная среда-поверхность
F1 = B*T0-(lambda_t*b+B)*q1*b*(1-A)*d1/cp;
F2 = q1*b*(1-A)*(lambda_t*b+B)*d2/cp;
delta = (lambda_t*sqrt(w/(2*at))+B)^2+lambda_t^2*w/(2*at);

c1 = ((lambda_t*sqrt(w./(2*at))+B)*F1+lambda_t*sqrt(w/(2*at))*F2)./delta; %%3.25
c2 = ((lambda_t*sqrt(w./(2*at))*F1)-(lambda_t*sqrt(w./(2*at))+B)*F2)./delta; %%3.25

psi = 0;%%asin(c2/(c1*c1+c2*c2));
CC1 = sqrt(c1*c1+c2*c2);
CC2 = b*(1-A)./(sqrt(w.*w+at.*at.*b.*b.*b.*b)).*q1./cp;
theta = CC1*cos(w.*t-psi)-CC2.*cos(w.*t-phi);
plot(t,theta)
xlabel('Время, с');
ylabel('Температура, С');
xlabel('{\itTime}, s');
ylabel('{\itTemperature}, C');
set(gca, 'FontName', 'Arial')
set(gcf,'color','w');
%%Zero t plot

%% Z-plot

figure
[z,t] = meshgrid(0:.01:1,0:.01:1);
t = t.*3600*48;
z = z.*1;%.*1e-12;
%theta = (sqrt(c1*c1+c2*c2)*cos(w.*t-psi).*exp(z));%-b*(1-A)./(sqrt(w.*w+at.*at.*b.*b.*b.*b)).*q1./cp.*cos(w.*t-phi);
theta = CC1*cos(w.*t-psi-sqrt(w/2/at).*z).*exp(-sqrt(w/2/at).*z)-CC2.*cos(w.*t-phi).*exp(-b.*z);
%theta = exp(-sqrt(w/2*at).*z);
%plot(t,theta)
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
t=3600;
z = 0:0.01:0.3
theta = CC1*cos(w.*t-psi-sqrt(w/2/at).*z).*exp(-sqrt(w/2/at).*z)-CC2.*cos(w.*t-phi).*exp(-b.*z);
plot(z,theta);
xlabel('{\itDepth Z}, m');
ylabel('{\itTemperature}, C');
set(gca, 'FontName', 'Arial')
set(gcf,'color','w');
