%%plot all

close all
clc
format long

%%INITIAL CONDITIONS

thetaa1 = 500; % начальная температура
w = 2*pi*1/4/3600; %частота
t = 0:10:4800; %время
q1rad = 10000; %%переменная лучистая компонента
k = 1; %% показатель поглощения
sigma = 100; %% показатель рассеяния
B = 200; %%коэффициент теплоотдачи воздушная среда-поверхность
b = sqrt(k*k+k*sigma);
A = (b-k)/(b+k); %% альбедо
c = 450; %%теплоёмкость
rho = 1000; %%плотность
Kt = 0.1; %% коэффициент теплопроводности
at = Kt/c/rho; %%коэффициент температуропроводности
z=0;
deltaphi_rad_conv = 0;

add = 700;

%END INITIAL CONDITION

rad_prof_anim_comb

%z=0 T vs time profile
z0radconv_ext
z0radconv_ext_sum

z = 0:0.0005:0.01;

%components gif
anim_2
w = 2*pi*1/4/3600; %частота
t = 0:10:3600*8; %время
anim_4
w = 2*pi*1/4/3600; %частота
t = 0:10:4800; %время
%static components
anim_2_static

%3d plot phase 0
q_rad01_3d

%z-profiles
rad_prof
rad_prof_900
rad_prof_1800
rad_prof_2400
rad_prof_3600
rad_prof_4800
rad_prof_5600

%albedo plot
albedo_vs_rad_comb
