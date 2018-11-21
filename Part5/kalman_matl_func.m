function [psi,b]=kalman_matl_func(u,y,data)
%coder.extrinsic('evalin')
persistent init_flag A_k B_k C_k E_k I_k P_pri Q_k R_k x_pri;

if isempty(init_flag)
    init_flag=1;
    [A_k, B_k, C_k, E_k, I_k, P_pri, Q_k, R_k, x_pri] = deal(data.A_d,data.B_d,data.C_d, data.E_d, data.I, data.P_0, data.Q, data.R_rad_d, data.x_0);
end
% 1:Compute Kalman Gain
L_k=P_pri*C_k'*inv(C_k*P_pri*C_k' + R_k);

% 2: Update estimate with measurement
x_post=x_pri+L_k*(y-C_k*x_pri);

% 3 - Update error covariance matrix
P_post = (I_k - L_k*C_k)*P_pri*(I_k - L_k*C_k)'+L_k*R_k*L_k';

% 4 - Projet ahead
x_pri = A_k*x_post + B_k*u;
P_pri = A_k*P_post*A_k' + E_k*Q_k*E_k';

% Output
psi = x_post(3); b = x_post(5);

end
