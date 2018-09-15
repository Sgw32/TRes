function [ theta,phi1 ] = rad_f_z( thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv)
%Thermal resonance function
%   RAD_F_Z
b = sqrt(k*k+k*sigma); 
A = (b-k)/(b+k); %% альбедо
at = Kt/c/rho; %%коэффициент температуропроводности

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
%theta = CC1*cos(w.*t-psi)-CC2.*cos(w.*t-phi1);
theta = CC1*cos(w.*t-psi-sqrt(w/2/at).*z).*exp(-sqrt(w/2/at).*z)-CC2.*cos(w.*t-phi1).*exp(-b.*z);
end

