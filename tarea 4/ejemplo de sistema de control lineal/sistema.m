function dz=sistema(t,z)
dz=zeros(3,1); %crea matriz de ceros de orden del sistema (3)
A=[0 1 0; 
   0 0 1;
   -10 -15 -20];  %Matriz A de dimensión 3 x 3
B=[0 0 10]';  %Vector de constantes de control

u=1; %Controlador, en este caso función step,... 
    % u=u(t)...puede depender del tiempo t, en este caso no es así.

dz=A*z+B*u;  % Ecuaciones del sistema
% TAmbien se puede escribir como sigue:
% dz(1)=z(2);
% dz(2)=z(3);
% dz(3)=-10*z(1)-15*z(2)-20*z(3)+10*u;