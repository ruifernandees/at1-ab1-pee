# Boxplot
#   Fa
#   Fr
#   Fac
#   Frac

# cumsum (F ac)
library(readxl)

enem_db <- read_excel("/home/ruifernandees/Development/AT1-PEE/enem_db.xlsx")
View(enem_db)
View(nrow(enem_db))

nota_enem_quartil <- quantile(enem_db$NOTA_ENEN, na.rm = TRUE)
View(nota_enem_quartil)

Freq <- table(cut(enem_db$NOTA_ENEN, breaks = nota_enem_quartil, right=FALSE))
FreqAc <- cumsum(Freq)
FreqRel <- prop.table(Freq)
FreqRelAc <- cumsum(FreqRel)

View(FreqRelAc)
View(FreqAc)

TabResul <- cbind(Freq, FreqAc,
                  FreqRel = round(FreqRel*100, digits = 2),
                  FreqRelAc = round(FreqRelAc*100, digits = 2))
TabResul
boxplot(enem_db$NOTA_ENEN, col="blue", main="Boxplot - Notas do ENEM 2019")
