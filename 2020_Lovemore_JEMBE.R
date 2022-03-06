##Analysis associated with Lovemore et. al 2020. JEMBE

###upload dataset
df1 <-read.csv("treatment.csv", header = TRUE)

#Run logit regression model 1 - events 
fm1 <- glm(Events1~Treatment,family="binomial",data=df1)

## Use car package to get Wald test
library(car)
Anova(fm1) 


## predicted probabilities and confidence limits as shown in Figure 4
## post-hoc tests 

library(emmeans)
emmeans(fm1, ~Treatment, type="response")  ## Predicted probabilities and CI's

## This gives results of Tukey's HSD tests
emmeans(fm1, pairwise~Treatment) 

###################

#Run logit regression model 2 - attempts 
fm2 <- glm(Attempts2~Treatment,family="binomial",data=df1)

## Use car package to get Wald test
library(car)
Anova(fm2) 


## predicted probabilities and confidence limits as shown in Figure 4
## post-hoc tests 

library(emmeans)
emmeans(fm2, ~Treatment, type="response")  ## Predicted probabilities and CI's

## This gives results of Tukey's HSD tests
emmeans(fm2, pairwise~Treatment) 

