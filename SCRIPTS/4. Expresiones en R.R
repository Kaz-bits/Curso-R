
#-----EXPRESIONES EN R-----

#Veamos ahora un poco sobre las expresiones que se puedne realizar dentro del ambiente de R,
#tales como sumas, restas, multiplicaciones, logaritmos, exponenciales. Este tipo de 
#operaciones son llamadas (como en álebra) aritméticas. 

#En las siguientes líneas verás operadores aritméticos: 

a1 <- 5
a2 <- 13.23
a3 <- 35

#SUMAS
a4 <- a1 + a2 + a3
a4

#RESTAS
a5 <- a1 - a2 - a3
a5

#MULTIPLICACIONES
a6 <- a1*a3
a6

#DIVISIONES
a7 <- a3/a2
a7

#POTENCIAS
a8 <- a2^a1
a8

#COMBINACIONES
a9 <- ((a1/a3) + ((a2/a3)*(a1 + (a1/a2))) - 7/3 + ((1 + a3)/2))^2
a9

#Esto es solo un ejemplo, podrías llega a utilizar, pero es algo sencillo, solamente ten
#cuidado con los paréntesis, es un error común ignorarlos y a veces eso nos arroja un error


#-----OPERADORES LÓGICOS Y RELACIONALES-----

#Este tipo de operadores son usados frecuentemente cuando queremos generar un código que 
#ejecute o haga ciertas operaciones de forma selectiva, son muy usados en las condicionales
#y en los loops (veremos más adelnate), pero es importante que conozcamos de ellos y sepamos
#usarlos. 

b1 <- c(1:10)
b2 <- c(5, 6, 7, 10, 11, 12, 13, 16, 20, 20, 20, 20)
b3 <- c(35:45)
b4 <- c(45, 7, 1, 16, 40, 20)

#Operador "<"

subset(b1, b1 < 5)
subset(b4, b4 < 20)
subset(b3, b3 < 35)

#Operador ">"

subset(b1, b1 > 5)
subset(b4, b4 > 20)
subset(b3, b3 > 35)

#Operador ">="

subset(b1, b1 >= 5)
subset(b4, b4 >= 20)
subset(b3, b3 >= 35)

#Operador "<="

subset(b1, b1 <= 5)
subset(b4, b4 <= 20)
subset(b3, b3 <= 35)

#Operador "|"

subset(b3, b3 > 40 | b3 == 36 | b3 < 36)

#Operador "!="

subset(b2, b2 != 20)

#Operador "&"

subset(b2, b2 != 20 & b2 < 10)


#Estos operadores no serán de gran utilidad para las condicionales, te mostraré unos ejemplos
#un poco más prácticos. En otro script tendremos las condicionales detalladamente.


#Veamos unos ejemplos, pero no entraremos aún en detalle con las condicionales. 

#Ejemplo 1

if (4 > 3) {
  4 + 3
}

#Ejemplo 2

if (4 < 3) {
  4 + 3
}

#Ejemplo 3

if (4 < 3) {
  4 + 3
} else { 
  4 - 3
}

#Ejemplo 4

d1 <- 1:40

ifelse(d1 %% 2, "Par", "Non")

#Un caso un poco más elaborado es el siguiente, pero las expresiones condicionales
#usando operadores lógicos o relacionales, se pueden volver a veces muy tediosas o difíciles
#de interpretar, pero son de bastante utilidad.

if (subset(b2, b2 == 12)) {
  print(mean((subset(b2, b2 != 12))))
}

#En la condición anterior yo especifiqué: extraer del vector b2 que, si existe
#un valor igual a 12, que ejecute el siguiente comando que es la media pero sin el valor
#12.



#-----EXPRESIONES ESTADÍSTICAS EN R-----

#obtener la media, mediana, moda, escribir funciones que hagan una operación específica, 
#etc. 

edades <- c(22, 23, 24, 22, 22, 23, 23, 25, 22, 21, 23, 22)

mean(edades)
median(edades)
var(edades)
sd(edades)
range(edades)
min(edades)
max(edades)

#Lo anterior son algunas de las funciones de R base para obtener informción estadística
#de igual forma, si deseas obtener toda la información condensada, puedes usar la 
#"summary" para que el ouput sean todas las anteriores:

summary(edades)

#Si quieres mantener dicha información, puedes guardarla en un objeto que no es un vector
#si no una tabla de información, y R lo interpreta como un objeto del tipo "summary".

summary_edades <<- summary(edades)
class(summary_edades)

#Vamos a poner en contexto el uso y conocimiento de estas primeras funciones que R base
#maneja. Hagamos una prqueña demostración de otra función estadística que R maneja,
#la prueba t-student. 

x1 <- rnorm(50, 5.1)
x2 <- rnorm(50, 5.6)

test <- t.test(x1, x2)
test



help(rnorm)