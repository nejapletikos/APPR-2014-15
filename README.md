# Analiza podatkov s programom R, 2014/15

Avtor: Neja Pletikos

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

Ukvarjala se bom s številom prometnih nesreč v Sloveniji v letih 2011,2012 in 2013. Prometne nesreče bom razdelila na 12 regij. Primerjala bom število nesreč v teh regijah, koliko jih je bilo s smrtnim izidom, s telesno poškodbo, materialno škodo in po poškodbah udeležencev. Tako bom ugotovila v kateri regiji je naveč prometnih nesreč, v kateri jih je največ s smrtnim izidom, kje najmanj in podobno. Podatke bom dobila na:
http://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=2222008S&ti=&path=../Database/Ekonomsko/22_transport/07_22220_cestno_prometne_nesrece/&lang=2 (CSV oblika)
http://www.stat.si/novica_prikazi.aspx?id=4973
http://www.stat.si/novica_prikazi.aspx?id=5741
http://www.stat.si/novica_prikazi.aspx?ID=6440

## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
