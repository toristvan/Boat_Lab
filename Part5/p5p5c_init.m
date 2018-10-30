%Task 5.3 c
%sim('p5p3c.mdl')
%Declaring variables
K=0.1561;
T=72.4347;

%Declaring matrices
%w=current; measurement noise
%w=process noise
%w=[w_w;w_b];
%Q=E[w*w'] is process noise covariance given in rad^2
Q=[30 0;
    0 10^-6];
%P_0^- - initial a priori estimate error covariance
%^x_0^- - initial a priori state estimate

