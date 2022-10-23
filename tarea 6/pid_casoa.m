%Tarea controladores pid TAC
syms Kp Ti Td s EPS K
%Caso b) Posee integrador, por lo tanto usaremos el segundo método de
%ziegler-nichols, fijemos Ti = inf y Td = 0, solo tomamos en cuenta Kp y se
%varía de 0 a un valor crítico Kcr
planta = (1)/(2*s^2+5*s+50)% planta ejercicio a
planta1 = tf([1],[2 5 50]) %en toolbox
pretty(planta)
nump = [1]
denp = [2 5 50]
step(nump,denp)
grid
title('Respuesta escalón unitario1')
hold on
Gc = Kp; %controlador inicial caso a
ft = simplify(expand(vpa((planta*Gc)/(1+(planta*Gc*1))))) % Obtengamos la Función de transferencia caso b
pretty(ft)
%del resultado anterior obtenemos la ecuación característica, el
%denominador
ec_caracteristica = (2.0*s^2 + 5.0*s + Kp + 50.0)
%para la función Routh Kp es K
estabilidad_b = routh([2 5 (K+50)],EPS)
%del criterio de estabilidad anterior, vemos que cuando Kp = -50 hay una
%oscilación por lo tanto Kcr = -50
Kcr = -50
%por lo tanto la nueva ec característica es:
ec_car_kcr = 2*s^2+5*s
%Obtengamos frecuencia de oscilación: tomaremos el polinomio auxiliar con
%los coeficientes de la fila anterior inmedianta al valor que hace oscilar
%al sistema (La K diferente de cero), en este caso, fila 2 del arreglo de routh:
Paux = 5*s %polinimio auxiliar
roots([5 0])
%Por lo tanto la frecuencia de oscilación es 0
%w = 0
%Como la frecuencia de oscilación no puede ser cero, debemos acudir a la
%experimentación para bosquejar el valor de Kcr y Per, proponemos Kcr = -40
%Apliquemos step a la ft
step([-40],[2 5 10])
grid
hold on


Kcr = -40
Per = 1
%la frecuencia
%Obtengamos el periodo de oscilación:
%Per = 2*pi/w %Per = 1.2825
%De la tabla 8-2 del ogata, tenemos los siguientes modelos para el PID:
Kp = 0.6*Kcr %Kp = 15.8400
Ti = 0.5*Per %Ti = 0.6413
Td = 0.125*Per %Td = 0.1603


%Por lo tanto la función de transferencia del PID es:
Gc_pid = Kp*(1+(1/(Ti*s))+Td*s)
%zeros_pid = roots([81424236.31;0;792006633]) %dos ceros del pid en +j3.1188 y -j3.1188
%polos_pid = roots([10206250*pi;0]) %polos del pid (tiene un polo en el origen)
FT_final = (Gc_pid*planta)/(1+((Gc_pid*planta)*1)) %función de transferencia final = Planta por el pid
FT_final_aux = simplify(expand(vpa((FT_final))))%1.5s^2+12s+24/den
pretty(FT_final_aux) 
num=[-1.5 -12 -24]
den = [1 1 13 -24]
step(num,den)
grid
title('Respuesta escalón unitario1')
hold on

