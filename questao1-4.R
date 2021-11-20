library(readxl)

enem_db <- read_excel("/home/ruifernandees/Development/AT1-PEE/enem_db.xlsx")

myTable <- table(enem_db$TP_SEXO, enem_db$TP_LINGUA)

barplot(myTable,
        ylab="Freq. sexo", 
        xlab="Línguas estrangeiras", 
        main="Línguas estrangeiras x Sexo",
        legend=TRUE,
        beside=TRUE)
