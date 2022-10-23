clc
clear

[T,Z]=ode45(@sist_tercer_orden,[0:0.1:5],[0 0 0]); %(de 0 a 5 en 0.1) [ 0 0 0] condiciones iniciales
%C=[1 0 0];  %Matriz C del sistema
%y=C*x=Z_1; Salida del sistema
figure;
plot(T,Z(:,1)); % grafica todos los elementos de Z(:,1)
xlabel('Tiempo [s]');
ylabel('x_1');
