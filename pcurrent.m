function [J, Jc] = pcurrent(wf)

syms r phi t real
assumeAlso(r >= 0)

% Compute gradient of wave function in the polar basis.
Gr = diff(wf, r);
Gphi = diff(wf, phi) ./ r;

% Component-wise (polar) operation so the components may be separately stored.
% Omitting h/2m.
Jr = symfun(-1i*(conj(wf).*Gr - wf.*conj(Gr)), [r,phi]);
Jphi = symfun(-1i*(conj(wf).*Gphi - wf.*conj(Gphi)), [r,phi]);

% Produce a vector function, in the polar basis, perhaps useful for
% symbolic operations.
J(r,phi) = [Jr; Jphi];
% Cell array for conversion to numeric functions for efficient evaluation.
Jc = {Jr, Jphi};
