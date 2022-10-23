%E11.2

syms S x1 x2 k1 k2 r


A = [0,1;3,0];
B = [0;1];
%x = [-k1;-k2];
%u = [-k1*x1 -k2*x2 r];

A_nueva = [0,1;3-k1,-k2];
SI = [S,0;0,S];
ec_caracteristica = det(SI - A_nueva)
