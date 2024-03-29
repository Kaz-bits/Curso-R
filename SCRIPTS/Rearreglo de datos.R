#Cargar archivos .csv a Rstudio----

#Empleamos la funci�n read.csv para cargar archivos 
#desde nuestra computadora a Rstudio, y para hacerlo de forma
#manual, requerimos del directorio donde est� el archivo

dir_csv <- "C:/Users/Windows/Desktop/R CURSOS/2. MANEJO Y USO DEL LENGUAJE R/Documentos/Excel/bike_buyers.csv"

#La variable anterior aplica solo para mi caso, cada quien
#debe colocar su directorio correspondiente. Esto lo
#hacemos para no ocupar tanto espacio en la funci�n que 
#usaremos

bikes <- read.csv(file = dir_csv)

#Siempre colocamos el nombre de la variable donde queremos
#guardar nuestros datos, en este caso, se emple� la variable
#bikes. 

#La funci�n header permite indicarle a Rstudio si el primer
#rengl�n son los nombres de las columnas

bikes <- read.csv(file = dir_csv, header = TRUE)

#Podemos rellenar los espacios vac�os con valores NA con la
#funci�n na.strings como sigue

bikes <- read.csv(file = dir_csv, header = TRUE, 
                  na.strings = "")

#El colocar las comillas juntas, indica que los espacios en
#blanco sean le�dos como NA. 

#Otra modificaci�n que podemos realizar, es convertir
#las columnas de tipo caracter en factores con el argumento
#stringAsFactor como sigue

bikes <- read.csv(file = dir_csv, header = TRUE, 
                  na.strings = "", stringsAsFactors = TRUE,)

#Podemos especificar solamente qu� columnas queremos que 
#sean factores con as.is

bikes <- read.csv(file = dir_csv, header = TRUE, 
                  na.strings = "", stringsAsFactors = TRUE,
                  as.is = c(2,8,10,13))

#Lo anterior, indica que las columnas 8, 10 y 13 no deben ser
#transformadas a factores, sino que se queden como est�n. 

#En algunas ocasiones, algunas celdas tendr�an espacios en
#blanco que Rstudio  los leer� como si de otro valor se 
#tratar�. Veamos un ejemplo con la columna "Region"

levels(bikes$Region) #Para extraer los niveles del factor

#Hay que notar que vienen dos niveles llamados "Europa", 
#sin embargo, uno de ellos tiene un espacio en blanco. Para
#eliminar dicho espacio, se usa el argumento strip.white

bikes <- read.csv(file = dir_csv, header = TRUE, 
                  na.strings = "", stringsAsFactors = TRUE,
                  as.is = c(8,10,13), strip.white = TRUE)

#Si revisamos de nuevo, tendremos los niveles de manera
#correcta, lo cual indicar�a que ya no se est� un valor
#como dos distintos por los espacios en blanco

#Cargar archivos .xlsx a Rstudio----

#Para este caso, se emplea la funci�n read.xlsx, de
#la paqueter�a readxl, por lo que debemos verificar si la
#tenemos instalada o no, habiendo muchas formas de saberlo 
#VER SCRIPTS DE PAQUETER�AS

library(readxl)

dir_xlxs <- "C:/Users/Windows/Desktop/R CURSOS/2. MANEJO Y USO DEL LENGUAJE R/Documentos/Excel/World Population.xlsx"
population <- read_xlsx(path = dir_xlxs)

#Podemos utilizar m�s argumentos de igual forma. Donde
#col_names indica que use el primer rengl�n como los nombres
#de las columnas

population <- read_xlsx(path = dir_xlxs, col_names = TRUE)

#Podemos indicar que queremos solamente cierta cantidad de
#datos de la hoja de excel con el ragumento range

population <- read_xlsx(path = dir_xlxs, col_names = TRUE,
                        range = "A1:D15")

#Podemos elegir solo cierto n�mero de renglones con el 
#argumento n_max pero eliminando range

population <- read_xlsx(path = dir_xlxs, col_names = TRUE, 
                        n_max = 20)

#Se pueden eliminar renglones que no queramos con 
#el argumento skip

population <- read_xlsx(path = dir_xlxs, col_names = TRUE, 
                        n_max = 20, skip = 10)

#Eliminar los espacios en blanco

population <- read_xlsx(path = dir_xlxs, col_names = TRUE, 
                        n_max = 20, trim_ws = TRUE)


