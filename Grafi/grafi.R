# prvi graf

skupajn <- c(22913, 22035,18904)
pdf("slike/skupajnesrece.pdf")
barplot(skupajn, main = "Število prometnih nesreč - skupaj", names.arg = c("2011","2012","2013"))
dev.off()

#drugi graf

steviloud <- c(42105,39971,34481)
pdf("slike/steviloudelezencev.pdf")
barplot(steviloud, main = "Število udeležencev - skupaj", names.arg = c("2011","2012","2013"))
dev.off()