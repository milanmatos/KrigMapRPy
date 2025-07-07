# \\\\\\\\\\\\\\\\\\\\\  INPUT PARAMETERS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
input <- data.frame(
  filename <- "2025.07.03_SeibFlight_MedusaCsI350_DJI.csv",  # filename
  # columns to be read:
  longitude <- "Lon",
  latitude <- "Lat", 
  column <- "dose",
  
  site <- "2025.07.02 Seibersdorf flight",   #this appears on the figures and printout file names
  detector <- "Medusa CsI350 DJI", # for the name of the printout files
  quantity <- "H*(10) at 15m (uSv/h)", #this appears on the figures
  unitName <- "doseH", # for the name of the printout files
  constant <- 0.0036,      # the constant the value needs to be multiplied by
  
  utm = 32633,       # Universal Transverse Mercator system  (32633 Austria)
  resolution <- 1,    # grid resolution in [m] (pixels)
  subsetting <- 3
)
# /////////////////////////////////////////////////////////////////////