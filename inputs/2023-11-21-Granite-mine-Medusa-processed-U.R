# \\\\\\\\\\\\\\\\\\\\\  INPUT PARAMETERS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
input <- data.frame(
  filename <- "2023-11-21-Granite-mine-Medusa-processed.xlsx",  # filename
  # columns to be read:
  longitude <- "Longitude_GPS",
  latitude <- "Latitude_GPS", 
  column <- "238-U",
  
  site <- "2023.11.21 Granite mine",   #this appears on the figures and printout file names
  detector <- "Medusa", # for the name of the printout files
  quantity <- "U Concentrations (Bq/kg)", #this appears on the figures
  unitName <- "U", # for the name of the printout files
  constant <- 1,      # the constant the value needs to be multiplied by
  
  utm = 32733,       # Universal Transverse Mercator system  (32633 Namibia)
  resolution <- 1,    # grid resolution in [m] (pixels)
  subsetting <- 3
)
# /////////////////////////////////////////////////////////////////////