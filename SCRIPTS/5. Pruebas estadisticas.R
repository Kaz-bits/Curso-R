
#-----PRUEBAS PARA DETERMINAL NORMALIDAD----

#Una de las que se recomienda utilizar es la prueba de Shapiro-Wilk, donde obtendremos
#dos valores, uno dado por el valor "p" y el valor "W". 

#Supongamos la medición de la expresión de un gen (estos son datos aleatorios, no son reales)

gene_1 <- rnorm(30, mean = 5.2, sd = 2) #Experimento
gene_2 <- rnorm(30, mean = 3.6, sd = 2) #Control

#Evidentemente tendremos una distribución normal, pero hay que comprobarla

shapiro.test(gene_1)
shapiro.test(gene_2)

#NOTA: EL VALOR "p" NO ES UNA PROBABILIDAD DE QUE LA HIPÓTESIS NULA SEA VERDADERA, SINO QUE
#ES UN ESTIMADO DE LA PROBABILIDAD DE QUE OCURRA UN RESULTADO PARTICULAR SI LA HIPÓTESIS
#NULA FUERA VERDADERA.

#En la prueba de Shapiro_Wilk, un valor p > 0.05 indica que tenemos una distribución normal. 
#Una forma de representar nuestros datos mediante gráficos, como histogramas, diagramas
#de cajas (boxplots). 

boxplot(gene_1)
boxplot(gene_2)
boxplot(gene_1, gene_2, ylim = c(0, 9))
axis(side = 2, at = seq(0,9,1))


#-----PRUEBAS ESTADÍSTICAS----

#Veremos parte de la estadística inferencial que se puede implementar dentro de R. Recordar
#que la estadística inferencial es la obtención de conclusiones acerca de una población a través
#de mediciones u observaciones hecha a una muestra; infiere leyes de comportamiento. 

#Se tienen diferentes pruebas para realizar comparaciones entre dos muestras:

#Fishers's test (var.test) #compara dos varianzas
#Student's test (t.test) #compara dos medias con distribución normal
#Wilconxon's test (wilcox.test) #compara dos medias con distribución no normal
#binomial test (prop.test) #compara dos proporciones
#Pearson's correlation (cor.test) #compara dos variables
#chi-squared (chisq.test) #demuestra la independencia entre dos variables



#---Prueba t-student----

#Esta prueba sirve para comparar medias de dos poblaciones, donde las muestras siguen una 
#distribución normal. Tendremos dos de ellos, para muestras independientes y muestras pareadas.
#para ejemplificar esto, supongamos que queremos medir la expresión de genes bajo
#dos condiciones diferentes: 

gene_1 <- rnorm(30, mean = 5.2, sd = 2) #Experimento
gene_2 <- rnorm(30, mean = 3.6, sd = 2) #Control

#Tenemos nuestros datos en cada caso 30 mediciones, cada una con una media diferente pero 
#con una desviación estándar igual. Supongamos que queremos saber si existe cambio en 
#la expresión del gene_1 y gene_2 en condiciones de estrés abiótico en céculas tratadas 
#con [NaCl]:

t.test(gene_1, gene_2)

#En este caso, obtenemos un valor p < 0.05, p = 0.001, lo cual nos indica que hay una 
#expresión diferenciada del gen de interés. 


#----Prueba t-student dependiente---

#Esta prueba se emplea cuando se tiene un pre-tratamiento y un post-tratamiento, es decir,
#son resultados de un mismo grupo, el antes y el después. 

#Si quieres ver un poco más visual esto, voy a crear un dataframe con tres columnas, con el
#nombre del gen, el valor antes del tratamiento y después del tratamiento:

before_CADP <- c("CADP" = rnorm(15, mean = 2.4, sd = 1.5))
after_CADP <- c("CADP" = rnorm(15, mean = 3.2, sd = 1.5))

before_HACP <- c("HACP" = rnorm(15, mean = 4.3, sd = 2.1))
after_HACP <- c("HACP" = rnorm(15, mean = 6.5, sd = 2.1)) 


genes <- data.frame("after" = c(after_CADP, after_HACP), 
                    "before" = c(before_CADP, before_HACP))

genes

#Tenemos que ir ordenando nuestros datos para que sean correspondientes con su renglón:

library(dplyr)

genes <- data.frame("gene_name" = row.names(genes), "after" = c(after_CADP, after_HACP), 
                    "before" = c(before_CADP, before_HACP), row.names = c(1:30))

genes


#Evidentemente, el problema de las columna pudo haberse resuelto de una forma mucho
#más sencilla como la siguiente, creando un vector con 15 veces el nombre de cada gen y
#luego esos vectores los añadimos al dataframe y listo. 

rep(c("CADP"), each = 15)
rep(c("HACP"), each = 15)

#Más adelnate verás la utilidad de las condicionales, lo anterior, el "for" se llama un 
#loop for, porque se genera un ciclo sobre una sola variable. Lo veremos, no entrés en
#pánico. 

#Teniendo tu dataframe "genes" completo, ahora sí, hagamos una prueba t-student pareada:

t.test(x = genes[[2]][1:15], y = genes[[3]][1:15] , paired = TRUE)

