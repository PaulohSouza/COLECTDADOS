### Paulo H. N. SOUZA - COLECTDADOS
### Experimento em DIC ###

remove(list=ls()) #Apagar a memória do R

#Consultar planilha de dados
arquivo <- read.csv2(file.choose(), dec = ".", sep = ";", header = T)

D1=read.table("DBC.txt",head=TRUE) #Para criar objeto

library(easyanova) #Para ativar o pacote

?easyanova #para abrir o manual do pacote

ea1(D1[,c(1,2,3)],design=2,plot=3) #Realizar as análises estatísticas (Coluna 3) 

ea1(D1[,c(1,2,4)],design=2,plot=3) #Realizar as análises estatísticas (Coluna 4) 

ea1(D1[,c(1,2,5)],design=2,plot=3) #Realizar as análises estatísticas (Coluna 5) 

ea1(D1[,c(1,2,6)],design=2,plot=3) #Realizar as análises estatísticas (Coluna 6)

#Fim