#Rearreglo de datos----

#Antes de poder comenzar a trabajar en R, una sugerencia
#es rearreglar los datos, es decir, nombre de columnas,
#espacios, valores con NA, etc.

#En primer lugar, para nuestro caso, cambiaremos los 
#puntos de los nombres de las columnas por guiones bajo, y
#para ello se usar� la funci�n gsub()

gsub(pattern = ".", replacement = "_", names(bikes),
     fixed = TRUE)

#Una vez hecho esto, se añaden los nombres al dataframe
#como sigue

names(bikes) <- gsub(pattern = ".", replacement = "_", names(bikes),
                     fixed = TRUE)

#Se cambiar�n algunos nombres de forma m�s espec�ficas
#con la funci�n names

names(bikes)[1] <- "ID"
names(bikes)[10] <- "Distance"

#Ahora, todos los valores en las columnas que digan "YES" y 
#"NO", ser�n cambiados a "TRUE" y "FALSE", respectivamente.
#Esto se puede hacer de muchas formas

##Caso 1. Usando gsub()

bikes$Home_Owner <- gsub("Yes","TRUE", bikes$Home_Owner)
bikes$Home_Owner <- gsub("No","FALSE", bikes$Home_Owner)

#Posteriormente, se transforman los valores de caracter a 
#l�gicos

bikes$Home_Owner <- as.logical(bikes$Home_Owner)

#Caso 2. Usando el operador de igualdad

bikes[bikes == "Yes"] <- TRUE 
bikes[bikes == "No"] <- FALSE

#Se transforman las columnas a valores l�gicos

bikes$Purchased_Bike <- as.logical(bikes$Purchased_Bike)

#En este caso, la columna de "Distance" tiene un caracter
#que no debe estar, que indica "Miles". Vamos a eliminarlo
#y dejar el valor m�ximo

#Eliminamos primero la palabra "Miles"

bikes$Distance <- gsub(" Miles", "",bikes$Distance)



#Preguntas por responder----

#Se plantear�n una serie de preguntas y a partir de ellas
#se obtendr� informaci�n con los datos reci�n cargados. 

#PREGUNTA 1. �Cu�ntos clientes tienen m�s de 4 hijos y un
#ingreso mayor a 100,000? Sin contar los NA

bikes[bikes$Children > 4 & bikes$Income > 100000,]
na.omit(bikes[bikes$Children > 4 & bikes$Income > 100000,])

#PREGUNTA 2. �Cu�ntas personas menores de 30 a�os tienen
#casa, se encuentran casados/as y sin hijos o al menos 1?

bikes[c(bikes$Age < 30 & bikes$Marital_Status == "Married" &
          bikes$Children == 0 | bikes$Children == 1),]

#Podemos contar los renglones con nrow

nrow(bikes[c(bikes$Age < 30 & 
               bikes$Marital_Status == "Married" &
               bikes$Children == 0 | bikes$Children == 1),])

#Lo anterior indica 207, pero existen algunos valores con NA,
#por lo que al eliminarlos, obtenemos lo siguiente

nrow(na.omit(bikes[c(bikes$Age < 30 & 
                       bikes$Marital_Status == "Married" &
                       bikes$Children == 0 | bikes$Children == 1),]))

#Se obtienen 192, lo cual indica que 192 clientes cumplen
#las condiciones propuestas


#Exportar archivos----

#Antes de exportarlo, vamos a a�adir unas columnas extra.
#Queremos a�adir el porcentaje de ingreso a un lado de la
#columna de ingreso (Income)

max(bikes$Income, na.rm = TRUE) #Determinar el valor m�ximo
max_bike <- max(bikes$Income, na.rm = TRUE) #Variable
bikes$Perc_Income <- (bikes$Income*100)/max_bike #Columna
bikes$Perc_Income <- round((bikes$Income*100)/max_bike)

#Vamos a ordenar la columan de "Children" de mayor a 
#menor usando order()

bikes <- bikes[order(bikes$Children, decreasing = TRUE),]

#Hay que reordenar las columnas, donde la �ltima debe ser
#la numero 5

bikes <- bikes[,c(1:4,14,5,6:13)]

#Una vez hecho esto, podemos exportar nuestros datos, donde
#usaremos la funci�n write.csv

write.csv(x = bikes, file = "bikes_data.csv")



#FIN----