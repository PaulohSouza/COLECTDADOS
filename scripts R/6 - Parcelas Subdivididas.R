# Parcelas Subdivididas em DIC
### Paulo H. N. SOUZA - COLECTDADOS
remove(list=ls()) #Apagar a memória do R

#Consultar planilha de dados
arquivo <- read.csv2(file.choose(), dec = ".", sep = ";", header = T)

D1=read.table("DadosPSubDic.txt",head=TRUE)
library(ExpDes.pt)
?ExpDes.pt
psub2.dic(D1$Fator_A,D1$Fator_B,D1$Rep,D1$Prod, quali = c(TRUE, TRUE), mcomp = "tukey", 
          fac.names = c("F1", "F2"), sigT = 0.05, sigF = 0.05)

#Parcela Subdividida em DBC
D2=read.table("DadosPSubDBC.txt",head=TRUE)
psub2.dbc(D2$Fator_A,D2$Fator_B,D2$Bloco,D2$Resp, quali = c(TRUE, TRUE), mcomp = "tukey", 
          fac.names = c("F1", "F2"), sigT = 0.05, sigF = 0.05)
