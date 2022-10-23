%tarea 4 TAC ESTABILIDAD
syms S

SI = [S,0,0;...
    0,S,0;...
    0,0,S];

A = [0,1,-1;...
    -6,-11,6;...
    -6,-11,5]
ec = det(SI - A)
p = [1;6;11;6]
roots(p)

%ecuacioncaracteristica=poly(A) %o usar esta funcion
