%Task 5.5 c
%sim('p5p5c.slx')
run('p5p5a_init.m');
run('p5p5b_init.m');
%Values for PD-regulator
T_d=T; %to cancel time constant of transfer function
T_f=-10/tan(130*pi/180); %8.3910
K_pd=sqrt((0.01*T_f)^2+0.01)/K; %0.8363

%system constants
psi_ref=30; %degrees
PM=50; %degrees
omega_c=0.10; %rad/s cross frequency;

%Declaring matrices
%w_b=current; measurement noise
%w_w=waves; disturbance
%w=process noise
%w=[w_w;w_b];
%Q=E[w*w'] is process noise covariance given in rad^2
Q=[30 0;
    0 10^-6];
%P_0^- - initial a priori estimate error covariance
P_0=[1 0 0 0 0;
    0 0.013 0 0 0;
    0 0 pi^2 0 0;
    0 0 0 1 0;
    0 0 0 0 2.5*10^-3];
%^x_0^- - initial a priori state estimate
x_0=[0;0;0;0;0];
%states in x:
%{
x=[epsilon(integral of psi_w);
    psi_w (hi freq comp due wave dist);
    psi (avg heading);
    r (rate of change for avg heading;
    b (bias to rudder angle)];
%}
R_rad_d=R_rad/T_s; %0.0016262

data = struct('A_d',A_d,'B_d',B_d,'C_d',C_d,'E_d', E_d, 'Q',Q,'R_rad_d', R_rad_d,'P_0',P_0,'x_0',x_0, 'I', eye(5));
%sim('p5p5c.slx')