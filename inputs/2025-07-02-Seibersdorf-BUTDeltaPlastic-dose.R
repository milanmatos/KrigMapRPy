# \\\\\\\\\\\\\\\\\\\\\  INPUT PARAMETERS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
input <- data.frame(
  filename <- "2025.07.02_BUT_Delta_plastic.csv",  # filename
  # columns to be read:
  longitude <- "gps_lon",
  latitude <- "gps_lat", 
  column <- "dose_rate",
  
  site <- "2025.07.02 Seibersdorf flight",   #this appears on the figures and printout file names
  detector <- "BUT Delta plastic", # for the name of the printout files
  quantity <- "dose rate at 15m (uGy/h)", #this appears on the figures
  unitName <- "dose", # for the name of the printout files
  constant <- 1,      # the constant the value needs to be multiplied by
  
  utm = 32633,       # Universal Transverse Mercator system  (32633 Austria)
  resolution <- 1,    # grid resolution in [m] (pixels)
  subsetting <- 3
)
# /////////////////////////////////////////////////////////////////////