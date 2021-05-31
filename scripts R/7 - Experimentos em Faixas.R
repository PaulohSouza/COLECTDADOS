# Experimentos em Faixas
### Paulo H. N. SOUZA - COLECTDADOS
remove(list=ls()) #Apagar a memória do R

#Consultar planilha de dados
D1 <- read.csv2(file.choose(), dec = ".", sep = ";", header = T)

library(ExpDes.pt)
?ExpDes.pt
faixas(D1$Fator_A,D1$Fator_B,D1$Bloco,D1$Resp, quali = c(TRUE, TRUE), mcomp = "tukey", 
       fac.names = c("FA", "FB"), sigT = 0.05, sigF = 0.05)
