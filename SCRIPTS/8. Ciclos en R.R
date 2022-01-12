
#-----LOOPS----

#Los loops son expresiones repetidas, es decir, una misma operación o función se
#está aplicando de forma ciclica sobre los elementos de algún vector o alguna
#expresión. 


#----loop "for"----

#La primer construcción para hacer loops que veremos es el ciclo "for", el cual realiza
#una expresión o ejecuta un comando hasta que el valor de la variable que se asigna
#ya no contiene elementos. La sintaxis es la siguiente:

for (variable in sequence) {
  do something 
}

#veamos cómo funciona. Personalmente, es una de las que más utilizo para realizar
#operaciones:

fruits <- c("orange", "watermelon", "apricot", "cherry", 
            "lemon", "grape", "kiwi", "apple", "peach")

 
for (i in fruits) {
  print(i)
}


#Lo anterior lo que hace es "iterar", esto significa que, la función print() toma el
#primer elemento del vector y lo imprime, luego toma el segundo elemento y lo imprime,
#luego el tercero, cuarto, etc., hasta el último elemento; una vez que ya no hay
#elementos con los cuales pueda seguir ejecutándose la función "for", el ciclo termina.

#¿Recuerdas el problema de las columnas en la parte de estadística con el gen CADP y
#el gen HACP? Te muestro una forma de resolver ese problema con ciclos for:


#Aquí podemos ir resolviendo problemas sobre la manipulación de datos, por ejemplo, yo no
#tengo un gen CADP1, CADP2, etc, tengo un único gen, pero mi dataframe aparecen 30 factores,
#¿cómo puedo cambiar a solo dos factores?

genes[[1]][1:15]


CADP <- c()

for (i in genes[[1]][1:15]) {
  for (g in substr(i, start = 1, stop = 4)) {
    CADP <- append(CADP, g) 
  }
}

CADP


HACP <- c()

for (i in genes[[1]][16:30]) {
  for (g in substr(i, start = 1, stop = 4)) {
    HACP <- append(HACP, g) 
  }
}

HACP

gene_name <- c(CADP, HACP)
gene_name

genes <- data.frame("gene_name" = c(CADP, HACP), "after" = c(after_CADP, after_HACP), 
                    "before" = c(before_CADP, before_HACP), row.names = c(1:30))

genes

#Lo anterior es una forma de resolver el problema, algo tedioso si te das cuenta, pero 
#cada quien tendrá una forma de resolver los problemas en R, lo irás comprobando, y todo
#es válido mientras le output sea el esperado. 




#----while----

#Este ciclo es algo especial, pues dicha construcción es parecida al ciclo "for", sin
#embargo, esta se ejecuta siempre y cuando se cumpla cierta condición, veamos:


Carreras <- c("QFB", "QA", "IQM", "Q", "QIM", "Biologia", "Medicina")

i <- 1
while (i <= 7) {
  print(Carreras[i])
  i <- i + 1
}


#MUCHO CUIDADO CON EL USO DE ESTE CICLO, PORQUE SE DEBE EXPECIFICAR UNA CONDICIÓN
#PERO, TAMBIÉN INDICARLE EN QUÉ MOMENTO DEBE DETENERSE, PORQUE SI NO LO HACES
#SE CREARÁ UN LOOP INFINITO, Y ESO TERMINARÁ CONSUMIENDO TODA TU MEMORIA RAM. 
#PERSONALMENTE, NO UTILIZO ESTE CICLO POR DICHA RAZÓN, SI NO SABES CÓMO USARLOS, 
#NO LO HAGAS HASTA APRENDER.


