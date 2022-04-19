% Solution parameters.
n = 1;
ml = -1;
l0 = 1;

syms r phi t real

% Grid dimensions.
rsp = 0.1;
phisp = 0.2;
rf = 0:rsp:5;
phif = 0:phisp:2*pi+phisp;

% Superpose two energy eigenstates.
Eef1 = symmetricLandau(1,1,l0);
Eef2 = symmetricLandau(1,-1,l0);

wf = spp([1 1], [1 -1], [1 1], 1);
J = pcurrent(wf);
% Add back time dependence.
J(r,phi,t) = J;
plotProfile(rf, phif, wf(r,phi,1), J(r,phi,1))