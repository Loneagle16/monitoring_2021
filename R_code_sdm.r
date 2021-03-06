# R_code_sdm.r

library(sdm)
library(raster)
library(rgdal)

# import the species data
file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file) # readOGR

species
plot(species)
plot(species, pch=17)

species$Occurrence

plot(species[species$Occurrence == 1,], col='blue', pch=17)
points(species[species$Occurrence == 0,], col='red', pch=17)

path <- system.file("external", package="sdm") 
# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

preds <- stack(lst)
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

plot(preds$elevation, col=cl)
plot(species[species$Occurrence == 1,], col='blue', pch=17)

plot(preds$temperature, col=cl)
points(species[species$Occurrence == 1,], pch=17)

plot(preds$precipitation, col=cl)
points(species[species$Occurrence == 1,], pch=17)

plot(preds$vegetation, col=cl)
points(species[species$Occurrence == 1,], pch=17)

datasdm <- sdmData(train=species, predictors=preds)
datasdm

m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

p1 <- predict(m1, newdata=preds) 
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=17)

s1 <- stack(preds,p1)
plot(s1, col=cl)





