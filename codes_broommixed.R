setwd("~/Documents/RLadies/Meetup_broom mixed")
data<-read.table("opiliao.csv", sep=",", header=T);
str(data)
attach(data)
View(data)


library(lme4)
fit<-glmer(desova~tratamento+ltamanho+ tratamento*ltamanho + (1|terrario), 
           family = binomial, data=data)

fit<-glmer(desova~tratamento+ltamanho+ tratamento*ltamanho + (1|terrario), 
           family = binomial, data=data, nAGQ=25)

summary(fit)

library(broom.mixed)

#tidy: ordenar
tidy(fit) 
tidy(fit,exponentiate=TRUE)
tidy(fit,effects="fixed")

#augment: agregar otras informaciones
augment(fit)
suppressWarnings(augment(fit, data)) #suprimir las advertencias sobre influence.merMod

#resumir: obtener otras informaciones relacionadas al ajuste del modelo
glance(fit)


