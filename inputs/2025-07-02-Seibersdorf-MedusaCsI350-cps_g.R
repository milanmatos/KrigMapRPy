# \\\\\\\\\\\\\\\\\\\\\  INPUT PARAMETERS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
input <- data.frame(
  filename <- "2025.07.03_SeibFlight_MedusaCsI350_DJI.csv",  # filename
  # columns to be read:
  longitude <- "Lon",
  latitude <- "Lat", 
  column <- "TC_g",
  
  site <- "2025.07.02 Seibersdorf flight",   #this appears on the figures and printout file names
  detector <- "Medusa CsI350 DJI", # for the name of the printout files
  quantity <- "cps_g", #this appears on the figures
  unitName <- "cps_g", # for the name of the printout files
  constant <- 1,      # the constant the value needs to be multiplied by
  
  utm = 32633,       # Universal Transverse Mercator system  (32633 Austria)
  resolution <- 1,    # grid resolution in [m] (pixels)
  subsetting <- 1
)
# /////////////////////////////////////////////////////////////////////