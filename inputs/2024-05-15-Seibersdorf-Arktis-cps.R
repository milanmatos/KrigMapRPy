# \\\\\\\\\\\\\\\\\\\\\  INPUT PARAMETERS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
input <- data.frame(
  filename <- "2024-05-15-Seibersdorf-Arktis.csv",  # filename
  # columns to be read:
  longitude <- "lon",
  latitude <- "lat", 
  column <- "gamma_cps",
  
  site <- "Seibersdorf Arktis UAV",   #this appears on the figures and printout file names
  detector <- "Arktis", # for the name of the printout files
  quantity <- "cps", #this appears on the figures
  unitName <- "cps", # for the name of the printout files
  constant <- 1,      # the constant the value needs to be multiplied by
  
  utm = 32633,       # Universal Transverse Mercator system (32633 Vienna)
  resolution <- 3,   # grid resolution in [m] (pixels)
  subsetting <- 3    # subset
)
# /////////////////////////////////////////////////////////////////////