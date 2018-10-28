%close all
cla

thetaa = thetaa1*cos(w*t);

%h = figure('rend','painters','pos',[100 100 650 700])

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
h2.LineStyle = '--';
ba = a(1);
bb = a(2);
a(1).XColor = 'k';
a(1).XTick = [ 0, 1200, 2400, 3600 ];
a(2).XTick = [ 0, 1200, 2400, 3600 ];
a(1).XTickLabels = { '0', '30', '60', '90' };
a(2).XTickLabels = { '0', '30', '60', '90' };
a(2).XColor = 'k';
a(1).YColor = 'k';
a(2).YColor = 'k';
a(1).YTick = [1000 1000+(thetaa1)/2 thetaa1+1000];
a(2).YTick = [q1rad q1rad*1.5 q1rad*2];
a(1).YLim = [1000 thetaa1+1000];
a(2).YLim = [q1rad q1rad*2];
%title('Ambient temperature vs heat flux');

xlabel('{\it\phi_{conv}^{rad}} ,\circ');
%ylabel('{\itT}, C');
ylabel('{\it\theta_{A}(t)}, C');
set(gca, 'Position', [0.23 0.2 0.65 0.65])
gca1 = a(1);
set(gca, 'FontName', 'Arial')
set(gca, 'FontSize', 25);
gca1 = a(2);
set(gca1, 'FontName', 'Arial')
set(gca1, 'FontSize', 25);
set(gcf,'color','w');
%%legend('\theta_{a}(t)','q^{rad}(t)');

for j = 1:4
        hold on
        deltaphi_rad_conv = pi/6*(j-1);
        qrad = q1rad*cos(w*t-deltaphi_rad_conv);
        [a h1 h2] = plotyy(t,thetaa+1000,t,qrad+q1rad);
        h1.Color = 'k';
        h2.Color = 'k';
        h2.LineStyle = '--';
        a(1).XColor = 'k';
        a(2).XColor = 'k';
        a(1).YColor = 'k';
        a(2).YColor = 'k';
        a(1).YTick = [1000 1000+(thetaa1)/2 thetaa1+1000];
        a(2).YTick = [q1rad q1rad*1.5 q1rad*2];
        a(1).YLim = [1000 thetaa1+1000];
        a(2).YLim = [q1rad q1rad*2];
        handles.ax2=a(2);
        %title('Ambient temperature vs heat flux');
        %%legend('\theta_{a}(t)','q^{rad}(t)');

        xlabel('{\it\phi_{conv}^{rad}} ,\circ');
        ylabel('{\it\theta_{A}(t)}, K');
        %a(1).Visible = false;
        a(2).Visible = 'off';
        gca1 = a(1);
        set(gca1, 'FontName', 'Arial')
        set(gca1, 'FontSize', 20);
        gca1 = a(2);
        set(gca1, 'FontName', 'Arial')
        set(gca1, 'FontSize', 20);
        set(gcf,'color','w');
        
end

%set(gcf,'PaperPositionMode','auto')
%print('results\theta_qrad','-dpng')