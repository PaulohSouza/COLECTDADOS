#------------------------------#
#Paulo Henrique N Souza
#Dados Teste COLETDADOS
#------------------------------#

#Analise Dados 
library(ggplot)
install.packages("doBy")
if (!require("pacman")) install.packages("pacman")
pacman::p_load(readr, dplyr, tibble, ggplot2, car, agricolae)
if(!require("outliers")) install.packages("outliers")
library("outliers")
if(!require("ExpDes.pt"))install.packages("ExpDes.pt")
library(ExpDes.pt)
library(doBy)
library(easyanova)
library(agricolae)
library(tidyverse)
install.packages("car")

dados <- read.csv2(file.choose(), dec = ".", sep = ";", header = T)

dados

library(car)
#Homogeneidade de Variancia
leveneTest(PMS ~ factor(TRAT), data=dados)   #Se P > 0,05 nao rejeita hipotese de variancia normal
bartlett.test(PMS~ factor(TRAT), data=dados) #Se p > 0,05 nao rejeita hipotese de variancia normal

#Anova  #Para Dados Balanceados
anova <-  aov(PMS ~ TRAT + BLOCO, data=dados)   
summary(anova)

#Anova #Para dados nao balanceados
anovades <- lm(PMSTrans ~ TRAT + BLOCO, data = dados2)
summary(anovades)
anova(anovades)

#Analise dos residuos
res <- residuals(anova)
shapiro.test(res)   #Se P > 0,05 nao rejeita hipotese normalidade dos dados


# Teste Tukey pacote Agricolae
library("agricolae")
with(dados,dbc(TRAT, BLOCO,PMS, mcomp="tukey"))

#Teste Tukey EasyAnova para dados desbalanceados
library("easyanova")
saida<- ea1(dados, design=2, alpha = 0.05, list=TRUE,  p.adjust=1, plot=1)
print(saida)

#Utras opcoes de Testes
require(ExpDes)
require(doBy)
with(dados, crd(treat=TRAT, resp=PMS, mcomp="tukey"))   # Tukey (tradicional)
with(dados, crd(treat=TRAT, resp=PMS, mcomp="duncan"))  # Duncan (tradicional)
with(dados, crd(treat=TRAT, resp=PMS, mcomp="snk"))     # Student-Newman-Keuls
with(dados, crd(treat=TRAT, resp=PMS, mcomp="lsd"))     # t-Student (LSD)
with(dados, crd(treat=TRAT, resp=PMS, mcomp="lsdb"))    # t-Student / Bonferroni
with(dados, crd(treat=TRAT, resp=PMS, mcomp="sk"))      # Scott-Knott (sem ambiguidades) - sob balanceamento
dados


#GraficoTukey
anova <-  aov(PMS ~ TRAT + BLOCO, data=dados)

tukey <- HSD.test(anova, "TRAT")

tukey

tukey$groups %>% 
  rownames_to_column(var = "trt") %>% 
  ggplot(aes(trt, PMS)) +
  geom_col(alpha = 0.8, color = "black") +
  geom_text(aes(label = groups), vjust = 1.8, size = 5, color = "white") +
  labs(x = "Tratamentos", y = "AACP Cercospora") +
  theme_bw(14) +
  ggtitle("Projeto Arranque - Petrovina - TMG 8372") + 
  theme_classic() +
  theme(axis.title.x = element_text(size = 12, face ="bold"), axis.title.y = element_text(size = 12, face ="bold"), plot.title = element_text(size = 12, hjust = 0.5, face="bold"))


#BoxPlot - Modelo 1
boxplot(dados$PMS ~ dados$TRAT, main = "Projeto Arranque - Petrovina TMG8372", xlab = "Tratamentos", ylab = "AACP Cercospora", col = 'white', pch = 12)

dados

#BoxPlot - Modelo Colorido

library("ggplot2")
ggplot(dados, aes(x=dados$TRAT, y=dados$PMS))+
  geom_boxplot() + 
  ggtitle('AACP Cercospora - Projeto Arranque - Petrovina - TMG8372') + 
  xlab("Tratamentos") +
  ylab("AACP Cercospora") +
  theme(plot.title = element_text(hjust = 0.5))

dados
#Gráfico relação

ggplot(dados, aes(PMS, DESFOLHA, color = factor(TRAT), size = PRODT)) +
  geom_point() + xlab("AACP Cercospora") + ylab("Desfolha (%)") + labs(title = "AACP Cercospora x Desfolha x Produtividade") +
  theme(plot.title = element_text(hjust = 0.5))

boxcox(PMS ~ BLOCO+TRAT, data=dados, plotit=T)
boxcox(PMS ~ BLOCO+TRAT, data=dados, lam=seq(-1, 1, 1/10))


dados

