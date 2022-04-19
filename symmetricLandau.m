function [Eef, J] = symmetricLandau(n, ml, l0)
% Compute the Landau states of a symmetric gauge for an electron given the
% radial and angular momentum quantum numbers, with an optional specified
% value of magnetic length.

syms r phi real
assumeAlso(r >= 0)

%%%%%%%% Radial dependence %%%%%%%%
% Radial normalization.
N = sqrt(factorial(n)/(l0^2*2^abs(ml)*factorial(n+abs(ml))));
% Corresponding Laguerre polynomial.
L = assocLaguerre(n, abs(ml));

R(r) = N*(r/l0).^abs(ml) .* exp(-r.^2/(4*l0^2)) .* L(r.^2/(2*l0^2));

%%%%%%%% angular dependence %%%%%%%%
Phi(phi) = exp(1i*ml*phi) / sqrt(2*pi);

% Energy eigenfunction with specified parameters.
Eef(r, phi) = simplify(R(r)*Phi(phi));

% Probability current, omitting h/2m, in planar polar coordinates.
J = pcurrent(Eef);

