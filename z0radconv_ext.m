close all


h = figure('rend','painters','pos',[100 100 650 700]) 

add = 1000;

%Initial

deltaphi_rad_conv = 30*pi/180;

[theta phi1] = rad_f_conv(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta,'g')
hold on
[theta phi1] = rad_f_rad(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta,'g--')
hold on

deltaphi_rad_conv = 60*pi/180;

[theta phi1] = rad_f_conv(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta,'b')
hold on
[theta phi1] = rad_f_rad(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta,'b--')
hold on

deltaphi_rad_conv = 90*pi/180;

[theta phi1] = rad_f_conv(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta,'k')
hold on
[theta phi1] = rad_f_rad(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(t/3600/4*2*pi,add+theta,'k--')
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
print('results\\z0radconv_ext','-dpng');
%0 30 60 90
%0 3600 1800 900
%%z 