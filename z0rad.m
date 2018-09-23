close all
clc
format long

%%INITIAL CONDITIONS

thetaa1 = 500; % начальная температура
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

h = figure('rend','painters','pos',[100 100 650 700]) 

add = 2300;

%Initial
[theta phi1] = rad_f(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta,'k--')
maxx = find(theta==max(theta));
hold on
plot(t(maxx)/3600/4*2*pi,add+max(theta),'kx');
t(maxx)/3600/4*2*pi
phi1

deltaphi_rad_conv = 30;

[theta phi1] = rad_f(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta,'k--')
maxx = find(theta==max(theta));
hold on
plot(t(maxx)/3600/4*2*pi,add+max(theta),'kx');
t(maxx)/3600/4*2*pi
phi1

deltaphi_rad_conv = 60;

[theta phi1] = rad_f(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add*2+theta,'k--')
maxx = find(theta==max(theta));
hold on
plot(t(maxx)/3600/4*2*pi,add+max(theta),'kx');
t(maxx)/3600/4*2*pi
phi1

deltaphi_rad_conv = 90;

[theta phi1] = rad_f(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add*2+theta,'k--')
maxx = find(theta==max(theta));
hold on
plot(t(maxx)/3600/4*2*pi,add+max(theta),'kx');
t(maxx)/3600/4*2*pi
phi1

xlabel('{\it\phi_{conv}^{rad}} ,\circ');
ylabel('{\it\theta_{A}(t)}, K');
set(gca, 'FontSize', 25);
set(gcf,'color','w');
set(gcf,'color','w');
print('z0rad','-dpng');
set(gca,'XTick',0:pi/4:pi/2) 
set(gca,'XTickLabel',{'0','\pi/4','\pi/2'}) 
xlim([0 pi/2])