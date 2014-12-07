# prvi graf

skupajn <- c(22913, 22035,18904)
pdf("skupajnesrece.pdf", paper = "a4")
barplot(skupajn, main = "Število prometnih nesreč - skupaj", names.arg = c("2011","2012","2013"))
dev.off()

#drugi graf

steviloud <- c(42105,39971,34481)
pdf("steviloudelezencev.pdf", paper = "a4")
barplot(steviloud, main = "Število udeležencev - skupaj", names.arg = c("2011","2012","2013"))
dev.off()