#Obtenemos un valor de p = 0.1109, lo cual nos dice que sí hay cambio en la expresión del
#gen CADP en una célula antes dle tratamiento con [NaCl] y después del tratamiento. Ahora
#podemos hacer lo mismo pero con el gen HACP:

t.test(x = genes[[2]][16:30], y = genes[[3]][16:30] , paired = TRUE)

#Aquí tenemos una p = 0.015, lo cual cumple p < 0.05, es decir, para el gen HACP no hay
#un cambio en la expresión después del tratamiento con [NaCl]. 


#NOTA: PARA APLICAR DICHAS PRUEBAS, DEBEMOS ASEGURARNOS DE QUE NUESTROS DATOS SIGAN UNA
#DISTRIBUCIÓN NORMAL. 


#-----Correlación de Pearson----

#Vamos a emplear un dataset que se encuentra cargado en R, llamado "airquality". Nos da
#información acerca de la calidad del aire que data el año 1973 en New York.

head(airquality, n = 7)

#Tenemos 6 variables y 153 observaciones, en este caso, vamos a verificar si existe una 
#relación entre la temperatura y la cantidad de ozono registrada en ese año. 

cor.test(x = airquality$Temp, y = airquality$Ozone, method = "pearson", conf.level = 0.95)
plot(x = airquality$Temp, y = airquality$Ozone, pch = 19, col = "darkblue", 
     xlab = "Temperatura (°F)",
     ylab = "Ozone (ppb)")

#Obtenemos un valor positivo, lo cual indica que conforme aumenta la temperatura, aumenta
#la cantidad de ozono, sin embargo, la correlación no es tan buena 0.6984. Podemos realizar
#más comparaciones

cor.test(x = airquality$Temp, y = airquality$Wind, method = "pearson", conf.level = 0.95)
plot(airquality$Temp, airquality$Wind)

#Por ejemplo, si comparamos la relación de la temperatura con la velocidad dle viento
#la correlación es mala pero negativam esto indica que mientras una aumenta, la otra va 
#disminuyendo. 

cor.test(x = airquality$Wind, y = airquality$Ozone, method = "pearson", conf.level = 0.95)
plot(airquality$Wind, airquality$Ozone)

#----COMPARACIÓN DE DOS O MÁS MUESTRAS-----

#Una de las pruebas que se suele emplear es el análisis de varianza, o ANOVA. Para
#ello, vamos a utilizar otro dataset denominado "PlantGrowth", solo escribelo en
#la consoloa para ver cómo está estructurado

PlantGrowth

#Son experimentos del crecimiento de una planta bajo condiciones control y con dos
#tratamientos distintos. Son 2 variables y 30 observaciones. Hay ANOVA de una via y
#de dos vias, aqui debemos usar de una vía. 

table(PlantGrowth$group)
aggregate(weight ~ group, data = PlantGrowth, FUN = mean)
aggregate(weight ~ group, data = PlantGrowth, FUN = sd)

#Las funciones anteriores sirven para poder verificar si se tiene un modelo equilibrado,
#es decir, mismo numero de observaciones por grupo. Algunos autores sugieren 
#graficar primero un boxplot para poder analizar condiciones de normalidad, y demás
#parámetros. 

library(ggplot2)

ggplot(PlantGrowth, aes(x = group, y = weight, fill = group)) + 
  geom_boxplot()

#Aquí podemos hacer algunas suposiciones según la información que nos proporciona
#el boxplot. De igual forma, se sugiere verificar la normalidad, en este caso, 
#podemos usar un test de shapiro-wilk para ello, este se suele usar cuando hay menos
#de 50 observaciones por grupo, sino, se tendría usar el test de Kolmogorov-Smirnov. 

shapiro.test(PlantGrowth$weight[1:10])
shapiro.test(PlantGrowth$weight[11:20])
shapiro.test(PlantGrowth$weight[21:30])

#Todos los grupos siguen una distribución normal de acuerdo al test de Shapiro-Wilk.
#Se deben considerar más factores, pero para nuestro caso, se realizar el ANOVA. 

#Para realizar el ANOVA, se debe identificar a la variable dependiente y la variable
#independiente. 

aov(weight ~ group, data = PlantGrowth)
aov(PlantGrowth$weight ~ PlantGrowth$group)

#Realizamos una función "summary" y obtenemos todos los datos: 

summary(aov(weight ~ group, data = PlantGrowth))

#R tiene la funcionalidad de graficar los datos del ANOVA relizado:

plot(aov(weight ~ group, data = PlantGrowth))

#Para este caso, el valor "p" fue menor a 0.05, por lo que es un indicativo de que
#existen diferencias significativas entre dos grupos. El paso siguientes es realizar
#una prueba post-hoc dos a dos para determinar los grupos con diferencias. 

library(agricolae)
LSD <- LSD.test(aov(weight ~ group, data = PlantGrowth), trt = "group",
                p.adj = "bonferroni")
LSD


#Hasta este punto hemos revisado solo algunas de las tantas pruebas estadísticas que
#R maneja, por ello es considerado un lenguage y software para la estadística, ya que
#las pruebas son fáciles de realizar y de graficar, sin embargo, debemos conocer
#bien lo que estamos haciendo, y qué tipo de prueba tenemos que utilizar y el por qué
#de ello. 
