# Teste Qui-Quadrado
remove(list=ls())
library(multcompView)
?multcompView
#Teste Qui-Quadrado de Aderência
x=c(24,45,31)
chisq.test(x,p=c(0.25,0.50,0.25))

#Teste aderência 2
y=c(32,23,40,55,57,207)
chisq.test(y)

#Teste Qui-Quadrado de Independência
fec=c(515,506,58,205)
infec=c(1287,665,70,93)
mat=cbind(fec,infec)
mat
chisq.test(mat)



