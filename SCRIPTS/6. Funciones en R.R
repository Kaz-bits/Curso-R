
#----HERRAMIENTAS DE PROGRAMACIÓN----

#----FUNCIONES EN R----

#En R, las funciones son otro tipo de clase, las funciones que hemos utilizado antes son
#parte de esa clase. Las funciones como parte de la programación en R, poseen una 
#estructura y sintaxis característica, la cual es la siguiente: 

function_name <- function(arg_1, arg_2, ...) {
  Function_body
}

#El "function_name" es el nombre que se le asignará a dicha agrupación, cuando se invoca
#a "function", esta debe llevar argumentos, es decir, los valores que estos van a tomar, 
#la parte de "function_body" describe todo lo que la función hace, como operaciones, 
#etc., entonces, cuando usamos esta sintaxis, lo que estamos haciendo es "definir" a
#las funciones. Un ejemplo sencillo:

hipotenusa <- function(x, y) {
  sqrt(x^2 + y^2)
}

class(hipotenusa)

#Como puedes ver, la clase de "hipotenusa" es función, igual en al ambiente de las
#variables se guardó como función. 

hipotenusa(x = 5, y = 4)

#Si te das cuenta, la función hipotenusa recibe los argumentos "x" y "y", y te regresa
#la operación que tú hayas establecido. Otro ejemplo por si no ha quedado claro de
#gran potencia de esta herramienta:

library(ggplot2)

grafico_bonito <- function(data, x, y, x_name, y_name, plot_name) {
  return(ggplot(data, aes(x, y, fill = x)) + 
           geom_boxplot() + 
           labs(x = x_name, 
                y = y_name) + 
           ggtitle(plot_name) +
         theme_bw() + 
           scale_fill_discrete(name = "Tratamiento") + 
           theme(plot.title = element_text(size = 12, face = "bold"), 
                 axis.title = element_text(size = 12, face = "bold"), 
                 panel.grid.minor = element_blank(),
                 panel.grid.major = element_blank())) 
}


grafico_bonito(data = PlantGrowth, 
               x = PlantGrowth$group, 
               y = PlantGrowth$weight, 
               x_name = "Tratamientos", 
               y_name = "Peso en seco (g)", 
               plot_name = "Efecto en de dos sustancias sobre el crecimiento de las plantas")



#Esos son algunos ejemplos de lo que se puede hacer con una función, tú podrías 
#hacer una función con un código específico para un gráfico que estés utilizando, 
#tú defines a los argumentos de tu función y cuando la ejecutes, se logre obtener el
#gráfico de tu interés. Estas funciones pueden aplicarse a operaciones específicas, 
#como obtener la media, mediana, moda, cuartiles, pruebas de shapiro-wilk, etc.