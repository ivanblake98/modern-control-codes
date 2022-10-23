%E11.1
syms S K EPS
SI= [S,0;0,S];
A = [0,1;1,0];
KA = [-1,0;0,-K];
B =[1,0;0,1];
xpunto=A + B*KA;
det(SI- xpunto) %equispunto en realidad es la nueva Ax (solo matriz A)
polos = [1 1 -1]
r = roots(polos)
estabilidad=routh([1 (1+K) (K-1)],EPS)
