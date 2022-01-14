#Creando vectores----

#Es posible crear vectores de diferentes formas. Una de
#las más utilizadas es con la función c() que significa
#concatenar

c(1,2,3,4,5,6,7,8,9,10) #Vector del 1 al 10
c(1,4,9,10,26) #Vector de longitud 5

#La función c() sirve bastante cuando queremos un 
#orden específico de los elementos del vector, pero 
#podemos usar otras formas, como los dos puntos

1:10 #Vector del 1 al 10
25:30 #Vector del 25 al 30
100:120 #Vector del 100 al 120

#Los dos puntos sirven para generar sucesiones de manera
#continua. Otra forma es con la función seq()

seq(from = 1, to = 10) #Vectro del 1 al 10
seq(from = 25, to = 30) #Vector del 25 al 30
seq(from = 100, to = 120) #Vector del 100 al 120

#Otra alternativa es con la función rep(), que genera
#repeticiones de un vector que especifiquemos

rep(1,5) #Vector de longitud 5 con elementos repetidos
rep(1:3,5) #Vector repetido del 1 al 3 cinco veces
rep(c(1,5,10),3) #Vector que repite el 1, 5 y 10 tres veces

#Es posible emplear otro tipo de argumentos para obtener
#secuencias más específicas

rep(c(1,3,8), each = 2) #Vector que repirte cada elemento 
                        #dos veces

rep(c(1,3,8), times = 2) #Vector que repite el 1,3 y 8
                         #dos veces


#Los siguientes inputs generan el mismo output

rep(c(1,3,8), times = 2) #Argumento explícito
rep(c(1,3,8), 2) #Argumento implícito


#Extrayendo elementos de un vector----

#Podemos extraer elementos dentro de un vector, y para
#ello, podemos hacerlo sin guardar los datos en una
#variable o sin guardarlo.

#Para extraer elementos, se usan los corchetes sencillos
#los cuales son estos []

c(1,2,3,4,5)[1]

#El número en los corchetes es otro vector, que se le 
#puede nombrar como vector de posiciones, porque nos
#indica la posición del elemento que queremos extraer

c(1,2,3,4,5)[2]
c(1,2,3,4,5)[3]
c(1,2,3,4,5)[4]
c(1,2,3,4,5)[5]

#Podemos extraer más de un elemento. Vamos a extraer
#el número 1 al 3

c(1,2,3,4,5)[1:3]

#Vamos a extraer el número 1, 4 y 5 del vector anterior

c(1,2,3,4,5)[c(1,4,5)]

#Para realizar lo anterior, se debe usar la función
#de concatenar c() porque son posiciones diferentes y no
#son seguidas o continuas

c(1,2,3,4,5)[c(2,5)] #Extraer el elemento 2 y 5


#Poemos guardar el vector del 1 al 5 en una variable y 
#aplicar exactamente lo mismo, solo que ahora se usa el
#nombre de la variable

extr <- c(1,2,3,4,5)

#Se nombró la variable "extr" con los números del 1 al 5, 
#y para extraer elementos es lo mismo que lo anterior

extr[1]
extr[2]
extr[3]
extr[4]
extr[5]

#Y para extraer más de un elemento se realiza algo
#similar

extr[1:3]
extr[c(1,4,5)]
extr[c(2,5)]

#Resumiento: los números dentro de los corchetes son
#vectores, llamados de posición, ya que indican la 
#posición del elemento a extraer


#Creando data frames----

#Los data frames son estructuras de datos en dos
#dimensiones, tienen renglones y columnas. Para crearlos
#se emplea la función data.frame

data.frame("id_empl" = c(1,2,3,4,5), 
           "name_emp" = c("Ezequiel", "David", "Miranda",
                          "Michelle", "Guillermo"),
           "salary" = c(6000,7800,6900,6750,5580),
           "mascota" = c(TRUE, FALSE, TRUE, TRUE, FALSE))

#Lo anterior genera un data frame de cinco renglones y
#cinco columnas. Para comocer cuántas renglones y 
#columnas tiene, se usa la función dim(), pero antes,
#debemos guardar el data frame en un variable

