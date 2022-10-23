%s1
clear
clc
syms S s t tau
A = [0,1;...
    -2,-3];
SI = [S,0;...
    0,S];
eat = ilaplace(inv(SI-A))

ci = [1;...
    0];
m_trans_edos = eat*ci

pretty(m_trans_edos)