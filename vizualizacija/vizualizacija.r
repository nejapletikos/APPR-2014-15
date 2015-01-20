# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid slovenije...\n")
slo <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2/shp/SVN_adm.zip",
                       "slovenija", "SVN_adm1.shp", mapa = "zemljevid",
                       encoding = "Windows-1250")

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
preuredi <- function(podatki, zemljevid) {
  nove.slo <- c()
  manjkajo <- ! nove.slo %in% rownames(podatki)
  M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
  names(M) <- names(podatki)
  row.names(M) <- nove.slo[manjkajo]
  podatki <- rbind(podatki, M)
  out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$NAME_1)[rank(zemljevid$NAME_1)]), ]
  if (ncol(podatki) == 1) {
    out <- data.frame(out)
    names(out) <- names(podatki)
    rownames(out) <- rownames(podatki)
  }
  return(out)
}

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
rregije <- preuredi(nesrece[-1,], slo)

# Izračunamo povprečno velikost družine.
#druzine$povprecje <- apply(druzine[1:4], 1, function(x) sum(x*(1:4))/sum(x))
#min.povprecje <- min(druzine$povprecje, na.rm=TRUE)
#max.povprecje <- max(druzine$povprecje, na.rm=TRUE)

# Narišimo zemljevid v PDF.
#cat("Rišem zemljevid...\n")
#pdf("slike/povprecna_druzina.pdf", width=6, height=4)

cat("Rišem zemljevid slovenije...\n")
pdf("slike/slovenija1.pdf")

koordinate1 <- coordinates(slo)
imena1 <- rownames(rregije)

rownames(koordinate1) <- imena1
names(imena1) <- imena1
obalnokraska <- grep("Obalno", imena1)
notranjskokraska <- grep("Notranjsko", imena1)
koordinate1[obalnokraska,1] <- koordinate1[obalnokraska,1]+0.1 #levo,desno
koordinate1[obalnokraska,2] <- koordinate1[obalnokraska,2]+0.025 #dol,gor
koordinate1["Zasavska",2] <- koordinate1["Zasavska",2]+0.01
koordinate1["Spodnjeposavska",1] <- koordinate1["Spodnjeposavska",1]+0.05
koordinate1["Spodnjeposavska",2] <- koordinate1["Spodnjeposavska",2]+0.02
imena1["Jugovzhodna Slovenija"] <- "Jugovzhodna\nSlovenija"
imena1[notranjskokraska] <- "Notranjsko-\nkraška"
imena1[obalnokraska] <- "Obalno-\nkraška"

#n = 100
#barve = topo.colors(n)[1+(n-1)*(druzine$povprecje-min.povprecje)/(max.povprecje-min.povprecje)]
#plot(obcine, col = barve)

min.nesrece <- min(rregije[,1], na.rm=TRUE)
max.nesrece <- max(rregije[,1], na.rm=TRUE)
norm.nesrece <- (rregije[,1]-min.nesrece)/(max.nesrece-min.nesrece)

n <- 100
barve <- rgb(1, 1, (n:1)/n)
plot(slo, col = barve[unlist(1+(n-1)*norm.nesrece)], bg="lightblue")
title("Prometne nesreče v Sloveniji 2011")

k <- 5 # število vnosov v legendi
lestvica <- seq(min.nesrece, max.nesrece, (max.nesrece-min.nesrece)/(k-1))
legend("bottomright", legend = round(lestvica),
       fill = barve[seq(1, n, (n-1)/(k-1))], bg = "white")

text(koordinate1, imena1, cex = 0.5)

dev.off()

