close all

h = figure('rend','painters','pos',[100 100 650 700]) 

t=4800;
z = 0:0.001:0.3;
%theta = CC1*cos(w.*t-psi-sqrt(w/2/at).*z).*exp(-sqrt(w/2/at).*z)-CC2.*cos(w.*t-phi1_3).*exp(-b.*z);
%[theta phi1_3] = rad_f_z(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
%plot(z,add+theta,'r-');
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
ylabel('{\itT}, K');
set(gca, 'FontName', 'Arial')
set(gca, 'FontSize', 25);
set(gcf,'color','w');
print(sprintf('results\\1zproft%d',t),'-dpng');
