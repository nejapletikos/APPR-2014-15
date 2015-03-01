# 4. faza: Analiza podatkov

# Uvoz štirih novih tabel: prometne nesreče po lokaciji, po vrsti ceste, po vrsti udeležencev in alkoholiziranosti.

leta1 <- 2003:2013

#prva
uvoziLokacija <- function(){
  return(read.table("podatki/polokaciji.csv", sep = ";", as.is = TRUE, header = TRUE,
                    col.names = c("Leta",as.vector(outer("Leto ",leta1, paste0))),
                    fileEncoding = "Windows-1250", row.names = 1))
}
  
cat("Uvažam podatke o nesrečah po lokaciji..\n")  
polokaciji <- uvoziLokacija()

#druga
uvoziCesta <- function(){
  return(read.table("podatki/vrstaceste.csv", sep = ";", as.is = TRUE, header = TRUE,
                    col.names = c("Leta",as.vector(outer("Leto ",leta1, paste0))),
                    fileEncoding = "Windows-1250", row.names = 1))
}

cat("Uvažam podatke o nesrečah po vrsti ceste..\n")
povrsticeste <- uvoziCesta()

#tretja
uvoziUdelezenci <- function(){
  return(read.table("podatki/vrstaudelezencev.csv", sep = ";", as.is = TRUE, header = TRUE,
                    col.names = c("Leta",as.vector(outer("Leto ",leta1, paste0))),
                    fileEncoding = "Windows-1250", row.names = 1))
}

cat("Uvažam podatke o nesrečah po vrsti udeležencev..\n")
poudelezencih <- uvoziUdelezenci()

#četrta
leta2 <- 2007:2013

uvoziAlkohol <- function(){
  return(read.table("podatki/alkohol.csv", sep = ";", as.is = TRUE, header = TRUE,
                    col.names = c("Leta",as.vector(outer("Leto ",leta2, paste0))),
                    fileEncoding = "Windows-1250", row.names = 1))
}

cat("Uvažam podatke o nesrečah z alkoholiziranimi udeleženci..\n")
poalkoholu <- uvoziAlkohol()

#Narišemo 4 grafe, ki ustrezajo vsaki tabeli

#Prvi graf

x <- c(leta1) 
y <- unlist(polokaciji["Avtocesta",])
z <- unlist(polokaciji["V naselju",])
w <- unlist(polokaciji["Zunaj naselja",])


pdf("slike/polokaciji.pdf")
plot(x, y, ylim = range(c(y,z,w)), xlim = range(x), type = "l", lwd = 2.5, xlab = "Leta", ylab ="Število nesreč",
     main = "Število prometnih nesreč po lokaciji")
lines(x, z, col = "red", lwd = 2.5)
lines(x, w, col = "green", lwd = 2.5)
legend("topright", c("Avtocesta", "V naselju", "Zunaj naselja"),
        lty = c(1,1), lwd = c(2.5,2.5), col = c("black", "red", "green"))
dev.off()

#Drugi graf

ycesta <- unlist(povrsticeste["Avtoceste",])
zcesta <- unlist(povrsticeste["Hitre in glavne ceste I., II. reda",])
wcesta <- unlist(povrsticeste["Turistične, reg. ceste I., II., III. reda",])
ucesta <- unlist(povrsticeste["Lokalne ceste",])
vcesta <- unlist(povrsticeste["Naselje z uličnim sistemom",])
tcesta <- unlist(povrsticeste["Naselje brez uličnega sistema",])

pdf("slike/povrsticeste.pdf")
plot(x,ycesta, ylim = range(c(ycesta,zcesta,wcesta,ucesta,vcesta,tcesta))+c(0,5000), xlim = range(x), type = "l",
     lwd = 2.5, xlab = "Leta", ylab = "Število nesreč",
     main = "Število prometnih nesreč po vrsti ceste")
lines(x, zcesta, col = "red", lwd = 2.5)
lines(x, wcesta, col = "green", lwd = 2.5)
lines(x, ucesta, col = "blue", lwd = 2.5)
lines(x, vcesta, col = "purple", lwd = 2.5)
lines(x, tcesta, col = "yellow", lwd = 2.5)
legend("topright", c("Avtoceste", "Hitre in gl. ceste", "Turist., reg. ceste",
                     "Lok. ceste", "Ulični sistem", "Brez uličnega sistema"),
       lty = c(1,1), lwd = c(2.5,2.5), col = c ("black", "red", "green",
                                                "blue", "purple", "yellow"))
dev.off()

#Tretji graf

yudel <- unlist(poudelezencih["avtomobili",])
zudel <- unlist(poudelezencih["tovornavozila",])
wudel <- unlist(poudelezencih["avtobusi",])
uudel <- unlist(poudelezencih["traktorji",])
tudel <- unlist(poudelezencih["motornakolesa",])
rudel <- unlist(poudelezencih["kolesazmotorjem",])

pdf("slike/poudelezencih.pdf")
plot(x,yudel, ylim = range(c(yudel,zudel,wudel,uudel,tudel,rudel)), xlim = range(x), type = "l",
     lwd = 2.5, xlab = "Leta", ylab = "Število nesreč",
     main = "Število prometnih nesreč po vrsti vozila")
lines(x,zudel, col = "red", lwd = 2.5)
lines(x,wudel, col = "green", lwd = 2.5)
lines(x,uudel, col = "blue", lwd = 2.5)
lines(x,tudel, col = "purple", lwd = 2.5)
lines(x,rudel, col = "yellow", lwd = 2.5)
legend("topright", c("Avtomobili", "Tovorna vozila", "Avtobusi", "Traktorji", "Motorna kolesa",
                     "Kolesa z motorjem"), lty = c(1,1), lwd = c(2.5,2.5),
       col = c("black", "red", "green", "blue", "purple", "yellow"))
dev.off()

#Četrti graf

xalk <- c(leta2)
yalk <- unlist(poalkoholu["Moški",])
zalk <- unlist(poalkoholu["Ženske",])
walk <- unlist(poalkoholu["Kolesa z motorjem",])
ualk <- unlist(poalkoholu["Motorna kolesa",])
valk <- unlist(poalkoholu["Avtomobili",])

pdf("slike/poalkoholu.pdf")
plot(xalk, yalk, ylim = range(c(yalk,zalk,walk,ualk,valk))+ c(0,100), xlim = range(xalk), type = "l",
     lwd = 2.5, xlab = "Leta", ylab = "Število nesreč", 
     main = "Število nesreč z alkoholiziranimi udeleženci")
lines(xalk, zalk, col = "red", lwd = 2.5)
lines(xalk, walk, col = "green", lwd = 2.5)
lines(xalk, ualk, col = "blue", lwd = 2.5)
lines(xalk, valk, col = "yellow", lwd = 2.5)
legend("topright", c("Moški","Ženske", "Kolesa z motorjem", "Motorna kolesa", "Avtomobili"),
       lty = c(1,1), lwd = c(2.5,2.5), col = c("black", "red", "green", "blue", "yellow"))
dev.off()