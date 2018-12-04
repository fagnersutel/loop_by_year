#install.packages('foregein')
library(foreign)
setwd('/Users/fsmoura/Documents/R-files/loop_by_year/anos/2010/')
list.files()
acidentes = read.dbf("acidentes.dbf")
head(acidentes)
dim(acidentes)
dim(temp1)
temp = acidentes[acidentes$PREDIAL1 == 0, ]
head(temp)
dim(temp)
temp = acidentes[acidentes$LONGITUDE == 0, ]
dim(temp)
condutores = read.dbf("condutores.dbf")
dim(condutores)
head(condutores)
vit = read.dbf("vitimas.dbf")
dim(vit)
head(vit[1,])
head(vit[2,])
head(vit[3,])
temp <- vit[!(is.na(vit$PLACA_VEIC)),]
length(temp)
59/9421
head(acidentes)
dim(acidentes[acidentes$CONT_VIT == 1,])
dim(acidentes[acidentes$FERIDOS > 0 || acidentes$FERIDOS_GR > 0,])
dim(acidentes[acidentes$FERIDOS > 0,])
dim(acidentes[acidentes$FERIDOS_GR > 0,])
dim(acidentes[acidentes$MORTES > 0,])
dim(acidentes[acidentes$MORTE_POST > 0,])
dim(acidentes[acidentes$MORTES > 0 | acidentes$MORTE_POST > 0,])
dim(acidentes[acidentes$MORTES > 0 | acidentes$MORTE_POST > 0,])
81+56
temp = acidentes[acidentes$MORTES > 0 | acidentes$MORTE_POST > 0,]
dim(temp)
temp = acidentes[acidentes$MORTES > 0 | acidentes$MORTE_POST > 0 | acidentes$FERIDOS > 0 | acidentes$FERIDOS_GR > 0,]
dim(temp)


dim(acidentes[acidentes$CONT_VIT == 1,])
dim(acidentes[acidentes$MORTES > 0 | acidentes$MORTE_POST > 0 | acidentes$FERIDOS > 0 | acidentes$FERIDOS_GR > 0,])
dim(cond)
dim(vit)
head(temp,1)

acidentes = NULL
condutores = NULL
vitimas = NULL
loop = c(0:1)
for(i in loop){
  setwd(paste('/Users/fsmoura/Documents/R-files/loop_by_year/anos/201', i, sep = "" ))
  print(getwd())
  print(list.files())
  acidentes1 = read.dbf("acidentes.dbf")
  acidentes = rbind(acidentes, acidentes1)
  
  condutores1 = read.dbf("condutores.dbf")
  condutores = rbind(condutores, condutores1)
  
  vitimas1 = read.dbf("vitimas.dbf")
  vitimas = rbind(vitimas, vitimas1)
  
  percent_c = (length(condutores$ID)/length(acidentes$ID))
  percent_v = (length(condutores$ID)/length(vitimas$BOLETIM))
  print(dim(acidentes))
  print(paste(length(condutores$ID), percent_c, "%", sep = " " ))  
  print(percent)
  print(length(vitimas$BOLETIM))  
}



temp = acidentes[acidentes$PREDIAL1 == 0, ]
head(temp)
dim(temp)
temp = acidentes[acidentes$LONGITUDE == 0, ]
dim(temp)
cond = read.dbf("condutores.dbf")
dim(cond)
head(cond)
vit = read.dbf("vitimas.dbf")
dim(vit)
head(vit[1,])
head(vit[2,])
head(vit[3,])
temp <- vit[!(is.na(vit$PLACA_VEIC)),]
length(temp)
59/9421
head(acidentes)
dim(acidentes[acidentes$CONT_VIT == 1,])
dim(acidentes[acidentes$FERIDOS > 0 || acidentes$FERIDOS_GR > 0,])
dim(acidentes[acidentes$FERIDOS > 0,])
dim(acidentes[acidentes$FERIDOS_GR > 0,])
dim(acidentes[acidentes$MORTES > 0,])
dim(acidentes[acidentes$MORTE_POST > 0,])
dim(acidentes[acidentes$MORTES > 0 | acidentes$MORTE_POST > 0,])
dim(acidentes[acidentes$MORTES > 0 | acidentes$MORTE_POST > 0,])
81+56
temp = acidentes[acidentes$MORTES > 0 | acidentes$MORTE_POST > 0,]
dim(temp)
temp = acidentes[acidentes$MORTES > 0 | acidentes$MORTE_POST > 0 | acidentes$FERIDOS > 0 | acidentes$FERIDOS_GR > 0,]
dim(temp)
dim(temp)
dim(acidentes[acidentes$CONT_VIT == 1,])
dim(acidentes[acidentes$MORTES > 0 | acidentes$MORTE_POST > 0 | acidentes$FERIDOS > 0 | acidentes$FERIDOS_GR > 0,])
dim(cond)
dim(vit)
head(temp,1)
head(acidentes,1)
acidentes = acidentes[acidentes$TIPO_ACID == "ATROPELAMENTO",]
dim(acidentes)
acidentes = acidentes[,1:3]
head(acidentes)
dim(acidentes)

acidentes$LONGITUDE = sub( '(?<=.{3})', '.', acidentes$LONGITUDE, perl=TRUE )
acidentes$LATITUDE = sub( '(?<=.{3})', '.', acidentes$LATITUDE, perl=TRUE )
acidentes = acidentes[acidentes$LONGITUDE < 0, ]
head(acidentes)
dim(acidentes)

acidentes$LONGITUDE = as.numeric(as.character(acidentes$LONGITUDE))
acidentes$LATITUDE = as.numeric(as.character(acidentes$LATITUDE))
class(acidentes$LATITUDE)
class(acidentes$LONGITUDE)

library(leaflet)
leaflet(acidentes) %>%
  addTiles(group="OSM") %>% 
  addCircles(~LONGITUDE, ~LATITUDE, weight = 0.1, radius=1, color="red",
             stroke = TRUE, fillOpacity = 0.8) %>% 
  addLegend("topright", colors= "blue", labels=paste("alvaras", sep = " "), title="Cluster")



leaflet(acidentes) %>%
  addTiles(group="OSM") %>% 
  addCircles(~dados$V1, ~dados$V2, weight = 0.1, radius=20, color="green",
             stroke = TRUE, fillOpacity = 0.8) %>%
  addCircles(~LONGITUDE, ~LATITUDE, weight = 0.1, radius=20, color="red",
             stroke = TRUE, fillOpacity = 0.8) %>% 
  addLegend("topright", colors= "blue", labels=paste("alvaras", sep = " "), title="Cluster")
 
 