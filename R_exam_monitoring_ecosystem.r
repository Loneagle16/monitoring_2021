# Crop circles in the desert

library(raster)
library(RStoolbox)
setwd("C:/lab/")

# Import image Wadi As-Sirhan Basin in 1987
saudiarabia1 <- brick("saudiarabia_tm5_1987036_lrg.jpg")
plotRGB(saudiarabia1, r=1, g=2, b=3, stretch="Lin")

# Import image Wadi As-Sirhan Basin in 1991
saudiarabia2 <- brick("saudiarabia_tm4_1991055_lrg.jpg")
plotRGB(saudiarabia2, r=1, g=2, b=3, stretch="Lin")

# Import image Wadi As-Sirhan Basin in 2000
saudiarabia3 <- brick("saudiarabia_tm5_2000072_lrg.jpg")
plotRGB(saudiarabia3, r=1, g=2, b=3, stretch="Lin")


# Import image Wadi As-Sirhan Basin in 2012
saudiarabia4 <- brick("saudiarabia_etm_2012017_lrg.jpg")
plotRGB(saudiarabia4, r=1, g=2, b=3, stretch="Lin")

# Comparing images with par
par(mfrow=c(2,2))
plotRGB(saudiarabia1, r=1, g=2, b=3, stretch="Lin")
plotRGB(saudiarabia2, r=1, g=2, b=3, stretch="Lin")
plotRGB(saudiarabia3, r=1, g=2, b=3, stretch="Lin")
plotRGB(saudiarabia4, r=1, g=2, b=3, stretch="Lin")

dev.off()
# Difference Vegetation Index (DVI) 1987 [DVI=NIR(band2) - Red(band1)]
dvi1 <- saudiarabia1$saudiarabia_tm5_1987036_lrg.2 - saudiarabia1$saudiarabia_tm5_1987036_lrg.1
cl <- colorRampPalette(c('green2','yellow','darkorange','blue2'))(100)
plot(dvi1, col=cl, main="DVI Wadi As-Sirhan Basin 1987")

# Difference Vegetation Index (DVI) 2012 agricultural fields
dvi4 <- saudiarabia4$saudiarabia_etm_2012017_lrg.2 - saudiarabia4$saudiarabia_etm_2012017_lrg.1
cl <- colorRampPalette(c('green2','yellow','darkorange','blue2'))(100)
plot(dvi4, col=cl, main="DVI Wadi As-Sirhan Basin 2012")

# Images one beside the other one
par(mfrow=c(1,2))
plot(dvi1, col=cl, main="DVI Wadi As-Sirhan Basin 1987")
plot(dvi4, col=cl, main="DVI Wadi As-Sirhan Basin 2012")

dev.off()
# Difference in vegetation presence before and after agricultural operations in the desert
difdvi <- dvi1 -dvi4
cldif <- colorRampPalette(c('blue3','red','mediumspringgreen','black'))(100)
plot(difdvi, col=cldif, main="Evolution of agricultural operations")

# Histogram of difdvi
hist(difdvi, col="springgreen4", main="difference DVI")

# Final comparison with all results of analysis: saudiarabia 1987, saudiarabia 2012, dvi1, dvi4, difdvi, histogram
par(mfrow=c(3,2))
plotRGB(saudiarabia1, r=1, g=2, b=3, stretch="Lin")
plotRGB(saudiarabia4, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="Wadi As-Sirhan Basin 1987")
plot(dvi4, col=cl, main="Wadi As-Sirhan Basin 2012")
plot(difdvi, col=cldif, main="Evolution of agricultural operations")
hist(difdvi, col="springgreen4", main="difference DVI")


