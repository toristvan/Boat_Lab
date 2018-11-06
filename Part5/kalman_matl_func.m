function [psi,b]=kalman_matl_func(u,y,data)
persistent init_flag A_k B_k C_k E_k I_k P_pri Q_k R_k x_pri;

if isemptu(init_flag)
    init_flag=1;
    [A_k, B_k, C_k, E_k, I_k, P_pri, Q_k, R_k, x_pri]=deal(data.A_d, data.B_d, data.C_d, data.E_d, eye(1), data.P_0, data.Q, data.R_rad_d, data.x_0);
end
L_k=P_pri*C_k'*inv(C_k*P_pri*C_k' + R_k);
x_post=x_pri+L_k*(
end