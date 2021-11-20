library(readxl)

enem_db <- read_excel("/home/ruifernandees/Development/AT1-PEE/enem_db.xlsx")

nota_enem_quartil <- quantile(enem_db$NOTA_ENEN, na.rm = TRUE)

Freq <- table(cut(enem_db$NOTA_ENEN, breaks = nota_enem_quartil, right=FALSE))
FreqAc <- cumsum(Freq)
FreqRel <- prop.table(Freq)
FreqRelAc <- cumsum(FreqRel)

TabResul <- cbind(Freq, FreqAc,
                  FreqRel = round(FreqRel*100, digits = 2),
                  FreqRelAc = round(FreqRelAc*100, digits = 2))
View(TabResul)
boxplot(enem_db$NOTA_ENEN, col="blue", main="Boxplot - Notas do ENEM 2019")
