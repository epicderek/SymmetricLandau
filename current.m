function [J, Jp, Ja, Jc, Jpc, Jac] = current(wf, l0)
% Compute the probability current of a given wave function with the
% dimensionless constant of the magnetic length.

syms r phi real
assumeAlso(r >= 0)

[Jp, Jpc] = pcurrent(wf);
[Ja, Jac] = gcurrent(wf, l0);
% Sum momentum and gauge currents. Vector in polar basis.
J(r,phi) = symfun(Jp + Ja, [r,phi]);
Jc = cell(1,2);
Jc{1} = Jpc{1} + Jac{1};
Jc{2} = Jpc{2} + Jac{2};