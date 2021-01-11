# R code for the exam

# nc data: we need a library
install.packages("ncdf4")
library(ncdf4)
library(raster)

setwd("C:/lab/")

tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
plot(tjan)

cltjan <- colorRampPalette(c('red','orange','yellow'))(100) #
plot(tjan, col = cltjan)

# changing color 
cltjan <- colorRampPalette(c('purple','violet','pink'))(100) #
plot(tjan, col = cltjan)

cltjan <- colorRampPalette(c('blue','yellow','red'))(100) #
plot(tjan, col=cltjan)

toct <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")
plot(toct, col=cltjan)

# difference in temperature
dift <- tjan - toct
cldift <- colorRampPalette(c('blue','white','red'))(100) #
plot(dift, col = cldift)

