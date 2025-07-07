# \\\\\\\\\\\\\\\\\\\\\  INPUT PARAMETERS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
input <- data.frame(
  filename <- "SPIR-Pack_2025-06-26.csv",  # filename
  # columns to be read:
  longitude <- "Lon",
  latitude <- "Lat", 
  column <- "Dose",
  
  site <- "2025.06.26 Seibersdorf",   #this appears on the figures and printout file names
  detector <- "SPIR", # for the name of the printout files
  quantity <- "Dose rate (uSv/h)", #this appears on the figures
  unitName <- "dose", # for the name of the printout files
  constant <- 1000,      # the constant the value needs to be multiplied by
  
  utm = 32633,       # Universal Transverse Mercator system
  resolution <- 1,    # grid resolution in [m] (pixels)
  subsetting <- 3
)
# /////////////////////////////////////////////////////////////////////