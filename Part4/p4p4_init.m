% Declaring variabes

omega_0 = 0.7823;
lambda = 0.09;
T = 72.4347;


% Making matrix A band C

A = [0 1 0 0;
-omega_0^2 -2*lambda*omega_0 0 0;
0 0 0 1;
0 0 0 -1/T];

C = [0 1 1 0];

% Calculating observability
Ob = obsv(A,C);

%Displaying
disp('Observability matrix:');
disp(Ob);
disp('Rank:')
disp(rank(Ob))