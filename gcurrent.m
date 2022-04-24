function J = gcurrent(wf, l0)

syms r phi real
assumeAlso(r >= 0)
J = sym('J', [2 1]);
J(1) = 0;
% Omitting h/2m.
J(2) = -1/l0^2 * r .* wf(r,phi).*conj(wf(r,phi));

J(r,phi) = J;