df_emp <- data.frame("id_empl" = c(1,2,3,4,5), 
           "name_emp" = c("Ezequiel", "David", "Miranda",
                          "Michelle", "Guillermo"),
           "salary" = c(6000,7800,6900,6750,5580),
           "mascota" = c(TRUE, FALSE, TRUE, TRUE, FALSE))

#Las dimensiones del data frame son las siguientes

dim(df_emp) #Primer número renglones y segundo columnas

#Para contar los renglones y las columnas de forma
#individual, se usan nrow() y ncol(), respectivamente

nrow(df_emp) #Número de renglones
ncol(df_emp) #Número de columnas


#Extrayendo elementos de un data frame----

#Para ello, se pueden ocupar los corchetes sencillos [] o
#el símbolo de dólar o pesos $, pero cada uno funciona de
#manera diferente

df_emp[1] #Extraer la columna 1
df_emp[2] #Extraer la columna 2 
df_emp[4] #Extraer la columna 5

#Lo anterior genera otro data frame. Si queremos extraer 
#elementos únicos, se debe especificar el renglón y la
#columna

df_emp[1,1] #Primer renglón y primera columna
df_emp[2,2] #Segundo renglón y segunda columna
df_emp[3,3] #Tercer renglón y tercera columna
df_emp[1,4] #Primer renglón y cuarta columna
df_emp[5,4] #Quinto renglón y cuarta columna

#Si queremos extraer toda la columna, se usa comúnmente
#la siguiente sintaxis

df_emp[,1] #Columna 1
df_emp[,2] #Columna 2
df_emp[,3] #Columna 3

#Lo anterior genera un vector (no un data frame), el cual
#corresponde con la columna seleccionada. Ahora, si 
#buscamos todo un renglón con todas las columnas, se emplea
#la siguiente sintaxis

df_emp[1,] #Renglón 1
df_emp[2,] #Renglón 2
df_emp[3,] #Renglón 3

#Lo anterior NO genera un vector, sino que genera otro
#data frame.
#Para extraer toda la columna pero eliminando uno o varios
#renglones, tenemos

df_emp[-c(1),1] #Columna 1 sin renglón 1
df_emp[-c(2),2] #Columan 2 sin renglón 2
df_emp[-c(1,5),3] #Columna 3 sin renglones 1 y 5
df_emp[-c(1,3,5),4] #Columna 4 sin renglones 1, 3 y 5

#Lo anterior también genera un vector. Si queremos el caso
#contrario, donde ahora extraemos los renglones pero
#sin algunas columnas se usa lo siguiente

df_emp[1,-c(1)] #Renglón 1 sin columna 1
df_emp[2,-c(2)] #Renglón 2 sin columna 2
df_emp[3,-c(1,2)] #Renglón 3 sin columnas 1 y 2
df_emp[4,-c(1,3,5)] #renglón 4 sin columnas 1, 3, y 5


#Ahora, otra forma de extraer elementos de un data frame
#es con el singo $, solo que este se usa para extraer
#columnas únicamente

df_emp$id_empl
df_emp$name_emp
df_emp$salary
df_emp$mascota


#Añadiendo elementos a un data frame----

#Podemos añadir columnas o renglones a un data frame, y
#para ello se usan las funciones cbind() y rbind(), 
#respectivamente. Vamos a añadir otra columna al data frame
#anterior de tres formas distintas

#Usando el signo $ 

df_emp$Car <- c("CAMRY", "AVALON", "RAV4", "YARIS", "PRIUS")

#Usando los corchetes simples []

df_emp["Age"] <- c(25,28,26,24,25)

#Usando la función cbind

df_emp <- cbind(df_emp, "birth" = c("13-01-1997",
                                    "25-05-1994",
                                    "17-09-1996",
                                    "15-12-1998",
                                    "06-04-1997"))


#De esa forma, podemos añadir columnas nuevas a un
#data frame ya existente; ello se vuelve muy útil
#cuando trabajamos con datos más grandes, aunque, 
#podemos agregar renglones de dos formas

