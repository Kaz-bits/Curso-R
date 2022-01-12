
#Operaciones basicas----

#Con R podemos realizar algunas operaciones basicas, tales como sumas, restas, divisiones, etc

1 + 6 + 9
(1 + 6) * 9
 
#Los valores de salida se verán la consola. Observa que siempre aparece un [1], esto indica 
#el primer elemento de un output específico. Algo que hay que saber, es que, todo numero que se
#imprima en la consola, será interpretado como un vector. Un vector luce así:

vector_1 <- c(1, 2, 5, 7, 10, 11, 12, 100)

#Te describo lo anterior. La parte "vector_1" es el nombre una variable aleatoria que yo nombré, 
#el simbolo "<-" se usa para nombrar variables, automaticamente R con dicho simbolo sabe que lo que
#vas a escribir después, estará contenido en la varable que nombraste. La función "c()" permite crear
#vectores, y es una alusión a la palabra "combinar" o "concatenar". 

vector_2 <- c(1:100)
vector_2

#Lo anterior crea un vector con los primero 100 elementos. Si mandas a llamar a las varaibles 
#vector_1 y vector_2, verás ahora varios numeros entre corchetes, esto te está indicando la 
#posición del primer elemento que aparece en el vector. 

#Un vector puede contener diferentes clases de objetos, por ejemplo, objetos numericos, caracteres,
#valores lógicos, etc. 

vector_3 <- c("Hola Mundo")
vector_3

#Observa que para poder crear este vector, tuve que escribir entre comillas, SIEMPRE RECUERDA USAR
#COMILLAS CUANDO MANIPULES VALORES DEL TIPO "character"

vector_3 <- c("Hello World", "Hello R interpreter", "Hello everyone")
vector_3

#Acabo de crear un vector de longitud 3. Lo que hice es válido, Sobreescribí el vector anterior
#con otros valores. Esto no será de mucha ayuda más adelante. Si no quisieras borrar lo que
#tenías escrito o guardado en el vector, puedes "apendar" los nuevos valores así:

vector_3 <- append(vector_3, "This is a new string")
vector_3

#Otro tipo de clase de objetos que manejan los vectores son los valores boleanos o lógicos, es decir,
#verdadero o falso

vector_4 <- c(TRUE, FALSE, F, T)
vector_4

#Observa que no es necesario escribir entre comillas, porque el interprete de R sabe que se trata
#de valores logicos.


#---------Subsetting--------

#Aqui te voy a mostrar como obtener valores especificios o posiciones dentro de un vector. Imagina
#que tienes el vector "vec" con los primeros 1000 numeros, y quieres obtener el numero 543 solamente
#bueno, para hacerlo, se hace lo siguiente: 

vec <- c(1:1000)
vec[543]

#Se deben usar corchetes para que el interprete sepa que a la variable "vec" se le debe extraer
#el valor en la posicion 543. Ahora supongamos quieren los valores 4, 567, 83, 12 y 10

vec[c(4, 567, 83, 12, 10)]

#Lo que hice fue extraer esos cinco numeros pero para ello tengo que hacerlo en forma de un vector.
#Igual puedes extraer secuencias

vec[4:60]

#Lo anterior te proporciona los valores del 4 al 60. Supongamos ahora que NO quieres los valores 
#80, 90, 95, 100, 120, 147 y del 900 al 999

vec[-c(80, 90, 95, 100, 120, 147, 900:999)]

#Lo anterior, al colocar el signo "menos" antes del vector, indica que deseas extraer todo lo del
#vector excepto lo escrito en los corchetes.

#Hagamos esto más divertido, y usemos una secuencia de aminoacidos de la proteina p53, el guardian
#del gneoma. Como tiene una longitud de 393 aminoaciods (R los interpreta como caracteres), 
#la voy a guardar en una estructura diferente, algo llamado "dataframe"

#Primero, quiero que note, que, si quiero trabajar con secuencias, no es muy eficiente hacerlo de
#esta forma, guardandola en vectores, es mejor usar el formato "fasta", pero para este caso
#será la excepción


