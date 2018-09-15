close all
format long

%%INITIAL CONDITIONS

thetaa1 = 500; % начальная температура
w = 2*pi*1/4/3600; %частота
t = 0:10:3600; %время
q1rad = 20000; %%переменная лучистая компонента
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

thetaa = thetaa1*cos(w*t);

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
[a h1 h2] = plotyy(t,thetaa+1000,t,qrad+q1rad);
h1.Color = 'k';
h2.Color = 'k';
ba = a(1);
bb = a(2);
a(1).XColor = 'k';
a(2).XColor = 'k';
a(1).YColor = 'k';
a(2).YColor = 'k';
a(1).XTick = [ 0, 1200, 2400, 3600 ];
a(2).XTick = [ 0, 1200, 2400, 3600 ];
a(1).XTickLabels = { '0', '30', '60', '90' };
a(2).XTickLabels = { '0', '30', '60', '90' };
a(1).YTick = [1000 1000+(thetaa1)/2 thetaa1+1000];
a(2).YTick = [q1rad q1rad*1.5 q1rad*2];
a(1).YLim = [1000 thetaa1+1000];
a(2).YLim = [q1rad q1rad*2];
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
imwrite(imind,cm,'anim_qrad_temp.gif','gif', 'Loopcount',inf);


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
        a(1).XTick = [ 0, 1200, 2400, 3600 ];
        a(2).XTick = [ 0, 1200, 2400, 3600 ];
        a(1).XTickLabels = { '0', '30', '60', '90' };
        a(2).XTickLabels = { '0', '30', '60', '90' };
        a(1).YTick = [1000 1000+(thetaa1)/2 thetaa1+1000];
        a(2).YTick = [q1rad q1rad*1.5 q1rad*2];
        a(1).YLim = [1000 thetaa1+1000];
        a(2).YLim = [q1rad q1rad*2];
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
          imwrite(imind,cm,'anim_qrad_temp.gif','gif','WriteMode','append');
end