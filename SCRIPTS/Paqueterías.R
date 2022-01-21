#Lista de paqueterías instaladas----

installed.packages() #Toda la información de instalación
colnames(installed.packages()) #Dependencias, paqueterías, etc
row.names(installed.packages()) #Todas las paqueterías

#Verificar instalaciín de paquetería----

paq <- row.names(installed.packages())
paq[grep("cesar", paq)] #Obtiene el nombre de la paquetería

#Verificar e instalar----

if ((is.na(paq[grep("readxl", paq)][1]) == TRUE)) {
  install.packages("readxl")
  } else {
    "Paquetería instalada"
}


#FIN----

