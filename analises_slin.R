#install.packages('foregein')
library(foreign)
setwd('/Users/fsmoura/Documents/R-files/loop_by_year/anos/2010/')
list.files()
acidentes = NULL
condutores = NULL
vitimas = NULL
loop = c(0:7)
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
  percent_v = (length(vitimas$BOLETIM)/length(acidentes$ID))
  print(dim(acidentes))
  print(paste(length(condutores$ID), " percentual: ", percent_c, "%", sep = "" ))  
  print(paste(length(vitimas$BOLETIM),  " percentual: ", percent_v, "%", sep = "" ))    
}
dim(acidentes)
acidentes$LONGITUDE = sub( '(?<=.{3})', '.', acidentes$LONGITUDE, perl=TRUE )
acidentes$LATITUDE = sub( '(?<=.{3})', '.', acidentes$LATITUDE, perl=TRUE )
acidentes = acidentes[acidentes$LONGITUDE < 0, ]
dim(acidentes)

acidentes$LONGITUDE = as.numeric(as.character(acidentes$LONGITUDE))
acidentes$LATITUDE = as.numeric(as.character(acidentes$LATITUDE))
class(acidentes$LATITUDE)
class(acidentes$LONGITUDE)

#temp = acidentes
#acidentes = acidentes[1:100000,]

library(leaflet)
leaflet(acidentes) %>%
  addTiles(group="OSM") %>% 
  addCircles(~LONGITUDE, ~LATITUDE, weight = 0.1, radius=1, color="red",
             stroke = TRUE, fillOpacity = 0.8) %>% 
  addLegend("topright", colors= "red", labels=paste("Acidentes", sep = " "), title="2010-2017")



leaflet(acidentes) %>%
  addTiles(group="OSM") %>% 
  addCircles(~dados$V1, ~dados$V2, weight = 0.1, radius=20, color="green",
             stroke = TRUE, fillOpacity = 0.8) %>%
  addCircles(~LONGITUDE, ~LATITUDE, weight = 0.1, radius=20, color="red",
             stroke = TRUE, fillOpacity = 0.8) %>% 
  addLegend("topright", colors= "blue", labels=paste("alvaras", sep = " "), title="Cluster")
 
 