p53 <- "MEEPQSDPSVEPPLSQETFSDLWKLLPENNVLSPLPSQAMDDLMLSPDDIEQWFTEDPGPDEAPRMPEAAPPVAPAPAAPTPAAPAPAPSWPLSSSVPSQKTYQGSYGFRLGFLHSGTAKSVTCTYSPALNKMFCQLAKTCPVQLWVDSTPPPGTRVRAMAIYKQSQHMTEVVRRCPHHERCSDSDGLAPPQHLIRVEGNLRVEYLDDRNTFRHSVVVPYEPPEVGSDCTTIHYNYMCNSSCMGGMNRRPILTIITLEDSSGNLLGRNSFEVRVCACPGRDRRTEEENLRKKGEPHHELPPGSTKRALPNNTSSSPQPKKKPLDGEYFTLQIRGRERFEMFRELNEALELKDAQAGKEPGGSRAHSSHLKSKKGQSTSRHKKLMFKTEGPDSD"

nchar(p53)

#SI yo quisiera extraer algo de este vector, no podría, por ejemplo, si quisiera extraer
#el aminoacido de la posocion 300, me marcaria que no hay registro

p53[300]

#Esto se debe a que, yo guarde toda la secuencia como un caracter único. Si colocas lo siguiente

p53[1]

#El resultado es toda la secuencia. Para arreglar eso, emplearemos una función que permite
#dividir esta gran cadena en elementos individuales, llamada strsplit():

p53_1 <- strsplit(p53, "")

#Si ejecutas lo anterior, ahora vas a obtener una estructura llamada "lista" que se iré explicando
#mas adelante, sin embargo, debo decirte que cada estructura emplea formas de extraer elementos
#de forma distinta, para nuestro caso, observa lo siguiente: 

p53_1[1]  #Esto me sigue extrayendo toda la secuencia con un titulo de la lista
p53_1[[1]] #Esto me extrae solo la secuencia sin el titulo de la lista
p53_1[[1]][300]

#Con el último comando, ¡logramos extraer el aminoácido de la posición 300! Se trata de una Prolina (P)
#Esto es una herramienta muy poderosa, porque estamos aprovechanod el lenguaje informático para 
#realizar análisis biológicos. 

#Por si aún no ves más o menos la idea del curso, mira lo siguiente. Imagina ahora, que queremos saber
#la cantidad de aminoacidos con carga negativa. Por conocimiento, hay dos, "Aspartato (D)" 
#y "Glutamato (E)". Usanod diferentes funciones de R, podemos saberlo: 

library(tidyverse)
table(p53_1)

#Con table() podemos saber cuántos aminoacidos (o letras) hay de cada uno de los 20 aminoacidos. Pero 
#queremos D y E


table(p53_1[[1]] == "E") #Hay 30
table(p53_1[[1]] == "D") #Hay 20

#Aqui es donde los valores logicos toman importancia, porque nos indica que hay 20 coincidencia (TRUE)
#con la letra "D" y 30 con "E". Con estos datos, podemos hacer inclusive graficos como los siguientes: 

library(ggplot2)

df1 <- data.frame(table(p53_1))
names(df1)[1] = "Aminoacido"
names(df1)[2] = "Cantidad"
df1

ggplot(df1, aes(Aminoacido, Cantidad, fill = Aminoacido)) + 
  theme_bw() +
  ggtitle("Cantidad de aminoácidos en proteína p53") +
  labs(x = "Aminoácido (código)",
         y = "Cantidad") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 11, face = "bold")) +
  scale_y_continuous(limits = c(0, 46), breaks = seq(0, 46, by = 4)) +
  geom_bar(stat = "identity", color ="black", width = 1, size = 0.8) +
  geom_text(aes(label = Cantidad), vjust = -0.5, colour = "black") + 
  scale_x_discrete(limits = df1$Aminoacido)


#La paquería de ggplot2 nos permite crear gráficos de alta calidad, además, podemos modificar
#los atributos del mismo dependiendo de nuestros intereses. 

#Hasta este punto, solamente hemos visto un tour rápido del entorno de Rstudio y del lenguaje R
#además de una idea de cómo podemos utilizarlo. 


