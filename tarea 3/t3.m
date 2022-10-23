%tarea 3 tac
%s1
clear
clc
syms S s t tau
%A = [0,1;...
%    -2,-3];
%SI = [S,0;...
%    0,S];
%eat = ilaplace(inv(SI-A))
%
%ci = [1;...
%    0];
%m_trans_edos = eat*ci

%sistema 2
%A = [0,1;...
%    1,-6];
%SI = [S,0;...
%    0,S];
%eat = ilaplace(inv(SI-A));
%ci = [0;...
%    1];
%m_trans_edos = eat*ci
%pretty(m_trans_edos)

'a' %display label
A = [0,1;...
    -8,-6]; %create matrix A
B = [0;...
    1]; %create vector B
X0 = [1;...
    0]; %Create initial condition vector

U = 1; %Create u(t) unit step
I = [1,0;...
    0,1]; %Create identity matrix
'E = ((S*I-A)^(-1))' %display label
E = ((S*I-A)^-1)

Fi11 = ilaplace(E(1,1)); %take laplace transform of each element of (S*I-A)^-1 to find state-transition matrix
Fi12 = ilaplace(E(1,2));
Fi21 = ilaplace(E(2,1));
Fi22 = ilaplace(E(2,2));
'Fi(t)' %display label
Fi = [Fi11, Fi12;...
    Fi21, Fi22]; %form state-transiton matrix Fi(t)
pretty(Fi)

Fitmtau = subs(Fi,t,t-tau); %form Fi(t-tau)
'Fi(t-tau)' %display label
pretty(Fitmtau)
X = Fi*X0 + int(Fitmtau*B*U,tau,0,t); %solve for x(t)
%Xaux1 = simple(X);
Xaux2 = simplify(X);
'x(t)'
pretty(Xaux2)
pause

