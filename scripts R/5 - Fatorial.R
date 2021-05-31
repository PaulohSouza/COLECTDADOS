# Fatorial em DIC
### Paulo H. N. SOUZA - COLECTDADOS
remove(list=ls()) #Apagar a memória do R

#Consultar planilha de dados
arquivo <- read.csv2(file.choose(), dec = ".", sep = ";", header = T)
D1=read.table("DIC_Fat.txt",head=TRUE)
library(ExpDes.pt)
?ExpDes.pt
fat2.dic(D1$FA,D1$FB,D1$VarResp, quali = c(TRUE, TRUE), mcomp = "tukey", 
         fac.names = c("variedades", "adubação"), sigT = 0.05, sigF = 0.05)

# Fatorial com 1 testemunha adicional
D2=read.table("DIC_Fat1ad.txt",head=TRUE)
library(fatorial.ad)
?fatorial.ad
fatorial2.ad.dic(D2)

#Fatorial com 2 testemunhas
D3=read.table("DIC_Fat2ad.txt",head=TRUE)
fatorial2.ad.dic(D3)

#Fatorial em DBC
D4=read.table("DadosFatDBC.txt",head=TRUE)
library(ExpDes.pt)
?ExpDes.pt
fat2.dbc(D4$Fator_A,D4$Fator_B,D4$Bloco,D4$Resp, quali = c(TRUE, TRUE), mcomp = "tukey", 
         fac.names = c("FA", "FB"), sigT = 0.05, sigF = 0.05)


#Fatorial em DBC com testemunha adicional
D5=read.table("DadosFatDBC adicional.txt",head=TRUE)
library(fatorial.ad)
?fatorial.ad
fatorial2.ad.dbc(D5)










