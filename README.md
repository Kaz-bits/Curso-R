
  html_preview: true
---

### Comandos de utilidad. 

Antes poder dar inicio de lleno en el curso, debemos conocer algunos comandos que R maneja y que nos serán de utilidad cuando estemos trabajando, ya sea con gran cantidad de datos o cuando se generen errores, el cómo poder ver la documentación para resolver problemas, buscar ayuda dentro de Rstudio, etc. 

#### A. Salir de Rstudio

Cuando desees salir de Rstudio, lo más recomendado es, primero, guardar todo lo que hayas hecho, si no, corres el riesgo de perderlo. Hay varias opciones, la mejor y más común es simplemente cerrar el programa dando click en el icono de X. Otra forma es presionando `ctrl + Q`, o puedes simplemente escribir `q()` en la consola. </p>

#### B. Pidiendo ayuda en manuales e internet. 

Es muy importante que, cuando comienzas a utilizar algún lenguaje de programación, sepas dónde buscar información y cómo buscarla. Uno de los primeros sitios en los que se optaría por buscar documentación acerca de R y Rstudio es en el sitio oficial de **CRAN**, te dejo el link donde habrá algunos manuales de introducción: https://cran.r-project.org/manuals.html. </P>

Otro manual muy pero muy bueno es el creado por **Garret Grolemund**, un especialista en lenguajes de programación y en el aprendizaje de los mismos, te dejo el link: https://d1b10bmlvqabco.cloudfront.net/attach/ighbo26t3ua52t/igp9099yy4v10/igz7vp4w5su9/OReilly_HandsOn_Programming_with_R_2014.pdf. </p>

En internet puedes encontrar más manuales, son muy recomendados. Ahora, si lo que deseas es buscar respuestas específicas para algún problema que involucre las funciones y comandos de R, el mejor sitio es el llamado **StackOverflow**, es un sitio de preguntas y respuestas enfocadas en la programación, tanto para quienes están iniciando como para personas avanzadas. Este es el protal: https://stackoverflow.com/. Yo te recomiendo buscar siempre en inglés, pero será según tu conveniencia. </p>

Algunas veces, de igual forma en internet, hay sitios especializados para buscar información, uno de ellos es **Github**, sin embargo, este sitio no es solo para buscar soluciones a preguntas, sino que, se trata de un espacio para alojar códigos de programación, es un sitio más especializado para desarolladores, no entraremos mucho en detalle porque moverse dentro de ese sitio, tiene su chiste. Igual, te dejo el link: https://github.com/. </p>

#### C. Pidiendo ayuda dentro de Rstudio. 

Una de las ventajas de Rstudio es que guarda mucha documentación, para poder acceder a parte de ella, simplemente escribe en la consola `help.start()`, y te aparecerá una ventana nueva en la parte inferior derecha de Rstudio. Ahí podrás accerder a mauales de ayuda. </p>

Dentro de Rstudio puedes buscar ayuda o información para las funciones que se manejen en este ambiente, lo único que debes hacer es escribir `help("nombre de la función)`, por ejemplo, si quieres saber lo que hace y cómo se usa la función `data.frame()`, debes escribir: `help("data.frame")`, en este caso, entre comillas. Ahora, si no quieres gastar tiempo tecleando eso, solo pon un signo de interrogación al principio de la función: `?data.frame`, y listo, en la sección de ayuda aparecera información.</p>

Para buscar información sobre alguna paquetería (lo veremos), debes escribir lo siguiente: `help(package = "ggplot2")`, y listo, toda la información necesaria la encontrarás. 
