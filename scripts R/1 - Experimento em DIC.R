### Paulo H. N. SOUZA - COLECTDADOS
### Experimento em DIC ###

remove(list=ls()) #Apagar a memória do R

#Consultar planilha de dados
arquivo <- read.csv2(file.choose(), dec = ".", sep = ";", header = T)

D1=read.table("DIC.txt",head=TRUE) #Para criar um objeto
library(easyanova) #Ativar o pacote utilizado na análise

?easyanova #Abrir o manual do pacote

ea1(D1[,c(1,2)],design=1,plot=3)#Análise estatística para a largura das folhas (coluna 2)

ea1(D1[,c(1,3)],design=1,plot=3)#Análise estatística para o comprimento das folhas (coluna 3)
