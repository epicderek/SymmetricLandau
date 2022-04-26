function E = energyLevel(n, ml)
% Compute the energy eigenvalue (scaled by 1/(h*ω_c)) given the
% quantum numbers specifying an eigenfunction of energy.

E = 1/2 + n + (abs(ml)-ml)/2;