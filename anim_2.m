close all

t = 0:10:3600*4*10; %время

thetaa = thetaa1*cos(w*t);

loops = 30;
F(loops) = struct('cdata',[],'colormap',[]);

h = figure('rend','painters','pos',[100 100 850 700])

axis tight manual 

ax = gca;
%ax.NextPlot = 'replaceChildren';

ax.XTickMode = 'manual';
ax.YTickMode = 'manual';

deltaphi_rad_conv = 0;
thetaa = thetaa1*cos(w*t-deltaphi_rad_conv);
qrad = q1rad*cos(w*t-deltaphi_rad_conv-pi/3);

[a h1 h2] = plotyy(t,thetaa+add*2,t,qrad+q1rad);
h1.Color = [0 0.5 0];
h2.Color = [1 1 0];
h2.LineWidth = 4;
ba = a(1);
h2.LineStyle = '--';
bb = a(2);
a(1).XColor = 'k';
a(2).XColor = 'k';
a(1).YColor = 'k';
a(2).YColor = 'k';
%a(1).XTick = [ 0, 3600*4*2, 3600*4*4];
%a(1).XTick = [ 0, 3600*4*2, 3600*4*4];
%a(1).YTick = [add*2 add*2+(thetaa1)/2 thetaa1+add*2];
%a(2).YTick = [q1rad q1rad*1.5 q1rad*2];
%a(1).YLim = [add thetaa1+add*6];
%a(2).YLim = [q1rad q1rad*2];
%a(1).XLim = [0 3600*5*4];
%a(2).XLim = [0 3600*5*4];
a(1).YLim = [add thetaa1+add*6];
a(2).YLim = [-q1rad*1.7 q1rad*2.5];
a(1).XLim = [0 3600*4*10];
a(2).XLim = [0 3600*4*10];
a(1).YTick = [];
a(2).YTick = [];
a(1).XTick = [];
a(2).XTick = [];

%%xlabel('{\itTime}, s');
xlabel('{\itz}, m');
ylabel('{\itT}, C');
ylabel('{\it\theta_{A}(t)}, K');
set(gca, 'FontName', 'Arial')
set(gca, 'FontSize', 14);
set(gcf,'color',[0.95 0.95 0.95]);
set(gca,'color',[0.95 0.95 0.95]);

drawnow


F(1) = getframe(h);
frame = getframe(h);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
% Write to the GIF File 

level = 10000;
len = 1000;

q1rad1 = [ones(level,1)' ones(length(t)-level,1)'.*(0.65+exp(-(1:1:(length(t)-level))/len)*0.35)];
thetaaa1 = [ones(level,1)' ones(length(t)-level,1)'.*(exp(-2.*(1:1:(length(t)-level))/len)*1)];
%exp(-(1:1:len))
for j = 1:loops
        deltaphi_rad_conv = 2*pi*(j)/loops;
        thetaa = thetaa1*cos(w*t-deltaphi_rad_conv);
        qrad = q1rad*cos(w*t-deltaphi_rad_conv-pi/3);
        
        
        [a h1 h2] = plotyy(t,thetaaa1.*thetaa+add*2,t,qrad.*q1rad1+q1rad.*q1rad1);
        h1.Color = [0 0 0];
        h2.Color = [0 0 0];
        h2.LineWidth = 4;
        h2.LineStyle = '--';
        
        a(1).XColor = 'k';
        a(2).XColor = 'k';
        a(1).YColor = 'k';
        a(2).YColor = 'k';
        %{
a(1).XTick = [ 0, 1200, 2400, 3600 ];
        a(2).XTick = [ 0, 1200, 2400, 3600 ];
        a(1).XTickLabels = { '0', '30', '60', '90' };
        a(2).XTickLabels = { '0', '30', '60', '90' };
        a(1).YTick = [add*2 add*2+(thetaa1)/2 thetaa1+add*2];
        a(2).YTick = [q1rad q1rad*1.5 q1rad*2];
        a(1).YLim = [add thetaa1+add*6];
        a(2).YLim = [q1rad q1rad*2];
        a(1).XLim = [0 3600*5*4];
        a(2).XLim = [0 3600*5*4];
        %}
        a(1).YLim = [add thetaa1+add*6];
        a(2).YLim = [-q1rad*1.7 q1rad*2.5];
        a(1).XLim = [0 3600*4*10];
        a(2).XLim = [0 3600*4*10];
        a(1).YTick = [];
        a(2).YTick = [];
        a(1).XTick = [];
        a(2).XTick = [];
        
        xlabel('{\itz}, m');
        ylabel('{\it\theta_{A}(t)}, K');
        set(gca, 'FontName', 'Arial')
        set(gca, 'FontSize', 14);
        set(gcf,'color',[1 1 1 ]);
        set(gca,'color',[1 1 1 ]);
        drawnow
        F(j) = getframe(h);
        frame = getframe(h);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        % Write to the GIF File 
        if (j==1)
            imwrite(imind,cm,'results\anim_qrad_temp1.gif','gif', 'Loopcount',inf);
        else
          imwrite(imind,cm,'results\anim_qrad_temp1.gif','gif','WriteMode','append');
        end
end