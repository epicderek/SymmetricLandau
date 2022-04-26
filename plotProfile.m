function [pfig, cfigs, rf, phif] = plotProfile(rf, phif, wf, Jcs, titleStrs, suppressFig)
% Generate 2D probability density profile and probability current plot
% given symbolic handles of its wave function and current density in
% component form (as a cell array), as generated in the format of
% symmetricLandau.m. The symbolic handles are converted to numeric
% functions for efficiency in numerical evaluations.

if ~exist('suppressFig', 'var')
    suppressFig = 0;
end

% Generate grid.
[rf, phif] = meshgrid(rf, phif);

% Plot probability density profile.
pfig = plotPDensity(rf, phif, wf, titleStrs{1}, suppressFig);

% Plot currents.
cfigs = cell(1, length(Jcs));

% Skip for plotting the current if asked.
if isempty(Jcs)
    return
end

for k = 1: length(Jcs)
    cfigs{k} = plotCurrent(rf, phif, Jcs{k}, titleStrs{k+1}, suppressFig);
end
