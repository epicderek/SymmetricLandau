function J = current(wf, l0)
% Compute the probability current of a given wave function with the
% dimensionless constant of the magnetic length.

syms r phi real
assumeAlso(r >= 0)
% Sum momentum and gauge currents.
J(r,phi) = pcurrent(wf) + gcurrent(wf, l0);