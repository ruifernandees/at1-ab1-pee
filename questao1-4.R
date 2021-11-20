library(readxl)
enem_db <- read_excel("/home/ruifernandees/Development/AT1-PEE/enem_db.xlsx")

myTable <- table(enem_db$TP_COR_RACA, enem_db$TP_ESCOLA)

barplot(myTable, col=c("yellow","white", "chocolate1", "grey", "burlywood4", "azure4"),
        ylab="Quantidade de pessoas", 
        xlab="Rede de ensino", 
        main="Raça x Rede de ensino",
        legend=TRUE,
        beside=TRUE)