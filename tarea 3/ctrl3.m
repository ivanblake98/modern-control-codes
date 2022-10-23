%ej 3
syms s

num = s^2+6*s
den = s*(s+2)*(s^2+2*s+2)*((s+3)^3)
polos = solve(den)
ceros = solve(num)