function s = sppStr(n, ml, c)

% Format string.
fs = repmat('%.2f\\phi_{%d,%d}+', 1, length(n));
disp(fs)
fs = strcat('$\\psi=', fs(1:end-1), '$');

n = reshape(n, 1, []);
ml = reshape(ml, 1, []);
c = reshape(c, 1, []);
% Indices for printing.
inds = [c; n; ml];
inds = inds(:);

s = sprintf(fs, inds);
