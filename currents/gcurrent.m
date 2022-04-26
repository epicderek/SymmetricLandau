function [J, Jc] = gcurrent(wf, l0)
% Gauge current of a symmetric gauge.

syms r phi real
assumeAlso(r >= 0)

% Current in polar basis.
Jr = symfun(0, [r,phi]);
% Omitting h/2m.
Jphi(r,phi) = symfun(-1/l0^2 * r .* wf.*conj(wf), [r,phi]);

% Vector function.
J(r,phi) = [Jr; Jphi];
% Cell array for conversion to numeric functions for efficient evaluation.
Jc = {Jr, Jphi};
