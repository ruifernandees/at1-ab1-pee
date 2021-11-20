library(readxl)

enem_db <- read_excel("/home/ruifernandees/Development/AT1-PEE/enem_db.xlsx")

nota_enem_quartil <- quantile(enem_db$NOTA_ENEN, na.rm = TRUE)

nota.cut <- cut(enem_db$NOTA_ENEN,
                breaks=nota_enem_quartil,
                include.lowest = TRUE)

idades <- enem_db$NU_IDADE

idade.cut <- cut(idades,
                 breaks = c(min(idades), 16, 18, 24, 79), 
                 include.lowest = TRUE)

myTable <- table(idade.cut, nota.cut)

barplot(myTable,
        ylab="Freq. idade", 
        col=c("blue", "red", "yellow", "green"),
        xlab="Notas do ENEM", 
        main="Notas x Idade",
        legend=TRUE,
        beside=TRUE)
