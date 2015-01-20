# prvi graf

leta <- 2011:2013

stolpci1 <- paste0("Skupaj", leta)
skupajn <- unlist(nesrece["SLOVENIJA", stolpci1])
pdf("slike/skupajnesrece.pdf")
barplot(skupajn, main = "Število prometnih nesreč - skupaj", names.arg = leta)
dev.off()

#drugi graf

stolpci2 <- paste0("Udelezenci", leta)
steviloud <- unlist(nesrece["SLOVENIJA", stolpci2])
pdf("slike/steviloudelezencev.pdf")
barplot(steviloud, main = "Število udeležencev - skupaj", names.arg = leta)
dev.off()