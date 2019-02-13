
# Loading the Dataset Bank-Full.csv from current working directory.
library(ggplot2)
data2 <- read.csv("bank-full.csv",header = T,sep = ";")
View(data2)

# Loading the Dataset Bank-Full-additional.csv from current working directory.
data2.1 <- read.csv("~/GU_R Lab Data/Datasets/Data incubator challenge/bank-additional-full.csv",header = T,sep = ";")
View(data2.1)

# Basic Exploratory data analysis of the loaded Datasets.
head(data2)
str(data2)
str(data2.1)
summary(data2[,c(2:5,7:9,11,16,17)])
summary(data2.1[,c(2:10,15,21)])

# Pairs Plot between the variables of the dataset.
pairs(data2[,-c(2:5,7:9,11,16,17)],upper.panel = NULL)        
pairs(data2.1[,-c(2:10,15,21)],upper.panel = NULL)  

# Boxplot between Acceptance or Rejection of Term Deposit vs consumer Price Index
boxplot(data2.1$cons.price.idx ~ data2.1$y, data = data2.1)

theme_set(theme_bw())
# violin plot between Acceptance or Rejection of Term Deposit vs consumer Price Index
g <- ggplot(data2.1, aes(y, cons.price.idx))
g + geom_violin() +
  labs(title="Violin plot",
       subtitle="Acceptance or Rejection of Term Deposit vs consumer Price Index",
       caption="Source: https://archive.ics.uci.edu/ml/machine-learning-databases/00222/",
       x="consumer Price Index",
       y="Acceptance or Rejection of Term Deposit")


#library(beanplot)

# violin plot between Acceptance or Rejection of Term Deposit vs consumer Confidence Index
beanplot(data2.1$cons.conf.idx, main = "beanplot",
         col = c("#CAB2D6", "#33A02C"), border = "#CAB2D6")

g <- ggplot(data2.1, aes(y, cons.conf.idx))
g + geom_violin() +
  labs(title="Violin plot",
       subtitle="Acceptance or Rejection of Term Deposit vs consumer Confidence Index",
       caption="Source: https://archive.ics.uci.edu/ml/machine-learning-databases/00222/",
       x="consumer Confidence Index",
       y="Acceptance or Rejection of Term Deposit")
