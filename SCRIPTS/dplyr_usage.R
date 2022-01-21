
#----Factores----

carreras <- c("QFB", "QFB", "QFB", "QFB", "B", "CDT", "QA", "QA", 
              "Q", "Q", "QA", "B", "B")

length(carreras)
factor(carreras) #para generar los factores se usa factor()

carreras <- factor(carreras) #guardar factores en la misma variable
levels(carreras) #para revisar los niveles 

carreras[1]

#Ver si tenemos instalado una paqueteria especifica
library("xaringan")

#Si queremos revisar paqueterías individuales
row.names(installed.packages()) == "ggplot2"

#Para checar si tenemos instalado una paquetería
grep("A3", row.names(installed.packages()))
row.names(installed.packages())[187]

row.names(installed.packages())[row.names(installed.packages()) == "A3"]

#Vamos a utilizar algunas funcionales de la 
#apqueteria dplyr

#La primera de ellas es select(), que permite
#extraer columnas del dataframe. Primero se coloca
#el nombre del dataframe y luego las columnas

select(iris, Sepal.Length, Sepal.Width)

#Podemos hacerlo usando el pipe (%>%)

iris %>% select(Sepal.Length, Sepal.Width)


#La funcion filter() es una poderosa herramienta
#ya que filtra los datos de acuerdo a ciertos
#criterios relacionales

head(iris) #Te muestra los primeros 6 renglones

#Con el codigo de abajo extraemos todos los renglones
#que lleven como nombre "setosa", dandonos todas
#las columnas

filter(iris, Species == "setosa") 

#Podemos hacer lo mismo pero extrayendo solo la 
#columna 1 y 3, para ello utilizamos el llamado
#"pipe" o el simbolo %>%

filter(iris, Species == "setosa") %>% select(Sepal.Length, Petal.Length)

#Obtener los renglones que sean para setosa o virginica

filter(iris, Species == "setosa" | Species == "virginica")

#Obtener los renglones de setosa cuyo valor de longitud del
#sepalo sea mayor a 5.5

filter(iris, Species == "setosa", Sepal.Length > 5)

#Obtener los renglones para setosa cuyo longitud del sepalo
#sea mayor a 5 y longitud del petalo igual a 1.4

filter(iris, Species == "setosa", Sepal.Length > 5, Petal.Length == 1.4)

#Podemos combinar filter() y select() para obtener datos más
#especificos, por ejemplo, utilizar el comando anterior y
#extraer las columnas del petalo junto la especie

filter(iris, Species == "setosa", Sepal.Length > 5, Petal.Length == 1.4) %>%
  select(Petal.Length, Petal.Width, Species)

#La funcion group_by() se emplea para agrupar los renglones de
#acuerdo a cierta caracteristica en comun

group_by(iris, Species)

#No es muy visible el uso de group_by, pero si lo acoplamos
#a la función summarise(), podemos obtener mayor informacion

group_by(iris, Species) %>% summarise("media" = mean(Petal.Length), 
                                      "mediana" = median(Petal.Length))