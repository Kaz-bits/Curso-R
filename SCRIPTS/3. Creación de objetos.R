
#Vamos a comenzar utilizando algunos de los objetos que R maneja, y los cuales son de 
#gran importancia conocer para poder avanzar.


#Creando vectores----

#Hemos escuchado la palabra "vector" antes, en cursos de física, Álgebra, etc., pues en R, un vector es
#un componente central, el cual puede contener gran variedad de datos, ya sea, numeros, cadenas, valores
#logicos, etc. Para crear un vector se emplea la funciÃ³n "c()"

c(1,2,3,5,6,8,9,0,2)
c(2*4, 4*7, 2*8, 10*11)
c("CÃ©sar", "22", "QFB", "Verde")
c(T, F, T, F, F)

#Puedes combinar vectores, sin importar la longitud de uno o del otro 

v1 <- c(1:5)
v2 <- c(6:10)
v3 <- c(v1, v2)


v4 <- c(1:6)
v5 <- c(7:20)
v6 <- c(v4, v5)



#Lo anterior es una forma de crear variables en R, de igual forma se puede usar el signo "=" pero 
#para casos prÃ¡cticos no lo recomiendo, pues algunas veces puede confundirse con otras funciones que
#emplean el mismo signo. 

#Existen muchas formas de poder crear un vector, algunas de ellas son las siguientes:

assign("carrera", c("QFB", "QA", "Q", "IQ", "QIM", "IQM"))
print(carrera)

numeros <- seq(from = 3, to = 30, by = 3)
print(numeros)


#De igual forma, puede ser util saber el tipo de elemento que nuestro vector guarde, por ejemplo, si son
#datos numericos, logicos, etc. 

v6 <- c(v4, v5)
class(v6) #"Integer"

p <- c("CÃ©sar", "22", "QFB", "Verde")
class(p)  #"chacracter"

l <- c(T, F, T, F, F)
class(l) #"logical"

pi <- c(pi + 1, pi + 2)
class(pi) #"numeric"

class(class)

#Al manipular objetos, de igual forma nos serÃ¡ util saber como extraer un valor especifico de una posicion
#para ello, se usan los corchetes


v6[18]
v6[9:15]
v6[21]
v6[c(9, 14, 16, 18)]
v6[-1]
v6[-(9:15)]

v6 < 15

v6[v6 < 15]
v6[v6 < 5]
v6[v6 <= 5]

v6 %% 2 == 0

v1 + v2
v4 + v5 
v1 + v6

#Otro caso particular para los vectores, es que podemos asociarle valores
#es decir, que tengan un encabezado con el nombre de cada elemento

frutas <- c(naranja = 15, pera = 100, manzana = 2, durazno = 30)
frutas

#Cuando se imprime el vector "frutas", vemos en la consola que cada nombre
#tiene asociado un valor numerico

frutas[1]

#Si buscamos extraer algun elemento del vector, se extraerÃ¡ el nombre y 
#el valor numerico asociado.


#Otra funcionalidad de R es que podemos realizar operaciones, para nuestros
#propÃ³sitos no las usaremos tan frecuentemente, pero te las muestro
#para que sepas lo que es posible realizar


v1 + v2
v2 - v1
v1 * v2
v1 / v2
v1 + 2*(v2)
log(v2)
sqrt(v1) + sqrt(v2)

as.numeric(format(log(((3*v1) + (2*v2))/(4)), digits = 2))
class(as.numeric(format(log(((3*v1) + (2*v2))/(4)), digits = 2)))

sin(v1) 
cos(v1)


#una operacion sencila como una suma, una resta, multiplicaciÃ³n, divisiÃ³n,
#exponencial, etc. La funciÃ³n sqrt() es la raÃ­z cuadrada. Otro tipo de operaciones
#que se pueden hacer son las trigonomÃ©tricas. Esto lo digo porque incluso
#puedes generar ecuaciones o funciones que realicen ciertas opreaciones de
#interÃ©s. 


#Una herramienta que nos puede bastante Ãºtil para realizar ya sea modelos
#estadÃ­sticos o para poder generar ciertos grÃ¡ficos, es la obtenciÃ³n de 
#factores, es decir, la frecuencia de apariciÃ³n de ciertos caracteres. El 
#siguiente vector "carrera" 

