% Solution parameters.
l0 = 1;

syms r phi t real

% Grid dimensions.
rsp = 0.1;
phisp = pi/70;
rf = 0:rsp:5;
phif = 0:phisp:2*pi+phisp;

% Form a superposition.
n = [10 5 8 3 9];
ml = [2 4 -5 -1 -2];
coeff = [10 4 7 3 6];
coeff = coeff / norm(coeff);
[wf, E] = spp(n, ml, coeff, 1);
assumeAlso(r > 0)
[J, Jp, Ja, Jc, Jpc, Jac] = current(wf, l0);

% t = 0;
% plotProfile(rf, phif, wf(r,phi,t), J(r,phi,t))

%%%%%%%% Animate time evolution %%%%%%%%%
% Sufficient time for evolution to complete a period, not necessarily an
% integral multiple. Referred to as pseudo-period.
Tp = 2*pi / min(E);
% Time interval to generate an animation.
% Number of frames per pseudo-period.
num_frames = 30;
T = 0: Tp/num_frames: 2*Tp;
% Probability density animation.
pvideo = VideoWriter(sprintf('n=%s,ml=%s,c=%s.avi', mat2str(n), mat2str(ml), mat2str(round(coeff, 2))));
pvideo.FrameRate = 15;
open(pvideo);

for t = T
    [pfig, ~] = plotProfile(rf, phif, wf(r,phi,t), {}, {sprintf('$\\tau=%.2f$', t)});
    caxis([0 0.08])
    writeVideo(pvideo, getframe(pfig));
%     close all
end
close(pvideo);