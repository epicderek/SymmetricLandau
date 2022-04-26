function pfig = plotPDensity(rf, phif, wf, titleStr, suppressFig)

if ~exist('suppressFig', 'var')
    suppressFig = 0;
end

% Ensure proper dependences of symbolic function.
syms r phi real
wf = symfun(wf, [r,phi]);
% Convert symbolic function to numeric function for efficiency.
wf = matlabFunction(wf);

% Convert to Cartesian coordinates for plotting.
x = rf.*cos(phif);
y = rf.*sin(phif);
% Evaluate wave function and probability current on grid.
wff = wf(rf, phif);
% Probability density.
pd = conj(wff).*wff;

% Plot of probability.
if suppressFig
    pfig = figure('visible', 'off');
else
    pfig = figure;
end
pcolor(x, y, pd);
colorbar
xlabel('$x$')
ylabel('$y$')
title(titleStr)