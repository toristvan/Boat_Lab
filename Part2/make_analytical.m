function P = make_analytical(lambda, omega, omega_0, max_1)
    for i = 1:length(omega)
    x = omega(i);
    P(i)= (x^2*4*lambda^2*omega_0^2*max_1)/(x^4+omega_0^4+2*omega_0^2*x^2*(2*lambda^2-1));
end