carrera_FQ <- c("QFB", "QA", "Q", "QIM", "IQ", "IQM", "QFB", "QA", "QA")
carrera_FQ <- as.factor(carrera_FQ)
carrera_FQ

#Lo anterior lo que genera es el mismo vector, con la misma longitud, pero,
#se ha adicionado una estructura denominada "levels"

unclass(carrera_FQ)
table(carrera_FQ) 

carrera_FQ[1]
levels(carrera_FQ)[4] <- "Q"
as.integer(carrera_FQ)

#------CREACION DE DATAFRAMES------

#Los dataframes son estrcutruas en dos dimensione (rectangulares), en los cuales puede haber datos de 
#cualquier tipo, sin importar la clase. Normalmente, es la estructura de datos mas usadas. En un dataframe
#tendremos columnas y tendremos renglones, las columnas serÃ¡n las variables, y los renglones las observaciones


#Te voy a mostrar un dataframe, nosotros podemos crearlos, pero el siguiente comando ejecuta un dataframe
#ya hecho y cargado en Rstudio

iris

#Los dataframes estÃ¡n compuestos por vectores, entonces, ya te imaginaras, que si tenemos varios
#vectores, podemos crear un dataframe:


nombre <- c("Cesar", "Mariana", "Alex", "Diana")
edad <- c(22, 21, 21, 23)
carrera <- c("QFB", "QA", "Q", "QFB")
deporte <- c(F, T, T, T)

df2 <- data.frame(nombre, edad, carrera, deporte)
df2
class(df2)

#Esa es una forma muy eficiente en la que podemos ir guardando nuestras observaciones, pero ahora imagina
#tener miles de datos. 

#De igual forma podemos extraer valores de los dataframes

df2[1] #Extraer la primer columna
df2[2]
df2[1, 2] #RenglÃ³n, columna

df2[c(1,3), 3]
df2


#A los dataframes igual podemos agregarles columnas o renglones. Supongamos que queremos
#aÃ±adir una columna que contenga el Ã¡rea de interes de cada persona.

df2$intereses <- c("GenÃ³mica", "MicrobiologÃ­a", "CuÃ¡ntica", "Calidad")
df2

df2$mÃºsica <- cbind(c("rock", "ska", "pop", "metal"))
df2

df2 <- rbind(df2, c("Perla", 22, "IQ", FALSE, "Balances", "rock"))
df2


#Estos comandos nos podrÃ¡n ser de ayuda mÃ¡s adelante, cuando comencemos a realizar
#tratamineto de los datos, principalmente las primeras dos, donde debemos ir aÃ±adiendo 
#columnas dependiendo de los anÃ¡lisis que hagamos. 



#------Â¿CÃMO CARGAR UNA BASE DE DATOS A RSTUDIO?------

#Pueden cargar datos de archivos de Excel, como .csv, .xlsx, .tab, .txt, .fasta, etc. 
#usaremos un archivo denominado .tab que se trata de datos separados por tabulaciones


read.csv()
read.csv2()

#Si quiere conocer el directorio donde se esten guardando tus scripts
#graficos, etc., emplea la funciÃ³n "getwd()" para poder determinarlo

getwd()

#En nuestro caso, podemos cargar un archivo directamente sin complicaciones
#desde el menÃº, pero quiero que aprendas el cÃ³mo se hace y el por quÃ©
#se hace o se lee un archivo como lo hace el interprete de R.


ara_prot <- read.delim("C:/Users/Windows/Desktop/Proteome analysis/Ejercicio proteoma.txt",
                       header = TRUE,
                       row.names = FALSE,
                       sep = "\t")

ara_prot <- read.delim(file.choose(), 
                       header = TRUE,
                       row.names = FALSE,
                       sep = "\t")

#Lo anterior son dos formas en las que podemos cargar un archivo en R,
#si estÃ¡s iniciando o simplemente se te hace mÃ¡s fÃ¡cil, utiliza la
#segunda opciÃ³n, la primera es cuando tÃº debe especificar el directorio
#del archivo, solamente en el caso de que no lo tengas en el directorio
#de trabajo de R dado por la funciÃ³n getwd(). 


