
#-----CONDICIONALES----

#Lad condicionales son expresiones que llevan a cabo diferentes acciones dependiendo
#si una condición definida del tipo boleana se cumple, esto es verdadero o falso. Hay
#que verlo como un tipo de "toma de decisiones", y es algo muy importante y usado en
#programación. Se tienen diferentes tipos de sintaxis para las condicionales, 
#empecemos con las más sencilas. SON ESTRUCTURAS DE CONTROL. 

#----if----

#La primera es el "if", que practicamente es darle una expresión o condición, este la
#evalúua y si se cumple, entonces haz cierta acción. Su sintaxsis es la siguiente:

if (condition) {
  do something
}

#Veamos unos ejemplos:

x <- 35

if (x > 30) {
  print("La variable 'x' es mayor a 30")  
}

if (x > 30 & x < 36) {
  print("Se cumple la condición")
}

a <- c(1:10)
b <- c(1:9)


if (is.vector(a, mode = "numeric")) {
  print(a + 1)
}

if (length(b) < 10) {
  print("La longitud del vector es menor a 10")
}


#-----if and else-----

#La sintaxis es la siguiente: 

if (condition) {
  do something
} else {
  do other thing
}

#Supongamos que ahora queremos que si una condición no se cumple, entonces que se 
#ejecute otro comando, para ello se emplea el "if, else"


if (x > 30 & x < 35) {
  print("Se cumple la condición")
} else {
  print("No se cumple la condición")
}


#Hagamos esto más ilustrativo con estadística:


if (class(shapiro.test(PlantGrowth$weight[1:10])[[2]]) < 0.05) {
  print("No se sigue una distribución normal")
} else {
  print("Se sigue una distribución normal")
}


#Podemos tener varios casos, recuerda el uso de las expresiones relacionales, el uso
#de "&" y "|" cambia el resultado obtenido. 

plant <- c(shapiro.test(PlantGrowth$weight[1:10])[[2]], 
           shapiro.test(PlantGrowth$weight[11:20])[[2]]/10,
           shapiro.test(PlantGrowth$weight[21:30])[[2]]) 

plant

#Usando la expresión relacional "&"

if (plant[1] > 0.05 & plant[2] > 0.05 & plant[3] > 0.05) {
  print("Los datos siguen una distribución normal")
} else {
  print("Algunos de los datos no siguen una distribución normal")
}


#Usando la expresión relacional "|"


if (plant[1] > 0.05 | plant[2] > 0.05 | plant[3] > 0.05) {
  print("Los datos siguen una distribución normal")
} else {
  print("Algunos de los datos no siguen una distribución normal")
}


#En el primer caso, se imprime que los datos no siguen una distribución normal, 
#pero en le segundo caso, me indica que sí, y eso que se tienen los mismos datos
#del vector creado. En el primer caso, estoy indicando que se deben cumplir
#TODAS las condiciones, y en el segundo caso solamente con que se cumpla UNA 
#condición, se ejecutará la primera expresión. 


#----if, else-if, else----

#Este es otra forma de estructrurar el flujo de control de los datos, la sintaxis
#de esta expresión es la siguiente: 

if (condition_1) {
  expression_1
} else if (condition_2) {
  expression_2
} else if (conditio_3) {
  expression_3 
} else {
  expression_4  
}

#Ejemplo de su uso:

y <- 0

if (y < 0) {
  print("Numero negativo")
} else if (y > 0) {
  print("Numero positivo")
} else {
  print("Cero")
}


#----ifelse----

#Esta es una función del tipo condicional un poco más específica, porque esta nos
#permite operar sobre vectores, es decir, itera sobre cada elemento de un vector,
#y puede resultar bastante eficiente, solamente que el resultado son puros valores
#lógicos.

a <- c(1:10)
ifelse(a, a > 5)
ifelse(a, yes = (a < 5 | a > 8))

