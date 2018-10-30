%Task 5.5 a
%sim('p5p3b.mdl')

% Declaring variabes

omega_0 = 0.7823;
lambda = 0.09;
K = 0.1561;
T = 72.4347;
sigma = sqrt(7.919*10^-4);
K_w = 2*lambda*omega_0*sigma;
I = eye(5); %identity matrix
t = 0.1;

% Declaring matrix A, B, C amd E from 5.4 a)

A = [0 1 0 0 0;
    -omega_0^2 -2*lambda*omega_0 0 0 0;
    0 0 0 1 0;
    0 0 0 -1/T -K/T;
    0 0 0 0 0];

C = [0 1 1 0 0];

B= [0;
    0;
    0;
    K/T;
    0];
E= [0 0;
    K_w 0;
    0 0;
    0 0;
    0 1];
%Discretize continous model using exact discretization
%Sample frequency of 10Hz-> sample time of 0.1s
%Using matlab function c2d
%{
T_s=0.1;
[A_d, B_d]=c2d(A,B,T_s);
[A_d, E_d]=c2d(A,E,T_s);
C_d=C;
%}
%Computing with theory
A_d = expm(A.*t); % e^A
syms x;
f = expm(A.*x);
B_d = vpaintegral(f,[0 t])*B;
E_d = vpaintegral(f,[0 t])*E;


