%Task 5.5 c
%Initialize 5.5 a and b first
%sim('p5p3c.mdl')
%Declaring variables
K=0.1561;
T=72.4347;

%Declaring matrices
%w_b=current; measurement noise
%w_w=waves;
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
R_rad_d=R_rad/T_s; %0.0016(262)

