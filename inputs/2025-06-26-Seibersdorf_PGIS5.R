# \\\\\\\\\\\\\\\\\\\\\  INPUT PARAMETERS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
input <- data.frame(
  filename <- "B_PGIS-88E4_2025_06_26_11_44_40_PEI.csv",  # filename
  # columns to be read:
  longitude <- "Lon_deg",
  latitude <- "Lat_deg", 
  column <- "DosPGIS_nGypH",
  
  site <- "2025.06.26",   #this appears on the figures and printout file names
  detector <- "PGIS5", # for the name of the printout files
  quantity <- "Dose rate (uGy/h)", #this appears on the figures
  unitName <- "dose", # for the name of the printout files
  constant <- 1,      # the constant the value needs to be multiplied by
  
  utm = 32633,       # Universal Transverse Mercator system
  resolution <- 1,    # grid resolution in [m] (pixels)
  subsetting <- 3
)
# /////////////////////////////////////////////////////////////////////