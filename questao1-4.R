library(readxl)

enem_db <- read_excel("/home/ruifernandees/Development/AT1-PEE/enem_db.xlsx")

nota_redação_quartil <- quantile(enem_db$NU_NOTA_REDACAO, na.rm = TRUE)

nota.cut <- cut(enem_db$NU_NOTA_REDACAO,
                breaks=nota_redação_quartil,
                include.lowest = TRUE)

myTable <- table(enem_db$TP_ESCOLA, nota.cut)

barplot(myTable,
        ylab="Quantidade de alunos", 
        xlab="Nota da redação", 
        main="Redação x Rede de ensino",
        legend=TRUE,
        beside=TRUE)