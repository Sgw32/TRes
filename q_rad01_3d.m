close all

%%
deltaphi_rad_conv = 0;
h = figure('rend','painters','pos',[100 100 800 700])
[z,t] = meshgrid(0:.01:1,0:.01:1);
t = t.*3600*4;
z = z.*0.1;%.*1e-12;
theta = rad_f_z(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
cl = gray(5)-0.2;
id = find(cl<1);
cl(id)=0;
colormap(cl);
mesh(z,t,theta+add)
zlim([0 inf])
xlabel('Глубина Z, м');
ylabel('Время, с');
zlabel('Температура, С');
xlabel('{\itz}, m');
ylabel('{\itt}, s');
zlabel('{\it\theta_{A}(t)}, C');
set(gca, 'Position', [0.23 0.2 0.65 0.65])
set(gca, 'FontName', 'Arial')
set(gca, 'FontSize', 25);
set(gcf,'color','w');
%63 46
set(gcf,'PaperPositionMode','auto')
view(235,32);
print('results\tres1_3d','-dpng');
