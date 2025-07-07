# \\\\\\\\\\\\\\\\\\\\\  INPUT PARAMETERS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
input <- data.frame(
  filename <- "2023-11-21-Granite-mine-PGIS-09_55_36.xlsx",  # filename
  # columns to be read:
  longitude <- "Lon_deg",
  latitude <- "Lat_deg", 
  column <- "cUr_Bqpkg",
  
  site <- "2023.11.21 Granite mine",   #this appears on the figures and printout file names
  detector <- "PGIS", # for the name of the printout files
  quantity <- "U Concentrations (Bq/kg)", #this appears on the figures
  unitName <- "U", # for the name of the printout files
  constant <- 1,      # the constant the value needs to be multiplied by
  
  utm = 32733,       # Universal Transverse Mercator system
  resolution <- 1,    # grid resolution in [m] (pixels)
  subsetting <- 3
)
# /////////////////////////////////////////////////////////////////////