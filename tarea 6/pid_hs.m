syms s
Kcr = 26.4
%por lo tanto la nueva ec característica es:
ec_car_kcr = s^3+11*s^2+24*s+264
%Obtengamos frecuencia de oscilación: tomaremos el polinomio auxiliar con
%los coeficientes de la fila anterior inmedianta al valor que hace oscilar
%al sistema (La K diferente de cero), en este caso, fila 2 del arreglo de routh:
Paux = 11*s^2 + 10*26.4 %Pa = 11s^2+10*K, pero K = 26.6 y K = Kc4
roots([11;0;10*26.4])
%Por lo tanto la frecuencia de oscilación es 4.9890
w = 4.8990
%Obtengamos el periodo de oscilación:
Per = 2*pi/w %Per = 1.2825
%De la tabla 8-2 del ogata, tenemos los siguientes modelos para el PID:
Kp = 0.6*Kcr %Kp = 15.8400
Ti = 0.5*Per %Ti = 0.6413
Td = 0.125*Per %Td = 0.1603
%%%%%%%%%%%%%%%%%%
Kd = 0.125*Per % Kd = Kd1*Kp2;
Kp = 0.6*Kcr %Kp=Kp2+Kd1*Ki2;
Ti = 0.5*Per %y en este caso Ki=Ki2=100
Gc = tf([Kp*Kd*Ti Kp*Ti Kp] , [Ti 0]) %Ecuación final del controlador PID
plantab = tf([10],[1 11 24 0])
G2 = feedback(series(Gc,plantab),1)%Función de transferencia en lazo cerrado
figure
step(G2,10)%Realicemos la prueba del escalón unitario al sistema
stepinfo(G2)%comprobemos que nuestro diseño cumpla con los requerimientos