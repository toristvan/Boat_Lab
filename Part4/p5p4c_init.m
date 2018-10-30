% Declaring variabes

K = 0.1561;
T = 72.4347;

% Making matrix A band C

A = [0 1 0;
0 -1/T -K/T;
0 0 0];

C = [1 0 0];

% Calculating observability
Ob = obsv(A,C);

%Displaying
disp('Observability matrix:');
disp(Ob);
disp('Rank:')
disp(rank(Ob))