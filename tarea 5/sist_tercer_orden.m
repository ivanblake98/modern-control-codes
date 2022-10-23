function dx=sist_tercer_orden(t,x)
dx=zeros(3,1); %genera los tres estados, vector 3x1 num estados que tiene el sistema, es equis punto
A=[0 1 0;
   0 0 1;
   -2 -3 -5]; %Matriz A del sistema de tercer orden
B=[0 0 1]';  %MAtriz B del sistema de tercer orden

K=[170.8 79.1 9.4]; %Vector de ganancias calculadas en el ejemplo, se calculan por fuera, aparte
R=1;  % Referencia: Escalon unitario
u=-K*x+R; %Controlador diseñado
dx=A*x+B*u; %Ecuaciones del sistema en lazo cerrado