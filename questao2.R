library(readxl)

enem_db <- read_excel("/home/ruifernandees/Development/AT1-PEE/enem_db.xlsx")

myTable <- table(enem_db$NO_MUNICIPIO_RESIDENCIA == "Boca da Mata")

enem_bm <- enem_db[enem_db$NO_MUNICIPIO_PROVA == "Boca da Mata", ]

table(enem_bm$NO_MUNICIPIO_RESIDENCIA)

labs<-paste(c("Anadia = ", "Boca da Mata = ", "Limoeiro de Anadia = ", "Maceió = ", "Maribondo = ", "Taquarana = "),
            round(table(enem_bm$NO_MUNICIPIO_RESIDENCIA)/length(enem_bm$NO_MUNICIPIO_RESIDENCIA) * 100, 
                  digits=2), "%")

pie(table(enem_bm$NO_MUNICIPIO_RESIDENCIA), labels=labs)

nota_enem_quartil <- quantile(enem_bm$NOTA_ENEN, na.rm = TRUE)

nota.cut <- cut(enem_bm$NOTA_ENEN,
                breaks=nota_enem_quartil,
                include.lowest = TRUE)

idades <- enem_bm$NU_IDADE

idade.cut <- cut(idades,
                 breaks = c(min(idades), 16, 18, 24, max(idades)), 
                 include.lowest = TRUE)

myTable <- table(idade.cut, nota.cut)

barplot(myTable,
        ylab="Freq. idade", 
        col=c("blue", "red", "yellow", "green"),
        xlab="Notas da Redação", 
        main="Notas da Redação x Idade (Boca da Mata)",
        legend=TRUE,
        beside=TRUE)
    
