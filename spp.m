function wf = spp(n, ml, c, l0)
% Form a superposition of the eigenfunctions as specified by the quantum
% numbers and corresponding coefficients.

syms r phi t real
% Here time is non-dimensionalized by ω_c.
wf = 0;
for k = 1: length(n)
    nk = n(k);
    mlk = ml(k);
    wf = wf + c(k)*exp(-1i*energyLevel(nk,mlk)*t)*symmetricLandau(nk,mlk,l0);
end

% Add symbolic dependences as a function.
wf(r,phi,t) = wf;
