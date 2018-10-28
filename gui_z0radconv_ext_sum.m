% close all
cla

% h1 = figure('rend','painters','pos',[100 100 650 700]) 
%h2 = figure('rend','painters','pos',[100 100 650 700]) 

%add = 1000;

%Initial
%t=0:10:4800
deltaphi_rad_conv = 30*pi/180;
%figure(h1);
[theta1 phi1] = rad_f_conv(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta1,'g')
hold on
[theta2 phi1] = rad_f_rad(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta2,'g--')
hold on
%figure(h2);
plot(t/3600/4*2*pi,2*add+theta2+theta1,'r--')
hold on

deltaphi_rad_conv = 60*pi/180;
%figure(h1);
[theta1 phi1] = rad_f_conv(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta1,'b')
hold on
[theta2 phi1] = rad_f_rad(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta2,'b--')
hold on
%figure(h2);
plot(t/3600/4*2*pi,2*add+theta2+theta1,'g--')
hold on

deltaphi_rad_conv = 90*pi/180;

%figure(h1);
[theta1 phi1] = rad_f_conv(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta1,'k')
hold on
[theta2 phi1] = rad_f_rad(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta2,'k--')
hold on
%figure(h2);
plot(t/3600/4*2*pi,2*add+theta2+theta1,'b--')
hold on

xlabel('{\itt} ,s');
ylabel('{\it\theta(t)}, K');
set(gca, 'FontSize', 25);
set(gcf,'color','w');
set(gcf,'color','w');
print('z0rad','-dpng');
set(gca,'XTick',0:pi/4:pi/2+pi/6) 
set(gca,'XTickLabel',{'0','1800','3600'}) 
xlim([0 pi/2+pi/6])
set(gcf,'PaperPositionMode','auto')
%print('results\\z0radconv_ext_sum','-dpng');
%0 30 60 90
%0 3600 1800 900
%%z 