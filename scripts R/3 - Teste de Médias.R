
### TESTE DE MEDIAS ###

### Paulo H. N. SOUZA - COLECTDADOS
remove(list=ls()) #Apagar a memória do R

#Consultar planilha de dados
arquivo <- read.csv2(file.choose(), dec = ".", sep = ";", header = T)

#Criar um objeto
D1=read.table("DICTrat.txt",head=TRUE)

#Ativar o pacote
library(ExpDes.pt)

#Abrir o menual do pacote
?ExpDes.pt

#Teste LSD
dic(D1$Trat,D1$UFC.s,mcomp="lsd")

#Teste Tukey
dic(D1$Trat,D1$UFC.s,mcomp="tukey")

#Teste Duncan
dic(D1$Trat,D1$UFC.s,mcomp="duncan")

#Teste de Scott-Knott
dic(D1$Trat,D1$UFC.s,mcomp="sk")