#Usando rbind
df_emp <- rbind(df_emp, c(6,"Ross",8800,TRUE,"BMW",26,
                          "02-11-1996"))

#Usando los corchetes simples

df_emp[nrow(df_emp) + 1,] <- c(7,"Sheldon", 6400,FALSE,
                               "Golf",27,"01-02-1995")

#Creando matrices----

#Las matrices son arreglos rectangulares de dos dimensiones,
#donde todos los elementos de una matriz deben ser
#obligatoriamente de la misma clase. Para crearla, se usa
#la función matrix()

matrix(data = 26:50, nrow = 5, ncol = 5)

#Lo anterior genera una matriz de 5x5 del 26 al 50. Además,
#podemos especificar el orden de los renglones

matrix(data = 26:50, nrow = 5, ncol = 5, byrow = TRUE)


#Extrayendo elementos de una matriz----

#Se aplicca la misma lógica que con los data frames, usando
#los corchetes simples. Se nombrará a la matriz "m1"

m1 <- matrix(data = c(1:12), nrow = 6, ncol = 2, byrow = T)

#Para extraer se hace lo siguiente

m1[1,1] #Renglón 1 y columna 1
m1[1,2] #Renglón 1 y columna 2
m1[6,1] #Renglón 6 y columna 1
m1[6,2] #Renglón 6 y columna 2



#Creando listas----

#Las listas permiten agrupar diferentes estructuras de
#datos, como vectores, data frames, matrices, etc. Para
#crearlas, se usa la función list()

list(c(1,2,3,4,5), "Mascota" = c(T,F,F,T,T),
     c("A","B","C","D","E","F","G"), df_emp,m1)

#En el input anterior, se enlistaron 3 vectores, un 
#data frame y una matriz, de longitudes y dimensiones 
#diferentes. La lista anterior se guardará en la variable
#llamada "arr1"

arr1 <- list(c(1,2,3,4,5),"Mascota" = c(T,F,F,T,T),
               c("A","B","C","D","E","F","G"), 
               df_emp,m1)

#Extrayendo elementos de una lista----

#Aquí se pueden usar corchetes simples, dobles o el signo
#de dolar $ (este último aplica si el elemento de la lista
#tiene un título)

arr1[1] #Primer elemento de la lista (vector numérico)
arr1[2] #Segundo elemento de la lista (vector lógico)
arr1[3] #Tercer elemento de la lista (vector caracter)
arr1[4] #Cuarto elemento de la lista (data frame)
arr1[5] #Quinto elemento de la lista (matriz)

#Los corchetes simples se usan para extraer los elementos
#de una lista, pero, si queremos acceder a los elementos
#de los elementos de la lista, se usan los corchetes dobles

arr1[[1]] #Elementos del primer elemento de la lista
arr1[[2]] #Elementos del segundo elemento de la lista
arr1[[3]] #Elementos del tercer elemento de la lista
arr1[[4]] #Elementos del cuarto elemento de la lista
arr1[[5]] #Elementos del quinto elemento de la lista

#Ahora ya tenemos acceso a los elementos de cada elemento
#guardado en la lista, pero, si queremos trabajar con 
#cada elemento individual, se usan corchetes simples en
#conjunto con los dobles

arr1[[1]][1] #Primer elemento del primero elemento de la lista
arr1[[1]][2] #Segundo elemento del primero elemento de la lista
arr1[[4]][2] #Segundo elemento del cuarto elemento de la lista

#Notar que al extraer los dataframes, obtenemos otro dataframe,
#entonces, ahora debemos trabajar como si tuvieramos un
#dataframe como sigue

arr1[[4]][2][3,1] #Tercer elemento de la columna 1 del dataframe

#Entonces, notar que la sintaxis de trabajar con listas
#depende del tipo de estructura de dato que tengamos, esto
#aplica igual para las matrices

arr1[[5]][5,2] #Renglón 5 y columna 2 de el elemento 5 de la
               #lista (matriz)




#FIN----
