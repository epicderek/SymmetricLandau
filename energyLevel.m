function E = energyLevel(n, ml)
% Compute the non-dimensionalized energy eigenvalue (by h*ω_c) given the
% specifications of an eigenfunction of energy.

E = 1/2 + n + (abs(ml)-ml)/2;