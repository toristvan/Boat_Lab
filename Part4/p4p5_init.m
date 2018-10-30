% Declaring variabes

omega_0 = 0.7823;
lambda = 0.09;
K = 0.1561;
T = 72.4347;
sigma = sqrt(7.919*10^-4);
K_w = 2*lambda*omega_0*sigma;

% Making matrix A band C

A = [0 1 0 0 0;
-omega_0^2 -2*lambda*omega_0 0 0 0;
0 0 0 1 0;
0 0 0 -1/T -K/T;
0 0 0 0 0];

C = [0 1 1 0 0];

% Calculating observability
Ob = obsv(A,C);

%Displaying
disp('Observability matrix:');
disp(Ob);
disp('Rank:')
disp(rank(Ob))

