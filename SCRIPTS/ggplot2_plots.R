
#===============REQUISITOS====================

#paqueterías necesarias
library(ggplot2)
library(nycflights13)

#codigo de nycflights
MCO_flies <- flights[c(flights$dest == "MCO" & 
                         flights$month == 12 & 
                         flights$day == 23), ]



#----Construcción de scatterplot----

#colocar dataframe con el que se trabajara
ggplot(iris)

#colocar esteticas (eje "x" y "y")
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length))

#agregar objeto geometrico, en este caso, puntos
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_point()

#guardar grafico
ggsave(filename = "scatterplot.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)



#----Construcción de jitterplot----

#colocar dataframe con el que se trabajara
ggplot(iris)

#colocar esteticas (eje "x" y "y")
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length))

#agregar objeto geometrico, en este caso, puntos
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_jitter(aes(color = Species))

#guardar grafico
ggsave(filename = "jitterplot.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)




#----Construcción de barchart----

#cargar paqueteria de nycflights13
library(nycflights13)

#construir un nuevo dataframe con condiciones
MCO_flies <- flights[c(flights$dest == "MCO" & 
                         flights$month == 12 & 
                         flights$day == 23), ]

#utilizar ggplot2 para el grafico. Graficar columna de la hora
#colocar dataframe
ggplot(MCO_flies)

#agregar esteticas (ejes)
ggplot(MCO_flies, aes(x = hour, y = ""))

#agregar objeto geometrico
ggplot(MCO_flies, aes(x = hour)) + 
  geom_bar(stat = "count")

#guardar grafico
ggsave(filename = "barchart_count.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)


#----Construccion de histogram (variable continua)----

#colocar dataframe en ggplot2
ggplot(iris)

#agregar esteticas
ggplot(iris, aes(x = Sepal.Length))

#agregar objeto geometrico
ggplot(iris, aes(x = Sepal.Length)) + 
  geom_histogram(aes(fill = Species), binwidth = 0.1, color = "black")

#guardar grafico
ggsave(filename = "histogram.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)



#----Construccion de histogram (variable discreta)----

#colocar dataframe en ggplot2
ggplot(MCO_flies)

#agregar esteticas
ggplot(MCO_flies, aes(x = carrier))

#agregar objeto geometrico
ggplot(MCO_flies, aes(x = carrier)) + 
  geom_bar(aes(fill = origin), color = "black")

#guardar grafico
ggsave(filename = "histogram_categorical.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)



#----Construccion de density plot----

#colocar dataframe en ggplot2
ggplot(iris)

#agregar esteticas
ggplot(MCO_flies, aes(x = carrier))

#agregar objeto geometrico
ggplot(iris, aes(x = Sepal.Length)) + 
  geom_density(aes(fill = Species), color = "black", alpha = 0.5)

#guardar grafico
ggsave(filename = "densiy_plot.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)




#----Construccion de boxplot----

#colocar dataframe
ggplot(iris)

#agregar esteticas (ejes)
ggplot(iris, aes(x = Species, y = Petal.Length))

#agregar objeto geometrico
ggplot(iris, aes(x = Species, y = Petal.Length)) + 
  geom_boxplot(aes(fill = Species))

#guarda grafico
ggsave(filename = "boxplot.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)


#----Construccion de violin plot----

#agregar dataframe
ggplot(iris)

#agregar esteticas (ejes)
ggplot(iris, aes(x = Species, y = Sepal.Length))

#agregar objeto geometrico
ggplot(iris, aes(x = Species, y = Sepal.Length)) + 
  geom_violin(aes(fill = Species))

#guarda grafico
ggsave(filename = "violin_plot.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)



#----Construccion de pie chart----
#agregar dataframe
ggplot(MCO_flies)

#agregar esteticas (ejes) y funcion fill = carrier
ggplot(MCO_flies, aes(x = "", y = air_time, fill = carrier))

#agregar objeto geometrico (barchart)
ggplot(MCO_flies, aes(x = "", y = air_time, fill = carrier)) +
  geom_bar(stat = "identity")

#agregar coordenadas polares
ggplot(MCO_flies, aes(x = "", y = air_time, fill = carrier)) +
  geom_bar(stat = "identity") + coord_polar(start = 0, theta = "y")

#guardar grafico
ggsave(filename = "pie_chart.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)


#----USO DE LA CAPA THEME----

#tomar como ejemplo el scatterplot
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_point()

#agregamos un título al gráfico
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_point() + 
  ggtitle("Comparación del sépalo y pétalo")

#agregamos un nombre a los ejes
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_point() + 
  ggtitle("Comparación del sépalo y pétalo") + 
  labs(x = "Longitud del sépalo (cm)", 
       y = "Longitud del pétalo (cm)")

#agregamos la funcion theme() para modificar aspectos del grafico
#modificamos el título del gráfico
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_point() + 
  ggtitle("Comparación del sépalo y pétalo") + 
  labs(x = "Longitud del sépalo (cm)", 
       y = "Longitud del pétalo (cm)") + 
  theme(plot.title = element_text(size = 14, hjust = 0.5))

#modificamos los ejes asignados
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_point() + 
  ggtitle("Comparación del sépalo y pétalo") + 
  labs(x = "Longitud del sépalo (cm)", 
       y = "Longitud del pétalo (cm)") + 
  theme(plot.title = element_text(size = 14, face = "bold", hjus = 0.5), 
        axis.title = element_text(size = 14))

#modificamos las dimensiones de los ejes
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_point() + 
  ggtitle("Comparación del sépalo y pétalo") + 
  labs(x = "Longitud del sépalo (cm)", 
       y = "Longitud del pétalo (cm)") + 
  theme(plot.title = element_text(size = 14, face = "bold", hjus = 0.5), 
        axis.title = element_text(size = 14)) + 
  scale_y_continuous(breaks = seq(0, 8, by = 0.5)) + 
  scale_x_continuous(breaks = seq(0, 10, by = 0.5))

#modificamos el fondo del grafico
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_point() + 
  ggtitle("Comparación del sépalo y pétalo") + 
  labs(x = "Longitud del sépalo (cm)", 
       y = "Longitud del pétalo (cm)") + 
  theme(plot.title = element_text(size = 14, face = "bold", hjus = 0.5), 
        axis.title = element_text(size = 14)) + 
  scale_y_continuous(breaks = seq(0, 8, by = 0.5)) + 
  scale_x_continuous(breaks = seq(0, 10, by = 0.5)) 
  

#modificamos los colores de los puntos
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) + 
  geom_point() + 
  ggtitle("Comparación del sépalo y pétalo") + 
  labs(x = "Longitud del sépalo (cm)", 
       y = "Longitud del pétalo (cm)") + 
  theme(plot.title = element_text(size = 14, face = "bold", hjus = 0.5), 
        axis.title = element_text(size = 14)) + 
  scale_y_continuous(breaks = seq(0, 8, by = 0.5)) + 
  scale_x_continuous(breaks = seq(0, 10, by = 0.5)) 

#cambiar tamaño de los puntos
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, linetype = Species)) + 
  geom_point(size = 2) + 
  ggtitle("Comparación del sépalo y pétalo") + 
  labs(x = "Longitud del sépalo (cm)", 
       y = "Longitud del pétalo (cm)") + 
  theme(plot.title = element_text(size = 14, face = "bold", hjus = 0.5), 
        axis.title = element_text(size = 14)) + 
  scale_y_continuous(breaks = seq(0, 8, by = 0.5)) + 
  scale_x_continuous(breaks = seq(0, 10, by = 0.5))

#guardar grafico
ggsave(filename = "scatterplot_theme.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)



#----CONSTRUCCION COMPLETA DE GRAFICOS----

#cargar datos del archivo species.csv
species <- read.csv(file = "C:/Users/Windows/Desktop/Curso R/DATA/EXCEL_FILES/species.csv")
                    
#construir grafico

ggplot(species, aes(x = factor(taxa, levels = 
                                 c("Rabbit", "Reptile", "Bird", "Rodent")))) + 
  geom_bar(aes(fill = taxa), color = "black", size = 1.3) + 
  theme_bw() + 
  ggtitle("Gráfico de barras para taxones") + 
  labs(x = "Especies", 
       y = "Cantidad") + 
  theme(plot.title = element_text(size = 14, hjus = 0.5), 
        axis.title = element_text(size = 12))

#guardar grafico
ggsave(filename = "barplot_theme.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)




#otro grafico
ggplot(iris, aes(x = Sepal.Width)) + 
  geom_density(fill = "lightblue", alpha = 0.5, size = 1) + 
  ggtitle("Gráfico de densidad") + 
  labs(x = "Longitud del sépalo (cm)",
       y = "Densidad") +
  theme_bw() + 
  theme(plot.title = element_text(size = 14, hjus = 0.5), 
        axis.title = element_text(size = 12))

#guardar grafico
ggsave(filename = "density_plot_theme.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)




#----Construir scatterplot----
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) + 
  geom_jitter(aes(fill = "black"))  
  


#----Construir gráfico con tres geoms----

library(ggplot2)

#cargar datos, para este caso, usar iris
View(iris)

#añadir las primeras tres capas
ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) + 
  geom_violin(trim = FALSE)

#añadir un geom_boxplot y un geom_jitter a las capas anteriores
ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) + 
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.1, color = "white", size = 0.6) + 
  geom_jitter(aes(fill = Species), shape = 21, width = 0.1) 

#modificar el gráfico final con la capa theme()
ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) + 
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.1, color = "white", size = 0.6) + 
  geom_jitter(aes(fill = Species), shape = 21, width = 0.1) +
theme_classic() + 
  ggtitle("Gráfico de violín + boxplot para distribución de datos") + 
  labs(x = "Especies",
       y = "Longitud del pétalo (cm)") + 
  theme(plot.title = element_text(hjus = 0.5, size = 14, face ="bold"),
        axis.title = element_text(size = 14),
        axis.text = element_text(size = 12),
        legend.title = element_text(size = 12),
        legend.position = c(0.1, 0.8), 
        legend.key.size = unit(0.75, "cm"),
        legend.text = element_text(size = 11),
        legend.background = element_rect(color = "black", size = 1)) + 
  scale_y_continuous(breaks = seq(0, 8, by = 0.6)) + 
  scale_fill_discrete(name = "Especie", 
                      labels = c("Setosa", "Versicolor", "Virginica"))


#guardar gráfico
ggsave(filename = "violinplot_boxplot.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350) 


#----Construir boxplot usando theme----
ggplot(MCO_flies, aes(x = carrier, y = hour, fill = carrier)) + 
  geom_boxplot(size = 0.8) + 
  ggtitle("Distribución de la salida de cada aerolínea") +
  labs(x = "Aerolínea",
       y = "Hora de salida (24 h)") + 
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 14),
        axis.title = element_text(size = 14)) + 
  scale_fill_discrete(name = "Aerolínea")

#guardar gráfico
ggsave(filename = "boxplot_theme.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)


#----Construir grafico con facetas----

library(ggplot2)

#construir capas
ggplot(MCO_flies, aes(x = carrier, y = air_time)) + 
  geom_boxplot(aes(fill = carrier), size = 0.6) + 
  facet_grid(distance + origin ~ carrier)

#añadir capa theme
ggplot(MCO_flies, aes(x = carrier, y = air_time)) + 
  geom_boxplot(aes(fill = carrier), size = 0.6) + 
  facet_grid(distance + origin ~ carrier) + 
  ggtitle("Gráfico de comparaciones múltiples") + 
  labs(x = "Aerolínea", 
       y = "Tiempo de vuelo (min)") + 
  theme_bw() + 
  theme(plot.title = element_text(size = 14, hjust = 0.5),
        axis.title = element_text(size = 14),
        legend.title = element_text(size = 12, hjust = 0.5),
        legend.text = element_text(size = 10),
        legend.background = element_rect(color = "black"),
        legend.key.size = unit(1, "cm")) + 
  scale_fill_discrete(name = "Aerolíneas\nde Nueva York")

#guardar grafico
ggsave(filename = "boxplot_facet-grid_theme.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)


#----Construir grafico colocando texto----
ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_bar(color = "black") + 
  geom_text(aes(label = ..count..), stat = "count", position = "stack", 
            vjust = 1.5, size = 6) + 
  ggtitle("Histograma con etiquetas") +
  labs(x = "Longitud del sépalo (cm)",
       y = "Frecuencia") +
  theme_classic() +
  theme(plot.title = element_text(size = 14, hjust = 0.5),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 12),
        legend.background = element_rect(color = "black"),
        legend.position = c(0.9, 0.85),
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 12)) + 
  scale_x_continuous(breaks = seq(4, 8, by = 0.20)) + 
  scale_y_continuous(breaks = seq(0, 15, by = 1))
  
#guardar grafico
ggsave(filename = "histogram_theme.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)




#----Construir grafico usando stats----
ggplot(iris, aes(x = Sepal.Length, fill = Species)) + 
  geom_histogram(bins = 29, color = "black") + 
  theme_minimal() + 
  ggtitle("Histograma para una variable continua en el eje x", 
          subtitle = "Variable continua: longitud del sépalo") +
  labs(x = "Longitud del sépalo (cm)", 
       y = "Frecuencia", 
       caption = "Histograma creado en Curso R") + 
  theme(plot.title = element_text(size = 14),
        axis.title = element_text(size = 14),
        axis.text = element_text(size = 11),
        legend.background = element_rect(color = "black")) + 
  scale_x_continuous(breaks = seq(4, 8, by = 0.25)) +
  scale_y_continuous(breaks = seq(0, 15, by = 1)) + 
  scale_fill_discrete(name = "Especie", 
                      labels= c("Setosa", "Versicolor", "Virginica"))




#----Construir histograma para variable discreta----
ggplot(mpg, aes(manufacturer, fill = manufacturer)) + 
  geom_bar(color = "black", size = 1) + 
  theme_classic() + 
  ggtitle("Histograma de una variable categórica", 
          subtitle = "Variable categórica: fabricante") +
  labs(x = "Fabricante",
       y = "Frecuencia") +
  theme(plot.title = element_text(size = 14), 
        axis.title = element_text(size = 14),
        axis.title.x = element_text(vjust = 1),
        axis.text.x = element_text(size = 12, angle = 45, 
                                   vjust = 1, hjust = 1),
        legend.position = "none") + 
  scale_y_continuous(breaks = seq(0, 40, by = 5)) +
  scale_fill_manual(values = c("maroon3", "violetred2", "darkturquoise", 
                               "orangered2","brown2", "goldenrod3", "green3",
                               "seashell4", "yellow3", "skyblue", "wheat",
                               "sienna2", "violet", "mediumpurple2",
                               "plum1", "slategray3"))

#guardar grafico
ggsave(filename = "histogram_colors.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)



#----Construir un piechart----
ggplot(MCO_flies, aes(x = "", y = air_time, fill = carrier)) + 
  geom_bar(stat = "identity") +
  coord_polar(theta = "y", start = 0) + 
  theme_void() +
  ggtitle("Gráfico de pastel del tiempo de\nvuelo para cada aerolínea") +
  theme(plot.title = element_text(size = 14, hjust = 0.5),
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 10)) + 
  scale_fill_discrete(name = "Aerolínea")

#guardar grafico
ggsave(filename = "pei_chart_theme.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)


#----Construir un scatterplot modificado----
library(ggplot2)

ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, fill = Species,
                 shape = Species, size = Species)) +
  geom_point() +
  ggtitle("Scatterplot de dos variables continuas") + 
  labs(x = "Longitud del sépalo (cm)",
       y = "Longitud del pétalo (cm)") +
  theme_bw() + 
  theme(plot.title = element_text(size = 14, hjust = 0.5), 
        axis.title = element_text(size = 12),
        legend.title = element_text(), 
        legend.background = element_rect(color = "black"),
        legend.key.size = unit(1, "cm"),
        legend.position = c(0.9,0.3)) + 
  scale_fill_manual(values = c("yellow", "violetred2", "#00c7ee"), 
                    name ="Especie") +
  scale_shape_manual(values = c(1, 23, 25), 
                     name = "Especie") +
  scale_size_manual(values = c(3, 2.5, 4), 
                    name = "Especie") +
  scale_x_continuous(breaks = seq(4, 8, by = 0.5)) +
  scale_y_continuous(breaks = seq(0, 8, by = 1))

#guardar grafico
ggsave(filename = "scatterplot_theme_legend.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)


#----Construir un density plot----
ggplot(iris, aes(x = Sepal.Length)) + 
  geom_density(aes(fill = Species), color = "black", alpha = 0.5) + 
  theme_bw() +
  ggtitle("Diagrama de densidad", 
          subtitle = "Basado en la estimación de Kernel") +
  labs(x = "Longitud del sépalo (cm)",
       y = "Densidad") + 
  theme(plot.title = element_text(size = 14),
        axis.title = element_text(size = 14),
        axis.text = element_text(size = 12),
        legend.background = element_rect(color = "black", size = 0.7),
        legend.title = element_text(size = 12),
        legend.text = element_text(size = 10),
        legend.key.size = unit(1, "cm"),
        legend.position = c(0.87,0.7)) +
  scale_x_continuous(breaks = seq(4, 9, by = 0.25)) + 
  scale_y_continuous(breaks = seq(0, 1.5, 0.1))

#guardar grafico
ggsave(filename = "density_plot_theme.png", device = "png", units = "in", 
       width = 8, height = 4, dpi = 350)



#----Construir un histograma en 2D----

#crear datos aleatorios
df <- data.frame("x" = rnorm(1500), "y" = rnorm(1500))

#crear grafico en 2D
ggplot(df, aes(x = x, y = y)) + 
  geom_hex() + 
  theme_bw()
