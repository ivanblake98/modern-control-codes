clc
clear
%La sintaxis es la siguiente...
%[T,Z]=ode45(@funcion,[t0,delta_t,tf],[z10,z20,z30]);
%[Tiempo,Estados]=ode45(@sistema,[t_inicial,delta_tiempo,t_final],[Cond_inicial_z1,Cond_inicial_z2,Cond_inicial_z3]);
[T,Z]=ode45(@sistema,[0:0.1:10],[0,0,0]);
%Matrices de salida
%C=[1 1 0];  D=[0]; U=1;
%Vector de salida
%Y=C*Z+D*U;
%Grafica de la solución del sistema.
figure;
plot(T,Z(:,1));
xlabel('Tiempo [s]');
ylabel('Estado Z_1');
title('Z_1 Vs tiempo');

figure;
plot(T,Z(:,2));
xlabel('Tiempo [s]');
ylabel('Estado Z_2');
title('Z_2 Vs tiempo');

figure;
plot(T,Z(:,3));
xlabel('Tiempo [s]');
ylabel('Estado Z_3');
title('Z_3 Vs tiempo');
