%E11.3
A = [0,1;0,-3];
B = [0;1];
C = [0 2];
pc = [B,A*B]; %matriz de controlabilidad
controlabilidad = det(pc) %si es diferente de cero es controlable
po = [C;C*A] %matriz de observabilidad
det(po)