#Lo que se acaba de cargar debe aparecer en el panel de trabajo, donde se
#guardan todas la variables. El nombre que le dimos es "ara_prot", y tiene 
#39349 renglones, Â¡bastante grande!, tan solo mira el tamaÃ±o del dataframe.

#Para observar las primera seis columnas de un dataframe se emplea la funciÃ³n head(), como
#sigue: 

head(ara_prot)
head(ara_prot$Entry, n = 10)

#De igual forma, puedes extraer ciertos elementos del dataframe creado, empleando los
#corchetes sencillos. 

ara_prot[1, 5]

ara_prot$Sequence[1] #CUIDADO AQUÃ, CUANDO TENEMOS MUCHOS DATOS, SI NO FILTRAMOS BIEN
                     #PODEMOS PROVOCAR UN ERROR EN R, POR ESO YO ESPECIFIQUÃ EL UNO, 
                     #PARA DECIRLE QUE QUIERO EL PRIMER ELEMENTO, NO LOS 39343



#Empecemos a manipular un poco la informaciÃ³n que contienen los dataframes. Para ello,
#vamos a cargar datos que se encuentran de forma predeterminada en Rstudio, una base de
#llamada "iris"

head(iris)
View(iris)
help(iris)

#Hay dos bases datasets, uno llamado iris y otro iris3, ambos son de una clase distinta:

class(iris)
class(iris3)

#Antes de empezar, podemos visualizar la estructura de nuestros datos, en este caso,
#usando la funciÃ³n "str()", que nos da informaciÃ³n de la clase dle objeto, la clase
#de los datos de las columnas, el numero de observaciones, variables, etc. 

str(iris)

#Vamos a empezar instalando una paqueterÃ­a, llamada "tidyverse", esta paqueterÃ­a

library(tidyverse)
library(dplyr)

#Como primer paso para que veamos la funcionalidad de esta funciÃ³n "dplyr" vamos a extraer
#de iris todas las columnas y renglones correspondientes a la especie virginica:

filter(.data = iris, Species == "virginica")
filter(.data = iris, Species == "setosa")
filter(.data = iris, Species == "versicolor")

#Podemos obtener el mismo output de diferentes maneras, a continuaciÃ³n te muestro algunas
#de ellas. El simbolo "%>%" en el tercer comando, se le conoce a menudo como "pipe", y es 
#una notaciÃ³n muy comÃºn en otros lenguajes de programaciÃ³n, por ejemplo, "bash" que es el 
#lenguaje que utiliza linux. 

filter(.data = iris, Species == "virginica")
filter(iris, iris$Species == "virginica")
iris %>% filter(iris$Species == "virginica")

#Queremos ahora del nuevo dataframe, extraer los datos de la columna petal.length 
#que sean iguales o mayore a 3.5, para hacerlo, utilizamos lo siguiente: 

min(iris$Petal.Length)
max(iris$Petal.Length)

min(iris$Sepal.Length)
max(iris$Sepal.Length)

filter(iris, iris$Species == "virginica", iris$Petal.Length > 5.5)
filter(iris, iris$Species == "virginica", iris$Petal.Length != c(5.5:6.3))

df_iris <- filter(iris, iris$Species == "virginica", iris$Petal.Length > 5.5)
df_iris
class(df_iris)

#Te voy a presentar una paqueterÃ­a muy buena llamada ggplot2, la cual sirve para
#realizar grÃ¡ficos de calidad e inclusive ajustar datos a modelos esatdÃ­sticos. veamos 
#cÃ³mo se verÃ­a la grÃ¡fica de nuestro data frame.

library(ggplot2)

#Primero, si no tienes cargada la paqueterÃ­a o instalada, es lo primero que debes hacer, 
#para poder utilizarla. 

ggplot(df_iris)

#Si ejecutamos el comando anterior, la visualizaciÃ³n del panel 4 cambia, se observa un 
#cuadro gris. Esto lo que hace es construir un lienzo sobre el cual se graficarÃ¡n nuestros 
#datos

names(df_iris)
ggplot(df_iris, aes(x = Petal.Length, y = Petal.Width))

