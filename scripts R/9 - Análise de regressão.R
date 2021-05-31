# Análise de Regressão
### Paulo H. N. SOUZA - COLECTDADOS
remove(list=ls()) #Apagar a memória do R

#Consultar planilha de dados
D1 <- read.csv2(file.choose(), dec = ".", sep = ";", header = T)
#Ativar o pacote
library(ExpDes.pt)
#Abrir manual do pacote
?ExpDes.pt
#Copiar a linha de comando e substituir valores
dbc(D1$trat,D1$Bloco,D1$Prod, quali = FALSE)
