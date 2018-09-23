close all


%%AMBIENT TEMPERATURE PLOT

thetaa = thetaa1*cos(w*t);
figure
title('Ambient temperature');
plot(t,thetaa+1000,'k-');
xlabel('{\itTime}, s');
ylabel('{\itT}, C');
set(gca, 'FontName', 'Arial')
set(gca, 'FontSize', 14);
set(gcf,'color','w');
print('amb_temp','-dpng');
%%

%%HEAT FLUX PLOT

qrad = q1rad*cos(w*t-deltaphi_rad_conv);

figure
title('Heat flux plot');
plot(t,qrad+q1rad,'k-');
xlabel('{\itTime}, s');
ylabel('{\itHeat flux}, MW/m^2');
set(gca, 'FontName', 'Arial')
set(gca, 'FontSize', 14);
set(gcf,'color','w');
print('qrad_cos','-dpng');


%%heat flux and thetaa

%%
deltaphi_rad_conv = 0;
%%
figure

%Initial
[theta phi1] = rad_f(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,theta,'k--')
maxx = find(theta==max(theta));
hold on
plot(t(maxx)/3600/4*2*pi,max(theta),'kx');
t(maxx)/3600/4*2*pi
phi1


%k=2 sigma=100
k = 2; %% показатель поглощения
sigma = 100; %% показатель рассеяния

[theta phi1_1] = rad_f(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
hold on
plot(t/3600/4*2*pi,theta,'k:')
maxx = find(theta==max(theta));
hold on
plot(t(maxx)/3600/4*2*pi,max(theta),'kx');
t(maxx)/3600/4*2*pi
phi1_1

%k=1 sigma = 400
k = 1; %% показатель поглощения
sigma = 400; %% показатель рассеяния
[theta phi1_2] = rad_f(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
hold on
[hAx,hLine1,hLine2] = plotyy(t/3600/4*2*pi,theta,t/3600/4*2*pi,qrad)
hLine1.LineStyle = '--';
hLine2.LineStyle = ':';
hLine1.Color = 'k';
hLine1.Color = 'k';
maxx = find(theta==max(theta));
hold on
plot(t(maxx)/3600/4*2*pi,max(theta),'kx');
t(maxx)/3600/4*2*pi
phi1_2

%%Change Kt
Kt = 0.01; %% коэффициент теплопроводности
k = 1; %% показатель поглощения
sigma = 400; %% показатель рассеяния
[theta phi1_3] = rad_f(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
hold on
plot(t/3600/4*2*pi,theta,'k-.')
maxx = find(theta==max(theta));
hold on
plot(t(maxx)/3600/4*2*pi,max(theta),'kx');
t(maxx)/3600/4*2*pi
phi1_3

%%legend('k=1','k=1','k=2','k=2', 'sigma=400', 'sigma=400','Kt=0.01','Kt=0.01','qrad');
title('Surface temperature');
xlabel('Время, с');
ylabel('Температура, С');
xlabel('{\itTime}, s');
ylabel('{\itTemperature}, C');
set(gca, 'FontName', 'Arial')
set(gca, 'FontSize', 14);
set(gcf,'color','w');
print('surf_temp','-dpng');
%%Z profile (at t=1800)

figure 
t=1800;
z = 0:0.001:0.3;
%theta = CC1*cos(w.*t-psi-sqrt(w/2/at).*z).*exp(-sqrt(w/2/at).*z)-CC2.*cos(w.*t-phi1_3).*exp(-b.*z);
[theta phi1_3] = rad_f_z(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(z,theta,'k-');
title(sprintf('Z profile at t=%d',t));
xlabel('{\itDepth Z}, m');
ylabel('{\itTemperature}, C');
set(gca, 'FontName', 'Arial')
set(gca, 'FontSize', 14);
set(gcf,'color','w');
print(sprintf('1zproft%d',t),'-dpng');
%%TODO для каждого графика.

%%Терморезонанс

phi = 0:pi/72*pi/72:pi/2*pi/2;

c = 450; %%теплоёмкость
rho = 4000; %%плотность
Kt = 1; %% коэффициент теплопроводности
at = Kt/c/rho; %%коэффициент температуропроводности

phi = sqrt(phi);
t(1)=3600;
t(2)=3600/2;
t(3)=3600/4;
b=zeros(3,length(phi));
b(1,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at*t(1)));
b(2,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at*t(2))); %% 3.32 показатель ослабления излучения светорассеивающей среды в условиях многократного рассения.
b(3,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at*t(3))); %% 3.32 показатель ослабления излучения светорассеивающей среды в условиях многократного рассения.

A=zeros(16,length(phi)); %альбедо, коэффициент отражения полубесконечного слоя вещества
k=zeros(2,1);
k(1,1)=1;
k(2,1)=10;

A(1,:)=(b(1,:)-k(1,1))./(b(1,:)+k(1,1));
A(2,:)=(b(1,:)-k(2,1))./(b(1,:)+k(2,1));

A(3,:)=(b(2,:)-k(1,1))./(b(2,:)+k(1,1));
A(4,:)=(b(2,:)-k(2,1))./(b(2,:)+k(2,1));

A(5,:)=(b(3,:)-k(1,1))./(b(3,:)+k(1,1));
A(6,:)=(b(3,:)-k(2,1))./(b(3,:)+k(2,1));

figure 

plot(phi,A(1,:).*100,'k--'); 
hold on
plot(phi,A(2,:).*100,'k--'); 
hold on
plot(phi,A(3,:).*100,'k--'); 
hold on
plot(phi,A(4,:).*100,'k--'); 
hold on
plot(phi,A(5,:).*100,'k--'); 
hold on
plot(phi,A(6,:).*100,'k--'); 
hold on

xlabel('{\it\phi}, rad');
ylabel('{\itAlbedo}, %');
set(gca, 'FontName', 'Arial')
set(gca, 'FontSize', 14);
set(gcf,'color','w');
set(gca,'XTick',0:pi/4:pi/2) 
set(gca,'XTickLabel',{'0','\pi/4','\pi/2'}) 
ylim([0 100])
print('tres1','-dpng');
