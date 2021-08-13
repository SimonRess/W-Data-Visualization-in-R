leben<-read.csv2("lebenBund.csv",
                 sep=";", header=TRUE)

library(ggplot2)

values <- function(x,...){
  quantile(x)[c(2:4)]
}

ggplot(data=leben[leben$Land=="Sachsen",], aes(x=Land, y=Lebenserwartung)) + 
  geom_boxplot() + 
  ylim(80.0,83.0) + 
  stat_summary(fun=values, colour="black", geom="text", hjust=-7, aes(label=round(..y.., digits=1)))
