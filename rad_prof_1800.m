close all
clc
format long

%%INITIAL CONDITIONS

thetaa1 = 300; % начальная температура
w = 2*pi*1/4/3600; %частота
t = 0:10:4800; %время
q1rad = 500000; %%переменная лучистая компонента
k = 1; %% показатель поглощения
sigma = 100; %% показатель рассеяния
B = 200; %%коэффициент теплоотдачи воздушная среда-поверхность
b = sqrt(k*k+k*sigma);
A = (b-k)/(b+k); %% альбедо
c = 450; %%теплоёмкость
rho = 1000; %%плотность
Kt = 0.1; %% коэффициент теплопроводности
at = Kt/c/rho; %%коэффициент температуропроводности
z = 0:0.0005:0.01;
deltaphi_rad_conv = 0;

h = figure('rend','painters','pos',[100 100 650 700]) 

add = 1000;

t=1800;
z = 0:0.001:0.3;
%theta = CC1*cos(w.*t-psi-sqrt(w/2/at).*z).*exp(-sqrt(w/2/at).*z)-CC2.*cos(w.*t-phi1_3).*exp(-b.*z);
[theta phi1_3] = rad_f_z(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(z,add+theta,'r-');
%title(sprintf('Z profile at t=%d',t));


deltaphi_rad_conv = 30*pi/180;
hold on
[theta phi1_3] = rad_f_z(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(z,add+theta,'g-');

deltaphi_rad_conv = 60*pi/180;
hold on
[theta phi1_3] = rad_f_z(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(z,add+theta,'b-');

deltaphi_rad_conv = 90*pi/180;
hold on
[theta phi1_3] = rad_f_z(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(z,add+theta,'k-');

xlabel('{\itZ}, m');
ylabel('{\itT}, C');
set(gca, 'FontName', 'Arial')
set(gca, 'FontSize', 25);
set(gcf,'color','w');
print(sprintf('1zproft%d',t),'-dpng');
