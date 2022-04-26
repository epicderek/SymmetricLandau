function rfig = plotRadialPD(rf, wf, titleStr, legendStr, suppressFig)
% Plot the radial probability density given by ρ(r) = 2*π*r*(R(r))^2.

if ~exist('suppressFig', 'var')
    suppressFig = 0;
end

syms r phi
wf = symfun(wf, [r phi]);
% Remove angular dependence and convert to numeric handle.
rho = matlabFunction(2*pi*r*wf(r,0).^2);

if ischar(suppressFig) && strcmp(suppressFig, 'nonewfig')
    rfig = -1;
    plot(rf, rho(rf))
    legend(legendStr)
    return
elseif suppressFig
    rfig = figure('visible', 'off');
else
    rfig = figure;
end
plot(rf, rho(rf))
xlabel('$r$')
ylabel('Radial density $\rho(r)$')
legend(legendStr)
title(titleStr)