#Lo anterior genera los ejes de grafiaciÃ³n "x" y "y", y los ajusta segÃºn los datos
#que tengamos. Ahora agreguemos los datos al lienzo:

ggplot(df_iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point()

#Si te das cuenta, ahora tenemos todos nuestros datos sobre el lienzo, mostrados como
#puntos. A partir de aquÃ­, una vez que tienes las primeras tres capas, tÃº puedes 
#hacer modificaciones a tu grÃ¡fico. Para poder hacer mÃ¡s claro los siguientes comandos,
#usaremos toda la base de datos de "iris".


ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) +
  geom_point(size = 2.5) + 
  theme_bw() + 
  labs(x = "Longitud del pÃ©talo (cm)", 
       y = "Ancho del pÃ©talo (cm)") + 
  ggtitle("ComparaciÃ³n de especies de la flor iris") + 
  theme(plot.title = element_text(size = 12, hjust = 0.5, face = "bold"),
        axis.title = element_text(size = 14),
        panel.grid = element_blank(),
        legend.text = element_text(size = 12),
        legend.title = element_text(size = 13, hjust = 0.5),
        legend.background = element_rect(colour = "black", 
                                         linetype = 5)) +
  scale_color_discrete(name = "Especies de\nflor iris", 
                       labels = c("Setosa", "Versicolor", "Virginica")) +
  scale_x_continuous(breaks = seq(0, 8, by = 1)) + 
  scale_y_continuous(breaks = seq(0, 3, by = 0.5)) +
  geom_vline(xintercept = 3.45, linetype = 5, size = 0.65) + 
  geom_hline(yintercept = 1.25, linetype = 5, size = 0.65)


#El cÃ³digo de arriba genera un grÃ¡fico que puede ser modificado dependiendo de las 
#necesidades del experimento o de quien lo estÃ© realizand. Te recomiendo revisar 
#diferentes libros y foros para que conozcas todas las modificaciones que podmemos realizar.
#Con esto, te doy ejemplos de la importancia de manipular los datos que tienes 
#en una base de datos, como extraer ciertos valores y graficar algunos. TE VOY A DEJAR
#CÃDIGOS ESPECÃ­FICOS PARA DIFERENTES TIPOS DE GRÃFICOS QUE PUEDAN SER DE UTILIDAD 
#EN TUS PROYECTOS. 



#------CREACIÃN DE LISTAS-------


#Una lista es otra estructura de datos que puede contener desde cero o mÃ¡s elementos, y 
#pueden ser de diferentes clases, es decir, puedes tener listas conteniendo datos de tipo
#numÃ©rico, lÃ³gico, caracteres, etc., la ventaja de este tipo de estructuras es que 
#no importa de que longitud sea cada objeto de la lista, eso nos facilita mucho el trabajar
#con los datos. 

lista <- list(Carrera = c("QFB", "QA", "IQ", "Q"), Regulares = FALSE, 
              sueldo = c(18300, 19500, 15600, 17700))

lista

#Cuando ejecutas la variable creada, observa que la estructura es distinta, y la longitud
#en cada elemento de la lista es diferente, eso no se hubbiera podido en un datafre, 
#recuerda que en un dataframe deben tener la misma longitud los elementos. 

#Â¿CuÃ¡ndo se una una lista? Los datafraes, son los mÃ¡s empleados, pero una lista, solo
#en ciertas ocasiones, cuando queremos guardar datos de diferente clase, por ejemplo,
#hay una paqueterÃ­a para bioinformÃ¡tica llamada "seqinr", con la cual podemos cargar
#archivos "fasta", y estos se guardan como listas, veamos:

library(seqinr)

fasta_sc <- read.fasta(file = "protein.faa.txt", seqtype = "AA", as.string = FALSE, 
                       set.attributes = FALSE)


#Podemos usar la funciÃ³n head() para analizar los primeros cinco valores de la lista
# y la funciÃ³n class() para determinar quÃ© tipo de estructura de datos tenemos. 

head(fasta_sc, n = 5)
class(fasta_sc)

