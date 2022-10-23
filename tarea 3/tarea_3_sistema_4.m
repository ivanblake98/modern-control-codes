%tarea 3 prueba propia de programa para solución no homogénea
%tarea 3 tac
%sistema 4
clear
clc
syms S s t tau


'a' %display label
A = [0,1;...
    -1,0]; %create matrix A
B = [0;...
    2]; %create vector B
X0 = [0;...
    1]; %Create initial condition vector

U = 1; %Create u(t) unit step
SI = [S,0;...
    0,S]; %Create identity matrix
'E = (inv(SI-A))' %display label
E = (inv(SI-A))


'Fi(t)' %display label
Fi = ilaplace(E); %form state-transiton matrix Fi(t)
pretty(Fi)

Fitmtau = subs(Fi,t,t-tau); %form Fi(t-tau), replace t for t-tau
'Fi(t-tau)' %display label
pretty(Fitmtau)
X = Fi*X0 + int(Fitmtau*B*U,tau,0,t); %solve for x(t)
Xaux2 = simplify(X);
'x(t)'

pretty(Xaux2)
pause