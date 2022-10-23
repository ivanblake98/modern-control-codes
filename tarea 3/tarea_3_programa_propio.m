%tarea 3 prueba propia de programa para soluci�n no homog�nea
%tarea 3 tac
%sistema 3
clear
clc
syms S s t tau


'a' %display label
A = [0,-1;...
    -1,3]; %create matrix A
B = [0;...
    1]; %create vector B
X0 = [1;...
    0.5]; %Create initial condition vector

U = 1; %Create u(t) unit step
SI = [S,0;...
    0,S]; %Create identity matrix
'E = (inv(SI-A))' %display label
E = (inv(SI-A))

%Fi11 = ilaplace(E(1,1)); %take laplace transform of each element of (S*I-A)^-1 to find state-transition matrix
%Fi12 = ilaplace(E(1,2));
%Fi21 = ilaplace(E(2,1));
%Fi22 = ilaplace(E(2,2));
'Fi(t)' %display label
Fi = ilaplace(E); %form state-transiton matrix Fi(t)
pretty(Fi)

Fitmtau = subs(Fi,t,t-tau); %form Fi(t-tau), replace t for t-tau
'Fi(t-tau)' %display label
pretty(Fitmtau)
X = Fi*X0 + int(Fitmtau*B*U,tau,0,t); %solve for x(t)
%Xaux1 = simple(X);
Xaux2 = simplify(X);
'x(t)'

pretty(Xaux2)
pause