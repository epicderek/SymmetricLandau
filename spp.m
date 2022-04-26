function [wf, E] = spp(n, ml, c, l0)
% Form a superposition of the energy eigenfunctions as specified by the
% quantum numbers 'n' and 'ml' and corresponding coefficients 'c'.

syms r phi t real
assumeAlso(r >= 0)
% Here time is non-dimensionalized by ω_c.
wf = 0;
% Store energy levels for reference.
E = zeros(1, length(n));

for k = 1: length(n)
    nk = n(k);
    mlk = ml(k);
    Ek = energyLevel(nk,mlk);
    E(k) = Ek;
    wf = wf + c(k)*exp(-1i*Ek*t)*symmetricLandau(nk,mlk,l0);
end

% Add symbolic dependences as a function.
wf = symfun(wf, [r,phi,t]);
