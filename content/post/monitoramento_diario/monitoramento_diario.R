##rm(list = ls())
## Motivation
# Help a friend to compare the beach length monitored along 20 latitudinal sector of equal area.

## The data available:
# 20 individual coastline segments (shapefile format) located in different sub-directories

## Code structure:
# 01 - Create a function to open all dataset and merge them into one spatial layer.
# 02 - Create a new spatial layer with the 20 latitudinal sectors using the total extention of the monitored area.
# 03 - Deal with geometries intersection and calculate the total length of all segments within the each sector.

## Start the code
### Load libraries
library(sf)
library(mapview)
library(tidyverse)
getwd()
## 01 - OPEN DATA AND MERGE ALL SHAPEFILES INTO ONE ####
# create a list with all subdirectories containing the shapefiles:
ff <- as.list(list.files(path="./", pattern="linha.shp$", recursive=TRUE, full.names=TRUE))

## Function to open the shps in subdirectories
open_shp <- function(ff){
  linha <- st_read(ff[i])
  linha
}

## A looping creating a list with all shapefiles
linhas <- list()
for (i in 1:length(ff)) {
  linhas[[i]] <- open_shp(ff)
}

# Merge all monitoring lines in one shapefile
merged.lines <- linhas %>% do.call(rbind, .)
merged.lines <-do.call(rbind,lapply(1:nrow(merged.lines),function(i){st_cast(merged.lines[i,],"LINESTRING")}))

# mapview(merged.lines)
#st_write(merged.lines,"./merged_lines.shp")  ## saving the shp
#merged.lines<-st_read("./merged_lines.shp") ## openning it
x = merged.lines %>% st_as_sf() %>% st_transform(4326) %>% st_geometry()

## 02 - CREATE A NEW SPATIAL FEATURE BASED ON 20 LATITUDINAL SECTORS #### 
## Find the total costal strip monitored 
n<-diff(st_bbox(merged.lines)[c(2, 4)])/20  ## calculate the latitude area for 20 sectors
                                            ## CHANGE THE NUMBER HERE IF YOU WANT A MORE REFINED ANALYSIS!!

m<-diff(st_bbox(merged.lines)[c(1, 3)])     ## calculate the total longitudinal area monitored

## create 20 latitudinal sectors based on merged.lines extend
sectors<-st_as_sf(st_make_grid(st_combine(x), cellsize = c(m,n)))

# mapview(sectors)
sectors$id <- 1:nrow(sectors)                           ## create an identifier for each sector
sectors <- sectors %>% st_cast("MULTIPOLYGON")          ## define sectors as a multipolygon feature
mapview(sectors,zcol="id")                              ## view the sectors categorized by id

## create a multiline feature based on "sectors" id limits:
sectors_lines <- st_cast(sectors, "MULTILINESTRING", group_or_split = FALSE)
mapview(sectors_lines)

## 03 - LOOK FOR INTERSECTION BETWEEN THE 20 SECTORS AND ALL MONITORED LINES, CUT IN THIS POINT AND CALCULATE THE SEGMENT LENGTH #### 
# calculating intersection between merged.lines and the individual sectors
count(filter(merged.lines, stretch__1 == 0))

library(rgeos)
gridS <- sf:::as_Spatial(st_transform(sectors, 5641))
lineS <- sf:::as_Spatial(st_transform(filter(merged.lines, stretch__1 != 0), 5641))
clipLine <- gIntersection(lineS, gridS, byid = TRUE)
clipLine <- clipLine %>% st_as_sf() %>% st_join(left = FALSE, (st_as_sf(gridS))["id"]) # join points

## Calculate individual segment lengths
clipLine$length <- st_length(clipLine)
mapview(line_intersection_join, zcol="length")

## Add the total monitored length for each sector
sector_monit_length <- ddply(clipLine, "uid", summarise, tot_monitored_lenght=sum(length))
sectors<-merge(sectors, sector_monit_length, by.x = "id", by.y = "uid",all.x=TRUE) ## update the "sector" layer
mapview(sectors, zcol = "tot_monitored_lenght") 
+ line_intersection_join  ## view the final product
st_write(sectors,"./sectors.shp")  ## saving the sectors as a .shp

library(leaflet)
leaflet(sf:::as_Spatial(sectors)) %>% addTiles() %>% 
  addPolygons(color = "#444444", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5,
              fillColor = ~colorQuantile("YlOrRd", tot_monitored_lenght)(tot_monitored_lenght),
              highlightOptions = highlightOptions(color = "white", weight = 2,
                                                  bringToFront = TRUE),
              popup = ~tot_monitored_lenght 
             )
l %>% 
  addPolylines(sf:::as_Spatial(sector_monit_length), lng=~st_coordinates(sector_monit_length)[,1],lat = ~st_coordinates(sector_monit_length)[,2])
