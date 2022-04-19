function plotProfile(rf, phif, wf, J, qn)
% Generate 2D probability density profile and probability current plot
% given symbolic handles of its wave function and current density,
% generated in the format of symmetricLandau.m.

if ~exist('qn', 'var')
    qn = [0 0];
end
% Generate grid.
[rf, phif] = meshgrid(rf, phif);

% Ensure dependence of symbolic function.
syms r phi real
wf(r,phi) = wf;
J(r,phi) = J;

% Evaluate wave function and probability current on grid.
Eeff = eval(wf(rf, phif));
% Vector symbolic notation requires additional formatting.
Jf = zeros([2 size(rf)]);
Jff = J(rf, phif);
Jf(1,:,:) = eval(Jff{1});
Jf(2,:,:) = eval(Jff{2});

% Convert to Cartesian for plotting.
pd = conj(Eeff).*Eeff;
% Angular values stored.
cosphi = cos(phif);
sinphi = sin(phif);

x = rf.*cosphi;
y = rf.*sinphi;
Jfx = squeeze(Jf(1,:,:)).*cosphi;
Jfy = squeeze(Jf(1,:,:)).*sinphi;
Jfx = Jfx - squeeze(Jf(2,:,:)).*sinphi;
Jfy = Jfy + squeeze(Jf(2,:,:)).*cosphi;

% Plot of probability.
figure;
fp = pcolor(x, y, pd);
colorbar
xlabel('$x$')
ylabel('$y$')
title(sprintf('Probability density for $n=%d$, $m_l=%d$', qn(1), qn(2)))

% Plot of probability current.
figure;
scale = 0.2;
quiver(x, y, Jfx, Jfy, scale);
xlabel('$x$')
ylabel('$y$')
title(sprintf('Probability current for $n=%d$, $m_l=%d$', qn(1), qn(2)))