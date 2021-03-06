close all

thetaa = thetaa1*cos(w*t);

loops = 60;
F(loops) = struct('cdata',[],'colormap',[]);

h = figure('rend','painters','pos',[100 100 650 700])
axis tight manual 
ax = gca;
%ax.XTickMode = 'manual';
ax.YTickMode = 'manual';

t=0;
z = 0:0.001:0.3;
deltaphi_rad_conv = 30*pi/180;
hold on
[theta phi1_3] = rad_f_z_conv(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(z,add+theta,'r-');

deltaphi_rad_conv = 60*pi/180;
hold on
[theta phi1_3] = rad_f_z_conv(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(z,add+theta,'g-');

deltaphi_rad_conv = 90*pi/180;
hold on
[theta phi1_3] = rad_f_z_conv(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
plot(z,add+theta,'b-');
txt = ['Time: ' num2str(t)];
annotation('textbox',[.9 .5 .1 .2],'String',txt,'EdgeColor','none')
xlabel('{\itZ}, m');
ylabel('{\itT}, C');
ax = gca;
ax.YTick = [500 1000 1500];
ax.YLim = [500 1700];
xlim([0 0.3]);
%ylim([0 2000]);
set(gca, 'FontName', 'Arial')
set(gca, 'FontSize', 25);
set(gcf,'color','w');
drawnow


F(1) = getframe(h);
frame = getframe(h);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
% Write to the GIF File 
imwrite(imind,cm,'results\rad_prof_anim_conv.gif','gif', 'Loopcount',inf);


for j = 1:loops
        if (j<loops/2)
        t = 4800*(j)/loops*2;
        else
        t = 4800*(loops-j)/loops*2; 
        end
        
        clf
        deltaphi_rad_conv = 30*pi/180;
        hold on
        [theta phi1_3] = rad_f_z_conv(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
        plot(z,add+theta,'r-');

        deltaphi_rad_conv = 60*pi/180;
        hold on
        [theta phi1_3] = rad_f_z_conv(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
        plot(z,add+theta,'g-');

        deltaphi_rad_conv = 90*pi/180;
        hold on
        [theta phi1_3] = rad_f_z_conv(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
        plot(z,add+theta,'b-');
        txt = ['Time: ' num2str(t)];
        annotation('textbox',[.9 .5 .1 .2],'String',txt,'EdgeColor','none')
        ax = gca;
        ax.YTick = [500 1000 1500];
        ax.YLim = [500 1700];
        xlabel('{\itZ}, m');
        ylabel('{\itT}, C');
        set(gca, 'FontName', 'Arial')
        set(gca, 'FontSize', 25);
        set(gcf,'color','w');
        
        
        drawnow
        F(j) = getframe(h);
        frame = getframe(h);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        % Write to the GIF File 
          imwrite(imind,cm,'results\rad_prof_anim_conv.gif','gif','WriteMode','append');
end