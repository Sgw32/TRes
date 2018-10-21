close all

thetaa = thetaa1*cos(w*t);
sigma = 10;
rho = 400; %%плотность
w = 2*pi*1/4/3600; %частота
loops = 60;
F(loops) = struct('cdata',[],'colormap',[]);

h = figure('rend','painters','pos',[100 100 650 700])

axis tight manual 
ax = gca;
%ax.XTickMode = 'manual';
ax.YTickMode = 'manual';

t=0;
z = 0:0.001:0.3;
%rad

deltaphi_rad_conv = 30*pi/180;
hold on

[theta phi1_3] = rad_f_z_rad(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
hh = plot(z,add+theta,'color',[1 0.7 .0]);
hh.LineWidth = 4;

deltaphi_rad_conv = 30*pi/180;
thetaa = add+100-thetaa1*cos(-60*z-t.*w-deltaphi_rad_conv)./4;
hold on
hh = plot(-z,thetaa,'color',[.0 0.5 .0]);
hh.LineWidth = 4;

txt = ['Time: ' num2str(t)];
an = annotation('textbox',[.6 .8 .1 .2],'String',txt,'EdgeColor','none')
an.FontSize = 64;
xlabel('{\itZ}, m');
ylabel('{\itT}, C');
ax = gca;
ax.XLim = [-0.3 0.3];
ax.YTick = [0 500 1000 1500 2000];
ax.YLim = [600 1000];
ax.Visible = 'off';
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
imwrite(imind,cm,'results\slide15.gif','gif','DelayTime',0.1, 'Loopcount',inf);


for j = 1:loops
        t = 4800*(j)/loops;
    
        deltaphi_rad_conv = 30*pi/180;
        thetaa = add+100-thetaa1*cos(-60*z-t.*w-deltaphi_rad_conv)./4;
        clf
        %rad

        
        hold on
        [theta phi1_3] = rad_f_z_rad(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
        
        hh = plot(z,add+theta,'color',[1 0.7 .0]);
        hh.LineWidth = 4;
        hold on
        hh = plot(-z,thetaa,'color',[0 0.5 .0]);
        hh.LineWidth = 4;
        %__________
        
        txt = ['Time: ' num2str(t)];
        an = annotation('textbox',[.6 .8 .1 .2],'String',txt,'EdgeColor','none')
        an.FontSize = 64;
        ax = gca;
        ax.XLim = [-0.3 0.3];
        ax.YTick = [0 500 1000 1500 2000];
        ax.YLim = [600 1000];
        ax.Visible = 'off';
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
          imwrite(imind,cm,'results\slide15.gif','gif','DelayTime',0.1,'WriteMode','append');
end