## Contrastes Ortogonais ##
### Paulo H. N. SOUZA - COLECTDADOS
remove(list=ls()) #Apagar a memória do R

#Consultar planilha de dados
arquivo <- read.csv2(file.choose(), dec = ".", sep = ";", header = T)

D1=read.table("DicTM.txt",head=TRUE)
library(ExpDes.pt)
?ExpDes.pt
dic(D1$Raçoes,D1$GP,mcomp="lsd")

source("RotinaContrastesOrtogonais.txt")
Med=c(11.75,22.75,24.25,30.00,5.00)
rep=c(4,4,4,4,4)
Glres=15
QMres=9.48
Y1=c(4,-1,-1,-1,-1)
Y2=c(0,1,1,-1,-1)
Y3=c(0,1,-1,0,0)
Y4=c(0,0,0,1,-1)
Mat=cbind(Y1,Y2,Y3,Y4)
Mat
ContrastesOrtogonais(Med,rep,Glres,QMres,Mat)




