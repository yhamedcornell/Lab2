#Lab2
library(tidyverse)
install.packages("reshape")
library(reshape)
library(reshape2)
#Loading data
lab2 <- read.csv("~/R/Biostat1/Labs/lab2.csv")
lab2.2 <- melt(lab2,id="patient_id")
lab2.3<-lab2.2 %>% 
  group_by(lab2.2$variable)
  
lab2_base_sport<-lab2.2 %>% 
  filter(lab2.2$variable=="base_sport")
lab2_base_pain<-lab2.2 %>% 
  filter(lab2.2$variable=="base_pain")
lab2_base_qol<-lab2.2 %>% 
  filter(lab2.2$variable=="base_qol")
lab2_first_sport<-lab2.2 %>% 
  filter(lab2.2$variable=="first_sport")
lab2_first_pain<-lab2.2 %>% 
  filter(lab2.2$variable=="first_pain")
lab2_first_qol<-lab2.2 %>% 
  filter(lab2.2$variable=="first_qol")
lab2_second_sport<-lab2.2 %>% 
  filter(lab2.2$variable=="second_sport")
lab2_second_qol<-lab2.2 %>% 
  filter(lab2.2$variable=="second_qol")
lab2_second_pain<-lab2.2 %>% 
  filter(lab2.2$variable=="second_pain")

d=data.frame(variable=c("base_sport","base_pain","base_qol","first_sport","first_pain","first_qol",
                     "second_sport","second_qol","second_pain"), 
             mean=c(mean(lab2_base_sport$value),mean(lab2_base_pain$value),mean(lab2_base_qol$value),
                    mean(lab2_first_sport$value),mean(lab2_first_pain$value),mean(lab2_first_qol$value),
                    mean(lab2_second_sport$value),mean(lab2_second_qol$value),mean(lab2_second_pain$value)),
             lower=c(range(lab2_base_sport$value)[1],range(lab2_base_pain$value)[1],range(lab2_base_qol$value)[1],
                     range(lab2_first_sport$value)[1],range(lab2_first_pain$value)[1],range(lab2_first_qol$value)[1],
                     range(lab2_second_sport$value)[1],range(lab2_second_qol$value)[1],range(lab2_second_pain$value)[1]),
             upper=c(range(lab2_base_sport$value)[2],range(lab2_base_pain$value)[2],range(lab2_base_qol$value)[2],
                     range(lab2_first_sport$value)[2],range(lab2_first_pain$value)[2],range(lab2_first_qol$value)[2],
                     range(lab2_second_sport$value)[2],range(lab2_second_qol$value)[2],range(lab2_second_pain$value)[2]))

ggplot() + 
  geom_errorbar(data=d, mapping=aes(x=variable, ymin=upper, ymax=lower), width=0.2, size=1, color="blue") + 
  geom_point(data=d, mapping=aes(x=variable, y=mean), size=4, shape=21, fill="white")+

