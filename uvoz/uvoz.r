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
  return(read.table("podatki/nesreceurejeno.csv", sep = ";", as.is = TRUE,
                    col.names = c("Regija","Prometne nesreče - SKUPAJ(2011)", "Prometne nesreče s smrtnim izidom(2011)",
                                  "Prometne nesreče s telesno poškodbo(2011)", "Prometne nesreče z materialno škodo(2011)",
                                  "Število udeležencev - SKUPAJ(2011)","Število udeležencev - mrtvi(2011)",
                                  "Število udeležencev s hudo telesno poškodbo(2011)", "Število udeležencev z lahko telesno poškodbo(2011)",
                                  "Število udeležencev brez poškodbe(2011)",
                                  "Prometne nesreče - SKUPAJ(2012)", "Prometne nesreče s smrtnim izidom(2012)",
                                  "Prometne nesreče s telesno poškodbo(2012)", "Prometne nesreče z materialno škodo(2012)",
                                  "Število udeležencev - SKUPAJ(2012)","Število udeležencev - mrtvi(2012)",
                                  "Število udeležencev s hudo telesno poškodbo(2012)", "Število udeležencev z lahko telesno poškodbo(2012)",
                                  "Število udeležencev brez poškodbe(2012)",
                                  "Prometne nesreče - SKUPAJ(2013)", "Prometne nesreče s smrtnim izidom(2013)",
                                  "Prometne nesreče s telesno poškodbo(2013)", "Prometne nesreče z materialno škodo(2013)",
                                  "Število udeležencev - SKUPAJ(2013)","Število udeležencev - mrtvi(2013)",
                                  "Število udeležencev s hudo telesno poškodbo(2013)", "Število udeležencev z lahko telesno poškodbo(2013)",
                                  "Število udeležencev brez poškodbe(2013)"),
                    fileEncoding = "Windows-1250"))
}

cat("Uvažam podatke o nesrečah..\n")
nesrece <- uvoziNesrece()