#Este formato de lista nos facilita mucho el trabajo, es por ello que la paqueterÃ­a
#seqinr estÃ¡ creada con la finalidad de que cualquier formato .fasta lo reconozca
#como una lista, donde los objetos dentro de la misma sean caracteres individuales
#de los aminoÃ¡cidos o de nucelÃ©tidos, dependiendo el caso. 



#-----CREACIÃN DE MATRICEZ Y ARREGLOS------

#Este tipo de estructura de datos son usados cuanod se tiene informaciÃ³n especÃ­fica. Por
#ejemplo, una matriz, como bien recordaremos de clases de Ã¡lgebra, es un arreglo que tiene
#dos dimensiones, algo parecido a un dataframe, teniendo columnas y renglones, pero, Â¿quÃ©
#lo hace diferente del dataframe?. Bueno, los datos que deben contener las matrices son
#de la misma clase, veamos: 


m1 <- matrix(24:50)
m1

m1 <- matrix(24:50, nrow = 3, ncol = 9)
m1

m1 <- matrix(24:50, nrow = 3, ncol = 9, byrow = TRUE)
m1

#Los comando sde arriba sirven para generar matrices, se usa en este caso la funciÃ³n 
#matrix(), y se especifican los datos, los renglones y las columnas, los demas atributos
#dependerÃ¡n de quÃ© es lo que queremos hacer con esos datos. 

nombre <- c("Cesar", "Mariana", "Alex", "Diana")
m2 <- matrix(nombre)
m2

m2 <- matrix(c(nombre, carrera))
m2

m2 <- matrix(c(nombre, carrera), nrow = 2, ncol = 4, byrow = T, 
             dimnames = list(c("Nombre", "Carrera"), c("P1", "P2", "P3", "P4")))
m2

#Observa que agreguÃ© a la matrix dos vectores del tipo "character", si yo quisiera 
#aÃ±adir un vector de la misma longitud pero del tipo numÃ©rico, ocurre lo siguiente: 

nombre <- c("Cesar", "Mariana", "Alex", "Diana")
carrera <- c("QFB", "QA", "Q", "QFB")
edad <- c(22, 21, 21, 23)

m3 <- matrix(c(nombre, carrera, edad), nrow = 3, ncol = 4, byrow = T, 
             dimnames = list(c("Nombre", "Carrera", "Edades"), 
                             c("P1", "P2", "P3", "P4")))

m3


#El cÃ³digo se ejecutÃ³ sin problema, pero, Â¿quÃ© le pasÃ³ a nuestros datos numericos? 

m3[3,]

#Observa que los datos de edad se cambiaron a un objeto de tipo "character", por lo que
#si queremos obtener la media de ese renglÃ³n no podrÃ­amos hacerlo sinplemente con una 
#funciÃ³n, tendrÃ­amos que cambiar esos datos a valores numÃ©ricos.

mean(m3[3,])
mean(as.numeric(m3[3,]))

#PARA EXTRAER DATOS DE UNA MATRIZ, SE USAN IGUAL LOS CORCHETES Y SE APLICA LA MISMA
#LÃGICA COMO EN LOS DATAFRAMES



#------CREACIÃN DE ARREGLOS------


#Un arreglo es similar a una matriz, pero este contiene mÃ¡s de dos dimensione, se crean 
#con la funciÃ³n arraY().



arreglo_1 <- array(data = 1:24, dim = c(2, 4, 3), 
                   dimnames = list(c("A1", "A2"),
                                   c("P1", "P2", "P3", "P4"),
                                   c("M1", "M2", "M3")))
arreglo_1


#Lo anterior es una forma de crear una arreglo, observa que en este caso, yo tengo que 
#especificar tres dimensiones dadas por la funciÃ³n "dim =". El primer valor de ellso (2)
#corresponde a los renglones, el segundo (4) a las columnas y el tecero (3) a las matrices
#del arreglo. Para poder extraer datos de un arreglo, se usa la lÃ³gica de tres dimensiones
#[renglÃ³n, columna, matriz]

arreglo_1[2, 4, 2]
arreglo_1[1, 1, 1]




#Con este script puedes darte cuenta que R maneja diferentes estructuras de datos y cada
#una de ellas, tienes sus caracterÃ­sticas, y son dependiendo de los datos que tengas
#y el cÃ³mo los vas a tratar en un futuro. 
