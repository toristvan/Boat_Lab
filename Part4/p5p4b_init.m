% Declaring variabes
T = 72.4347;

% Making matrix A band C
A = [0 1; 0 -1/T];
C = [1 0];

% Calculating observability
Ob = obsv(A,C);

%Displaying
disp('Observability matrix:');
disp(Ob);
disp('Rank:');
disp(rank(Ob));
