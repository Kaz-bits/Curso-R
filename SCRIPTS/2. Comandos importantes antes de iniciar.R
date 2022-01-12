
#Antes poder dar inicio de lleno en el curso, debemos conocer algunos comandos que R maneja
#y que nos serán de utilidad cuando estemos trabajando, ya sea con gran cantidad de datos
#o cuando se generen errores, el cómo poder ver la documentación para resolver problemas, 
#buscar ayuda dentro de Rstudio, etc.


#-------SALIR DE RSTUDIO-------

#Cuando desees salir completamente de Restudio, un comanod que R maneja es el siguiente: 

q()

#Esto, al ejecutarlo en la terminal o consola, podremos salir de software. Depenediendo del OS
#que manejes, será diferente al salida. Antes de salir, recuerda siempre guardar cualquier ambiente
#de trabaja que hayas estado elaborando o modificando

#------INTERRUMPIR UN COMANDO-----

#Hay ocasiones en las que estamos trabajando con ciertas variables dentro de condicionales
#donde se pueden generar "loops" (los veremos más adelante), esto a veces puede demorar mucho tiempo
#debido a problemas de código o errores, pero R sigue ejecutandolo, si nos llega a pasar eso, lo que
#debemos hacer presionar dentro de la consola la tecla "Esc" o dar clic en el icono de "stop". 


#-------PIDIENDO AYUDA EN DOCUMENTACIÓN------

#Algo que hay que tener en cuenta siempre que usemos cualquier lenguaje de programación es, que debemos 
#saber checar la documentación disponible, porque siempre nos será muy útil. Para lograr eso, escribe lo
#siguiente en la consola:

help.start()

#Esto te abrirá una ventana en el panel derecho inferior en la pestaña de "help", donde podrás
#checar gran cantidad de información, desde paqueterías hasta libros completos. 



#------PIDIENDO AYUDA PARA FUNCIONES------

#Como en R siempre estaremos trabajando con funciones, cuando no sabemos cómo usarla, debemos saber dónde
#buscar. Por ejemplo, quieres saber para que sirve la función data.frame, pues hacemos lo siguiente: 

help("data.frame")
help("nchar")
help("library")
help("mean")

?data.frame
?nchar()
?mean


#-------PIDIENDO AYUDA PARA PAQUETERIAS-------

help(package = "ggplot2")
help(package = "seqinr")


#-------BUSCANDO AYUDA EN EL SITIO CRAN------

http://cran.r-project.org/web/views/




