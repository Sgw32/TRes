close all

thetaa = thetaa1*cos(w*t);
w = 2*pi*1/4/3600; %частота
t = 0:10:3600*8; %время
loops = 30;
F(loops) = struct('cdata',[],'colormap',[]);

h = figure('rend','painters','pos',[100 100 650 700])

axis tight manual 

ax = gca;
%ax.NextPlot = 'replaceChildren';

ax.XTickMode = 'manual';
ax.YTickMode = 'manual';

deltaphi_rad_conv = 0;
qrad = q1rad*cos(w*t-deltaphi_rad_conv);
[a h1 h2] = plotyy(t,thetaa+add,t,qrad+q1rad);
h1.Color = 'k';
h2.Color = 'k';
ba = a(1);
bb = a(2);
a(1).XColor = 'k';
a(2).XColor = 'k';
a(1).YColor = 'k';
a(2).YColor = 'k';
a(1).XTick = [ 0, 3600*2, 3600*4, 3600*6 ];
a(2).XTick = [ 0, 3600*2, 3600*4, 3600*6 ];
a(1).XTickLabels = { '0', '3600*2', '3600*4', '3600*4' };
a(2).XTickLabels = { '0', '3600*2', '3600*4', '3600*4' };
a(1).YTick = [-thetaa1+1000 1000 thetaa1+1000];
a(2).YTick = [0 q1rad*1 q1rad*2];
a(1).YLim = [500 thetaa1+1000];
a(2).YLim = [0 q1rad*2];
title('Ambient temperature vs heat flux');

%%xlabel('{\itTime}, s');
xlabel('{\it\phi_{conv}^{rad}}, \circ');
ylabel('{\itT}, C');
ylabel('{\it\theta_{A}(t)}, C');
set(gca, 'FontName', 'Arial')
set(gca, 'FontSize', 14);
set(gcf,'color','w');
drawnow


F(1) = getframe(h);
frame = getframe(h);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
% Write to the GIF File 
imwrite(imind,cm,'results\anim_qrad_temp.gif','gif', 'Loopcount',inf);


for j = 1:loops
        deltaphi_rad_conv = pi*(j)/loops/2;
        qrad = q1rad*cos(w*t-deltaphi_rad_conv);
        [a h1 h2] = plotyy(t,thetaa+1000,t,qrad+q1rad);
        h1.Color = 'k';
        h2.Color = 'k';
        h2.LineStyle = '--';
        
        a(1).XColor = 'k';
        a(2).XColor = 'k';
        a(1).YColor = 'k';
        a(2).YColor = 'k';
        a(1).XTick = [ 0, 3600*2, 3600*4, 3600*6 ];
        a(2).XTick = [ 0, 3600*2, 3600*4, 3600*6 ];
        a(1).XTickLabels = { '0', '3600*2', '3600*4', '3600*4' };
        a(2).XTickLabels = { '0', '3600*2', '3600*4', '3600*4' };
        a(1).YTick = [-thetaa1+1000 1000 thetaa1+1000];
        a(2).YTick = [0 q1rad*1 q1rad*2];
        a(1).YLim = [500 thetaa1+1000];
        a(2).YLim = [0 q1rad*2];
        title('Ambient temperature vs heat flux');

        %%xlabel('{\itTime}, s');
        xlabel('{\it\phi_{conv}^{rad}}, \circ');
        ylabel('{\itT}, C');
        set(gca, 'FontName', 'Arial')
        set(gca, 'FontSize', 14);
        set(gcf,'color','w');
        drawnow
        %xticks([0 900 1800 2700 3600]);
        F(j) = getframe(h);
        frame = getframe(h);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        % Write to the GIF File 
          imwrite(imind,cm,'results\anim_qrad_temp.gif','gif','WriteMode','append');
end