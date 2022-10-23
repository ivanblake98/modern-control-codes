%Este script pretende dise�ar un controlador PID
planta = tf([6],[1 6 12 8]) %se define la planta
[y,t] = step(planta) %se extraen los valores de tiempo y magnitud de la planta (aplicando el step)
yu = max(y) 
%por m�todo de S y K calculamos los instantes de tiempo en que se alcanza
%el 35,5% y el 85.3% del valor final
t35 = spline(y,t,0.353*yu) %hallemos las constantes de tiempo
t85 = spline(y,t,0.853*yu)
tau = 0.67*(t85-t35) %modelo proporcionado por el m�todo
td = 1.3*t35-0.29*t85 %modelo proporcionado por el m�todo
K = yu %debido a que K = yu/A pero A en este caso es la unidad
%Dise�o del controlador por m�todo de la curva de reacci�n:
Kc = (1.2*tau)/(K*td) %De la tabla del m�todo de Zieglers y Nichols
Ti = 2*td
Td = 0.5*td
%Entonces el PID queda definido como:
pid=tf([Kc*Ti*Td Kc*Ti Kc],[Ti 0])
%probemos como servo, FT en Lazo cerrado:
g1 = series(pid,planta) %reduzcamos los bloques en serie del controlador y planta
servo1 = feedback(g1,1) %reduzcamos el lazo de control con retro unitaria
%probemos como regulador, FT en Lazo cerrado:
regu1 = feedback(planta,pid) %reduciendo el lazo de control con el pid como retro
%Ahora calculemos por el m�todo de la ganancia l�mite:
[Gm,Pm,Wcg,Wcp] = margin(planta)%Busquemos valores que lleven al sistema a la estabilidad marginal
Ku = Gm %Valor de la ganancia que hace el sistema marginalmente estable
Tu = 2*pi/Wcg %modelo definido por el m�todo para obtener el periodo l�mite(de oscilaci�n)
%Usando PID(2) de la tabla del m�todo: (un solo sobrepaso)
Kc1 = 0.33*Ku 
Ti1 = 0.5*Tu
Td1 = 0.333*Tu
pid1=tf([Kc1*Ti1*Td1 Kc1*Ti1 Kc1],[Ti1 0])%ecuaci�n del controlador
g2 = series(pid1,planta) %sumando bloques en serie (pid2 y planta)
%Probemos como servo, FT de lazo cerrado
servo2 = feedback(g2,1)%reduciendo lazo de control con retro unitaria
regu2 = feedback(g2,pid1)%reduciendo lazo de control con retro pid2
%Grafiquemos la respuesta al escal�n unitario para analizar las respuestas
step(servo1,servo2)
figure %demos una pausa
step(regu1,regu2)%probemos con regulador
%Valoremos los indicadores del desempe�o para evaluar si hicimos un dise�o
%�ptimo:
stepinfo(servo1)
stepinfo(servo2)
