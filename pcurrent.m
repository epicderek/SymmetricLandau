function J = pcurrent(wf)

syms r phi t real

% Compute gradient of wave function.
G = sym('G', [2 1]);
G(1) = diff(wf, r);
G(2) = diff(wf, phi) ./ r;

% Probability current, omitting h/2m, in planar polar coordinates.
J(r, phi) = conj(wf).*G - wf.*conj(G);
J = simplify(-1i*J);