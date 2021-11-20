library(readxl)

enem_db <- read_excel("/home/ruifernandees/Development/AT1-PEE/enem_db.xlsx")

nota_enem_quartil <- quantile(enem_db$NOTA_ENEN, na.rm = TRUE)

nota.cut <- cut(enem_db$NOTA_ENEN,
                breaks=nota_enem_quartil,
                include.lowest = TRUE)

myTable <- table(enem_db$TP_SEXO, nota.cut)

barplot(myTable,
        ylab="Freq. sexo", 
        xlab="Quartis", 
        main="Notas x Sexo",
        ylim=c(0, 12000),
        legend=TRUE,
        beside=TRUE)
