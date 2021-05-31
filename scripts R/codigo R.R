#------------------------------#
#Paulo Henrique N Souza

#------------------------------#

library(ggplot)
library(outliers)
library(Rmisc)  
library(easyanova)
library(agricolae)
library(tidyverse)
library(ggplot2)
library(car)
library(tidyverse)


setwd("C:/R/")

dados <- read.csv2(file.choose(), dec = ",", sep = ";", header = T)

# 1 -Abre Arquivo de Dados
arquivo <- read.csv2("AV. PROJETO PROTEÇÃO SERRA DA PETROVINA_TMG8372.csv", dec = ",", sep = ";", header = T)
print(arquivo)
arquivo

dados <- data.frame(trat = arquivo$TRAT, bloco = arquivo$BLOCO, varAnalisada = arquivo$PRODT)
eixo_X <- "Tratamentos"
titulo <- "AV. PROJETO PROTEÇÃO - BÔNUS"
eixo_y <- "AACP Ferrugem"
dados

  
escala_ymax <- 1000
escala_ymin <- 50

#-_____________________________________________________#
#####ANOVA PARA DADOS BALANECADOS---################
library(agricolae)
aov <-  aov(varAnalisada ~ trat + bloco, data=dados)
summary(aov)
tukey <- HSD.test(aov, "trat")
tukey



#-_____________________________________________________#
#Gráfico de Barras para 7 Variaveis

#tiff("Produtividade_Barra_de_Medias.tiff", units="in", width=5, height=3, res=300)
offset.v = -2     # offsets for mean letters
offset.h = 0.5

ggplot(DB, aes(x = trat, y = varAnalisada,
               ymax=120, ymin=20))  +
  geom_bar(stat="identity", fill="gray50",
           colour = "black", width = 0.7)  +
  geom_errorbar(aes(ymax=varAnalisada+sd, ymin=varAnalisada-sd),
                width=0.0, size=0.5, color="black")  +
  geom_text(aes(label= c(tukey$groups$groups[1], tukey$groups$groups[2], tukey$groups$groups[3], tukey$groups$groups[4], tukey$groups$groups[5], tukey$groups$groups[6], tukey$groups$groups[7]),
                hjust=offset.h, vjust=offset.v), size = 4) +             
  labs(title= titulo, x = eixo_X,
       y = eixo_y)  +
  
  ## ggtitle("Main title") +
  theme_bw(base_size=12)  +
  theme(panel.grid.major.y = element_line(colour = "grey80"), text = element_text(size=12),
        plot.title = element_text(size = rel(0.6),
                                  face = "bold", vjust = 0.3, hjust = 0.6),
        axis.title = element_text(face = "bold"),
        axis.title.y = element_text(vjust= 3, size = rel(0.8)),
        axis.title.x = element_text(vjust= -3, size = rel(0.8)),
        panel.border = element_rect(colour="black"), panel.grid.minor = element_blank(), panel.grid.major.x = element_blank()
  )
dev.off()



  #-_____________________________________________________#
tiff("Produtividade_BloxPlot.tiff", units="in", width=5, height=3.5, res=300)
  #BloxPlot - Modelo 1
  boxplot(dados$varAnalisada ~ dados$trat, main = titulo, cex.main = 0.8, cex.lab = 0.8, xlab = "Tratamentos", ylab = eixo_y, col = 'white', pch = 1  +
    ylim(escala_ymin, escala_ymax), cex.axis =0.8)
 dev.off()  


  #-_____________________________________________________#
  #Grafico_De_Correlação
  
#  ggplot(dados, aes(varAna, dados$PMS, color = factor(TRAT), size = dados$PRODT)) +
#    scale_x_continuous(eixo_X, limits = c(10,60),
#                       expand = c(0, 5)) +
#    scale_y_continuous("MMG (g)", labels = function(MMG) paste0("", MMG),
#                       limits = c(80, 140)) + 
#    scale_size_continuous(expression(Produtividade~kg~ha^{-1}), 
#                          labels = function(Produtividade) round(Produtividade)) + 
#    theme_bw(base_size=18) +
#    geom_point() + labs(title = "CD 202") +
#    theme(plot.title = element_text(hjust = 0.5), )
  
  
  
 #-_____________________________________________________#
 #####ANOVA PARA DADOS BALANECADOS---################
 
 aov <- lm(varAnalisada ~ trat + bloco, data = dados)
 anova(aov)
 
 
 
 #-_____________________________________________________#
 #Homogeneidade de Variancia
 library(car)
 leveneTest(varAnalisada ~ factor(trat), data=dados)            #Se P > 0,05 nao rejeita hipotese de variancia normal
 bartlett.test(varAnalisada ~ factor(trat), data=dados)  #Se p > 0,05 nao rejeita hipotese de variancia normal
 
 
 #-_____________________________________________________#
 #Analise dos residuos
 
 res <- residuals(aov)
 shapiro.test(res)   #Se P > 0,05 nao rejeita hipotese normalidade dos dados
 
 
  
  
  
  
  
  
  
  
  
  
  
  
  

