# \\\\\\\\\\\\\\\\\\\\\  INPUT PARAMETERS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
input <- data.frame(
  filename <- "norm_ground_analysis_report_642_20secIntegration.csv",  # filename
  # columns to be read:
  longitude <- "Lon",
  latitude <- "Lat", 
  column <- "CPS",
  
  site <- "2024.10.16 Trieste",   #this appears on the figures and printout file names
  detector <- "Gamon", # for the name of the printout files
  quantity <- "CPS", #this appears on the figures
  unitName <- "cps", # for the name of the printout files
  constant <- 1,      # the constant the value needs to be multiplied by
  
  utm = 32633,       # Universal Transverse Mercator system  (32633 Namibia)
  resolution <- 0.5,    # grid resolution in [m] (pixels)
  subsetting <- 1
)
# /////////////////////////////////////////////////////////////////////