#Obtención de datos----

#Cargar el dataset llamado "iris" escribiendo en la
#consola el nombre

iris 

#Podemos ver las características del dataset con la función
#str() como sigue

str(iris) #150 observaciones y 5 variables (columnas)

#Podemos ver los primeros 6 renglones de un dataset 
#con la función head()

head(iris) #Primeros seis renglones
head(iris, n = 8) #Primeros ocho renglones
head(iris, n = 10) #Primeros 10 renglones

#Podemos visualizar los últimos renglones de un dataset
#con la función tail()

tail(iris) #Últimos seis renglones
tail(iris, n = 8) #Últimos ocho renglones
tail(iris, n = 10) #Últimos 10 renglones

#Podemos obtener datos estadísticos descriptivos para
#darnos una idea de nuestros datos con la función
#summary()

summary(iris)

#Podemos obtener los nombres de las variables (columnas)
#de nuestro dataset con la función names()

names(iris) #Cinco variables

#Podemos obtener el número de renglones y columnas del
#dataset con la función dim()

dim(iris) #Primero renglones (150) y segundo columnas (5)

#Podemos visualizar la clase a la que pertenece el dataset
#cargado con la función class()

class(iris) #Data frame


#Factores en R----

#Los factores son variables que toman un número limitado
#de valores. En el dataset de iris se pueden observar 
#usando la función levels() en la columna de "Species"

levels(iris$Species) #150 observaciones y tres niveles

#Podemos contar los niveles que hay con la función 
#nlevels()

nlevels(iris$Species) #Tres niveles

#Podemos crear variables y que R las maneje como un factor
#con la función factor()

letras <- rep(c("A","D","E","H"),6) #24 observaciones
letras

#Convertimos la variable con las letras en un factor
#como sigue

factor(letras)

#Se recomienda realizar dicha conversión al momento de 
#nombrar a la variable

letras <- factor(rep(c("A","D","E","H"),6))
letras

#Podemos también elegir el nombre de los niveles de un
#factor con el argumento labels()

letras <- factor(rep(c("A","D","E","H"),6), 
                 labels = c("a","d","e","h"))
letras

#Lo anterior, modifica tambien al vector original. De igual
#forma, podemos elegir el orden de los niveles

letras <- factor(rep(c("A","D","E","H"),6), 
                 levels = c("H","E","D","A"))
letras

#El argumento levels(c()) cambiar el orden de los niveles
#dentro de un factor. Sin embargo, es posible especificar
#que un nivel aparezca primero. Usaremos la variable 
#anterior

letras <- relevel(letras, "E") #Primero la letra E
letras
letras <- relevel(letras, "D") #Primero la letra D
letras
letras <- relevel(letras, "A") #Primero la letra A
letras

#Este tipo de orden se usa mucho en análisis estadístico
#y en la creaciÃ³n de grÃ¡ficos (que emplean la estadística)
#como los boxplots, barplot, density plot, violinplot, etc.

boxplot(iris$Sepal.Length~iris$Species, 
        ylab = "Longitud del sépalo (cm)",
        xlab = "Especies")

#Filtrado de datos por columnas (iris)----

#Comenzaremos trabajando con el dataset iris pero
#guardado en una variable

df_iris <- iris

#Extraer columnas por separado o en conjunto, colocando
#el espacio antes de la coma en blanco para indicar que
#queremos todos los renglones

df_iris[,c(1,3)] #Primera y tercera columna
df_iris[,c(2,5)] #Segunda y quinta columna
df_iris[,-c(1,3)] #Columnas 2,4 y 5 excepto la 1 y 3
df_iris[,-c(2,4,5)] #Columnas 1 y 3 exceto la 2,4 y 5

#Podemos extraer la columnas de acuerdo al nombre que 
#tenga la variable o columna

df_iris[,"Sepal.Width"] #Se obtiene un vector
df_iris[,c("Sepal.Width","Petal.Width")] #Dataframe

#Sin embargo, existen otras formas de extraer los datos
#recordar que hay muchas formas de resolver un problema. En
#este caso, usaremos el signo $

df_iris$Sepal.Length #Vector
df_iris$Sepal.Width #Vector
df_iris$Petal.Length #Vector
df_iris$Petal.Width #Vector
df_iris$Species #Vector

#El signo $ se puede usar para extraer una sola columna
#en forma de vector. Otro caso es la función subset con
#el argumento select

subset(df_iris, select = c("Petal.Width","Sepal.Length",
                           "Species"))


#Filtrado de datos por renglones (iris)----

#En este punto es donde haremos uso de los operadores
#lógicos, relacionales y aritméticos en conjunto, para 
#obtener información específica.

#Podemos extraer los primeros 20 renglones, 30 o 50
#usando los dos puntos

df_iris[1:20,] #Primero 20 renglones
df_iris[1:30,] #Primero 30 renglones
df_iris[1:50,] #Primero 50 renglones

#Lo anterior extrae los 50 valores de la especies setosa, 
#pero podemos usar otra sintaxis

df_iris[df_iris$Species == "setosa",]
df_iris[df_iris$Species == "versicolor",]
df_iris[df_iris$Species == "virginica",]

#Recordar que los operadores lógicos y relacionales
#siempre generan un vector de tipo lógico; lo que se
#está colocando en los corchetes es un vector lógico

df_iris[df_iris$Sepal.Length > 7.5,]

#Podemos combinar diferentes operadores relacionales
#y lógicos para extraer datos de forma más específica

df_iris[df_iris$Sepal.Length > 5 & 
          df_iris$Petal.Length >= 4.5 &
          df_iris$Species == "versicolor",]

#Otro ejemplo es usando el operador "OR" como sigue

df_iris[df_iris$Sepal.Length > 7.5 | 
          df_iris$Sepal.Length < 4.5,]

#Otro ejemplo es combinando el operador "AND" y el "OR"
#en una misma condición

df_iris[df_iris$Sepal.Length > 7.5 & 
          df_iris$Petal.Width == 2.3 | 
          df_iris$Sepal.Length < 4.5 & 
          df_iris$Petal.Width == 0.2,]

#En el código anterior, dos condiciones se están juntando
#con el operador "OR", las cuales están unidas por el 
#operador "AND", y eso genera el output correspondiente


#FIN----