# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
#uvoziDruzine <- function() {
#  return(read.table("podatki/druzine.csv", sep = ";", as.is = TRUE,
#                      row.names = 1,
#                      col.names = c("obcina", "en", "dva", "tri", "stiri"),
#                      fileEncoding = "Windows-1250"))
#}

# Zapišimo podatke v razpredelnico druzine.
#cat("Uvažam podatke o družinah...\n")
#druzine <- uvoziDruzine()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.

uvoziNesrece <- function(){
  kat <- c("Skupaj", "Smrtni", "Poskodbe", "Skoda", "Udelezenci",
           "Mrtvi", "Huda", "Lahka", "Brez")
  leta <- 2011:2013
  return(read.table("podatki/nesreceurejeno.csv", sep = ";", as.is = TRUE, header = TRUE,
                    col.names = c("Regija",as.vector(outer(kat, leta, paste0))),
                    fileEncoding = "Windows-1250", row.names = 1))
}

cat("Uvažam podatke o nesrečah..\n")
nesrece <- uvoziNesrece()

#nesrece <- nesrece[-c(1), ]
#rownames(nesrece) <- paste(c("SLOVENIJA", "Pomurska", "Podravska", "Koroška", "Savinjska", "Zasavska", "Spodnjeposavska", "Jugovzhodna Slovenija", "Osrednjeslovenska", "Gorenjska", "Notranjsko-kraška", "Goriška", "Obalno-Kraška"), sep = " ")
#nesrece <- nesrece[ ,-c(1)]

