%E11.4
A = [-4,0;0,-1];
B = [0;1];
C = [1 0];
pc = [B,A*B] %matriz de controlabilidad
det(pc)
po = [C;C*A] %matriz de observabilidad
det(pc)