function cfig = plotCurrent(Jc, rf, phif, titleStr)
% Plot current given a symbolic function and the meshgrids.

% Ensure proper dependences of symbolic function.
syms r phi real
assumeAlso(r >= 0)

% Unpack components (in polar basis) of current.
Jr = symfun(Jc{1}, [r phi]);
Jphi = symfun(Jc{2}, [r,phi]);
% Convert symbolic function to handle.
Jr = matlabFunction(Jr);
Jphi = matlabFunction(Jphi);

% Conversion to Cartesian coordinates for plotting.
cosphi = cos(phif);
sinphi = sin(phif);
x = rf.*cosphi;
y = rf.*sinphi;

% Vector symbolic notation requires additional formatting.
Jf = zeros([2 size(rf)]);
Jf(1,:,:) = Jr(rf, phif);
Jf(2,:,:) = Jphi(rf, phif);
% % Remove singularity at r = 0.
% try
%     Jff = J(rf, phif);
%     Jf(1,:,:) = eval(Jff{1});
%     Jf(2,:,:) = eval(Jff{2});
% catch
%     warning('Singularity encountered: assumed at r = 0!')
%     % Remove r = 0 from plotting region of current.
%     rf2 = rf(:,2:end);
%     phif2 = phif(:,2:end);
%     Jff = J(rf2, phif2);
%     Jf(1,:,2:end) = eval(Jff{1});
%     Jf(2,:,2:end) = eval(Jff{2});
% end

% Conversion from polar to Cartesian basis.
Jfx = squeeze(Jf(1,:,:)).*cosphi;
Jfy = squeeze(Jf(1,:,:)).*sinphi;
Jfx = Jfx - squeeze(Jf(2,:,:)).*sinphi;
Jfy = Jfy + squeeze(Jf(2,:,:)).*cosphi;

% Plot of probability current.
cfig = figure;
scale = 0.2;
quiver(x, y, Jfx, Jfy, scale);
xlabel('$x$')
ylabel('$y$')
title(titleStr)
