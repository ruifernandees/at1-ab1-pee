library(readxl)

enem_db <- read_excel("/home/ruifernandees/Development/AT1-PEE/enem_db.xlsx")

notas <- enem_db$NOTA_ENEN

h = hist(notas, 
         ylab="Frequencias absolutas",
         xlab="Notas do ENEM",
         main="Histograma", 
         ylim=c(0, 9000),
         col="orange")
