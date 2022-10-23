%Tarea controladores pid TAC
syms Kp Ti Td s EPS K
%Caso b) Posee integrador, por lo tanto usaremos el segundo m�todo de
%ziegler-nichols, fijemos Ti = inf y Td = 0, solo tomamos en cuenta Kp y se
%var�a de 0 a un valor cr�tico Kcr
p2 = 10/(s*(s+3)*(s+8)) % planta ejercicio b
pretty(p2)
Gc2 = Kp; %controlador inicial caso b
ft2 = p2*Gc2/(1+p2*Gc2*1) % Obtengamos la Funci�n de transferencia caso b
pretty(ft2)
%del resultado anterior obtenemos la ecuaci�n caracter�stica, el
%denominador
ec_caracteristicab = (s*((10*Kp)/(s*(s + 3)*(s + 8)) + 1)*(s + 3)*(s + 8))
pretty(ec_caracteristicab)
ec_caractb_simp = simplify((s*((10*Kp)/(s*(s + 3)*(s + 8)) + 1)*(s + 3)*(s + 8)))
ec_carac_b_final = s^3+11*s^2+24*s+10*Kp
%para la funci�n Routh Kp es K
estabilidad_b = routh([1 11 24 10*K],EPS)
%del criterio de estabilidad anterior, vemos que cuando Kp = 26.4 hay una
%oscilaci�n por lo tanto Kcr = 26.4
Kcr = 26.4
%por lo tanto la nueva ec caracter�stica es:
ec_car_kcr = s^3+11*s^2+24*s+264
%Obtengamos frecuencia de oscilaci�n: tomaremos el polinomio auxiliar con
%los coeficientes de la fila anterior inmedianta al valor que hace oscilar
%al sistema (La K diferente de cero), en este caso, fila 2 del arreglo de routh:
Paux = 11*s^2 + 10*26.4 %Pa = 11s^2+10*K, pero K = 26.6 y K = Kc4
roots([11;0;10*26.4])
%Por lo tanto la frecuencia de oscilaci�n es 4.9890
w = 4.8990
%Obtengamos el periodo de oscilaci�n:
Per = 2*pi/w %Per = 1.2825
%De la tabla 8-2 del ogata, tenemos los siguientes modelos para el PID:
Kp = 0.6*Kcr %Kp = 15.8400
Ti = 0.5*Per %Ti = 0.6413
Td = 0.125*Per %Td = 0.1603


%Por lo tanto la funci�n de transferencia del PID es:
Gc_pid = Kp*(1+(1/(Ti*s))+Td*s)
pretty(Gc_pid)
Gc_pid2 = simplify(Gc_pid)
pretty(Gc_pid2)
denominador_pid = (10206250*s*pi)
numerador_pid = (33*(500*pi*s + 4899)^2)
zeros_pid = roots([81424236.31;0;792006633]) %dos ceros del pid en +j3.1188 y -j3.1188
polos_pid = roots([10206250*pi;0]) %polos del pid (tiene un polo en el origen)
FT_final = (Gc_pid*p2)/(1+((Gc_pid*p2)*1)) %funci�n de transferencia final = Planta por el pid
FT_final_aux = simplify(FT_final)
pretty(FT_final_aux)
num_final = 33*(500*pi*s + 4899)^2
den_final = (161667000*pi*s + 24495000*pi*s^2 + 11226875*pi*s^3 + 1020625*pi*s^4 + 8250000*s^2*pi^2 + 792006633)
pretty(den_final)
num =[81424236.31,0,792006633];
den = [6885665803588893/2147483648,1183473809991841/33554432,2786207295984200112711/17592186044416,8521011431941255/16777216,792006633];
step(num,den)
grid
title('Respuesta escal�n unitario1')
hold on

%Sintonicemos:
Kp = 23 %Aumentar para aumentar velocidad de respuesta
Ti = 0.65
Td = 0.17
Gc_pid_aux2 = Kp*(1+(1/(Ti*s))+Td*s)
num_aux3 = Gc_pid_aux2*p2
den_aux3 = 1+((Gc_pid_aux2*p2)*1)
num_f3 = expand(vpa(num_aux3))
pretty(num_f3)
den_f3 = expand(vpa(den_aux3))
pretty(den_f3)
final = simplify(num_f3/den_f3)
disp('---------------------------------------------')
pretty(final)
num3 =[19550000000000000000000000000000.0,115000000000000000000000000000000.0,176923076923076923076923076923100.0];
den3 = [500000000000000000000000000000.0,5500000000000000000000000000000.0,31550000000000000000000000000000.0,115000000000000000000000000000000.0,176923076923076923076923076923100.0];
step(num3,den3)
grid
title('Respuesta escal�n unitario')
hold on