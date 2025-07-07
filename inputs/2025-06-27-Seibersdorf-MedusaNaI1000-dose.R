# \\\\\\\\\\\\\\\\\\\\\  INPUT PARAMETERS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
input <- data.frame(
  filename <- "2025.06.27_Seibersdorf_MedusaNaI1000.csv",  # filename
  # columns to be read:
  longitude <- "Lon",
  latitude <- "Lat", 
  column <- "Dose",
  
  site <- "2025.06.27 Seibersdorf",   #this appears on the figures and printout file names
  detector <- "Medusa NaI1000", # for the name of the printout files
  quantity <- "H*(10) (uSv/h)", #this appears on the figures
  unitName <- "doseH", # for the name of the printout files
  constant <- 0.0036,      # the constant the value needs to be multiplied by
  
  utm = 32633,       # Universal Transverse Mercator system  (32633 Austria)
  resolution <- 1,    # grid resolution in [m] (pixels)
  subsetting <- 3
)
# /////////////////////////////////////////////////////////////////////