
## Experimento em Análise Conjunta

#Limpar a memória do R
remove(list=ls())
#Indicar a pasta com dados
setwd("C:/Users/VICTOR/Desktop/Faixas Conjunta")
#Criar objeto
D1=read.table("AnaliseConjunta.txt",head=TRUE)
#Ativar o pacote
library(AnaliseConjunta)
#Abrir o manual do pacote
?AnaliseConjunta
#Analise
AnaliseConjuntaDBC(D1)
