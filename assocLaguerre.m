function Ln = assocLaguerre(n, k)
% Both n, k are non-negative integers.

syms x
Ln(x) = simplify(exp(x).*x.^(-k)/factorial(n).*diff(x.^(n+k).*exp(-x), n));