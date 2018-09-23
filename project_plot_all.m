%%plot all

close all
clc
format long

%%INITIAL CONDITIONS

thetaa1 = 500; % ��������� �����������
w = 2*pi*1/4/3600; %�������
t = 0:10:4800; %�����
q1rad = 10000; %%���������� �������� ����������
k = 1; %% ���������� ����������
sigma = 100; %% ���������� ���������
B = 200; %%����������� ����������� ��������� �����-�����������
b = sqrt(k*k+k*sigma);
A = (b-k)/(b+k); %% �������
c = 450; %%�����������
rho = 1000; %%���������
Kt = 0.1; %% ����������� ����������������
at = Kt/c/rho; %%����������� ����������������������
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
w = 2*pi*1/4/3600; %�������
t = 0:10:3600*8; %�����
anim_4
w = 2*pi*1/4/3600; %�������
t = 0:10:4800; %�����
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
