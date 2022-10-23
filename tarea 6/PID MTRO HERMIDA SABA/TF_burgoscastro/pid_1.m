%Ejercicio 1 Dise�o de controlador PID
planta = tf([100],[1 10 100]) %Paso 1: se define la planta
%el controlador PID tiene el modelo: Kp + Kd*s + Ki/s
%Seg�n el libro el PID consiste en un PI en cascada con un PD, por lo tanto
%Gc = (1+Kd1*s)(Kp2+Ki2/s)
%La constante proporcional del PD es establecida como la unidad, los 3
%par�metros del PID son:
%Kp = Kp2+Kd1*Ki2; Kd = Kd1*Kp2; Ki = Ki2
%Se evalua la funci�n de lazo abierto para evaluar el error de velocidad:
%G(S) = Gc(S)*Gp(S)
%De error en estado estable se obtiene que Kv = Ki2 y es dada por los
%requerimientos de dise�o Kv = Ki2 = 100;
%Paso 2: se selecciona el valor de Kd1, se hace Kd1 = 0
%Paso 3: Se selecciona Ki2 y Kp2 pero Ki2 = 100, por tabla de routh se
%obtiene la condici�n para estabilidad asint�tica:  Kp > 9 
%La ecuaci�n final es: G(S) = (100(1+Kd1*s)(Kp2*s+Ki2)/s(s^2+10s+100)
%Llamemos a la ecuaci�n final planta2 y probemos con Kp2 = 11 valor el cual
%est� en el rango de estabilidad, recordar que Ki2 = 100 y desarrollando
%algebr�icamente hasta que podamos ingresar la funci�n de transferencia en
%MATLAB y dando el valor de 0.2 a Kd1 resulta:
planta2 = tf([1100*0.2, 10000*0.2 + 1100 , 10000] , [1 10 100 0])
g = feedback(planta2,1)
%probemos la respuesta del sistema con esos par�metros
step(g)
stepinfo(g)
%Cumple con los requerimientos de  tiempo de asentamiento < 0.1 s
%Y sobrepaso m�ximo < 2%
%Calculemos Kp,Kd y Ki;  
Kd = 0.2*11 % Kd = Kd1*Kp2;
Kp = 11 + 0.2*100 %Kp=Kp2+Kd1*Ki2;
Ki = 100 %y en este caso Ki=Ki2=100
Gc = tf([Kd Kp Ki] , [1 0]) %Ecuaci�n final del controlador PID
G2 = feedback(series(Gc,planta),1)%Funci�n de transferencia en lazo cerrado
figure
step(G2,10)%Realicemos la prueba del escal�n unitario al sistema
stepinfo(G2)%comprobemos que nuestro dise�o cumpla con los requerimientos
