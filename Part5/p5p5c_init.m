%Task 5.5 c
%Initialize 5.5 a and b first
%sim('p5p5c.slx')
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

data = struct('A_d',A_d,'B_d',B_d,'C_d',C_d,'E_d', E_d, 'Q',Q,'R_rad_d', R_rad_d,'P_0',P_0,'x_0',x_0, 'I', eye(5));
sim('p5p5c.slx')