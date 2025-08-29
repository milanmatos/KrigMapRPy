#default values
input <- data.frame(
  filename <- "datafile.xlsx",  # filename
  # columns to be read:
  longitude <- "Lon_deg",
  latitude <- "Lat_deg", 
  column <- "DosPGIS_nGypH",
  
  site <- "2025.06.26_Seib",   #this appears on the figures and printout file names
  detector <- "PGIS", # for the name of the printout files
  quantity <- "Dose rate (uGy/h)", #this appears on the figures
  unitName <- "dose", # for the name of the printout files
  constant <- 1,      # the constant the value needs to be multiplied by
  
  utm <- 32633,       # Universal Transverse Mercator system
  resolution <- 1,    # grid resolution in [m] (pixels)
  subsetting <- 3
)


if(endsWith(source_name[1], ".xlsx")) {parameters <- read_excel(paste0("inputs/",source_name[1]))}
if(endsWith(source_name[1], ".csv")) {parameters <- read.csv(paste0("inputs/",source_name[1]))}

cat("\n input file: ", source_name[1], "\n")
# Loop through rows
for (i in 1:nrow(parameters)) {
  if(!is.na(parameters[i, 1]) && parameters[i, 1]=="filename") {input$filename <- as.character(parameters[i, 2])
  cat("data filename: ",input$filename,"\n")}
  if(!is.na(parameters[i, 1]) && parameters[i, 1]=="longitude") {input$longitude <- as.character(parameters[i, 2])
  cat("longitude column: ", input$longitude,"\n")}
  if(!is.na(parameters[i, 1]) && parameters[i, 1]=="latitude") {input$latitude <- as.character(parameters[i, 2])
  cat("latitude column: ", input$latitude,"\n")}
  if(!is.na(parameters[i, 1]) && parameters[i, 1]=="column") {input$column <- as.character(parameters[i, 2])
  cat("value column: ", input$column,"\n")}
  if(!is.na(parameters[i, 1]) && parameters[i, 1]=="site") {input$site <- as.character(parameters[i, 2])
  cat("site: ", input$site,"\n")}
  if(!is.na(parameters[i, 1]) && parameters[i, 1]=="detector") {input$detector <- as.character(parameters[i, 2])
  cat("detector: ", input$detector,"\n")}
  if(!is.na(parameters[i, 1]) && parameters[i, 1]=="quantity") {input$quantity <- as.character(parameters[i, 2])
  cat("quantity:", input$quantity,"\n")}
  if(!is.na(parameters[i, 1]) && parameters[i, 1]=="unitName") {input$unitName <- as.character(parameters[i, 2])
  cat("unit name:", input$unitName,"\n")}
  if(!is.na(parameters[i, 1]) && parameters[i, 1]=="constant") {input$constant <- as.numeric(parameters[i, 2])
  cat("multiplication constant", input$constant,"\n")}
  if(!is.na(parameters[i, 1]) && parameters[i, 1]=="utm") {input$utm <- as.numeric(parameters[i, 2])
  cat("utm: ", input$utm,"\n")}
  if(!is.na(parameters[i, 1]) && parameters[i, 1]=="resolution") {input$resolution <- as.numeric(parameters[i, 2])
  cat("interpolation grid resolution: ", input$resolution,"\n")}
  if(!is.na(parameters[i, 1]) && parameters[i, 1]=="subsetting") {input$subsetting <- as.numeric(parameters[i, 2])
  cat("path subsetting: ", input$subsetting,"\n")}
}

if(endsWith(input$filename, ".xlsx")) {data <- read_excel(paste0("data/",input$filename))}
if(endsWith(input$filename, ".csv")) {data <- read.csv(paste0("data/",input$filename))}

data <- data %>%   
  dplyr::rename(lon = input$longitude, lat = input$latitude, value = input$column) %>% 
  dplyr::select("lon","lat","value")

data$value <- data$value * input$constant
data$dataset <- input$detector
detectorname <- input$detector

if (length(source_name) > 1){
  
  for (src in 2:length(source_name)) {
    
    
    if(endsWith(source_name[src], ".xlsx")) {parameters <- read_excel(paste0("inputs/",source_name[src]))}
    if(endsWith(source_name[src], ".csv")) {parameters <- read.csv(paste0("inputs/",source_name[src]))}
    
    cat("\n input file: ", source_name[src], "\n")
    # Loop through rows
    for (i in 1:nrow(parameters)) {
      if(!is.na(parameters[i, 1]) && parameters[i, 1]=="filename") {input$filename <- as.character(parameters[i, 2])
      cat("data filename: ",input$filename,"\n")}
      if(!is.na(parameters[i, 1]) && parameters[i, 1]=="longitude") {input$longitude <- as.character(parameters[i, 2])
      cat("longitude column: ", input$longitude,"\n")}
      if(!is.na(parameters[i, 1]) && parameters[i, 1]=="latitude") {input$latitude <- as.character(parameters[i, 2])
      cat("latitude column: ", input$latitude,"\n")}
      if(!is.na(parameters[i, 1]) && parameters[i, 1]=="column") {input$column <- as.character(parameters[i, 2])
      cat("value column: ", input$column,"\n")}
      if(!is.na(parameters[i, 1]) && parameters[i, 1]=="site") {input$site <- as.character(parameters[i, 2])
      cat("site: ", input$site,"\n")}
      if(!is.na(parameters[i, 1]) && parameters[i, 1]=="detector") {input$detector <- as.character(parameters[i, 2])
      cat("detector: ", input$detector,"\n")}
      if(!is.na(parameters[i, 1]) && parameters[i, 1]=="quantity") {input$quantity <- as.character(parameters[i, 2])
      cat("quantity:", input$quantity,"\n")}
      if(!is.na(parameters[i, 1]) && parameters[i, 1]=="unitName") {input$unitName <- as.character(parameters[i, 2])
      cat("unit name:", input$unitName,"\n")}
      if(!is.na(parameters[i, 1]) && parameters[i, 1]=="constant") {input$constant <- as.numeric(parameters[i, 2])
      cat("multiplication constant", input$constant,"\n")}
      if(!is.na(parameters[i, 1]) && parameters[i, 1]=="utm") {input$utm <- as.numeric(parameters[i, 2])
      cat("utm: ", input$utm,"\n")}
      if(!is.na(parameters[i, 1]) && parameters[i, 1]=="resolution") {input$resolution <- as.numeric(parameters[i, 2])
      cat("interpolation grid resolution: ", input$resolution,"\n")}
      if(!is.na(parameters[i, 1]) && parameters[i, 1]=="subsetting") {input$subsetting <- as.numeric(parameters[i, 2])
      cat("path subsetting: ", input$subsetting,"\n")}
    }
    
    if(endsWith(input$filename, ".xlsx")) {data_temp <- read_excel(paste0("data/",input$filename))}
    if(endsWith(input$filename, ".csv")) {data_temp <- read.csv(paste0("data/",input$filename))}
    
    data_temp <- data_temp %>%   
      dplyr::rename(lon = input$longitude, lat = input$latitude, value = input$column) %>% 
      dplyr::select("lon","lat","value")
    data_temp$value <- data_temp$value * input$constant
    data_temp$dataset <- input$detector
    data <- rbind(data,data_temp)  # repeated with each dataset
    
    # for the detector name in the printouts
    detectorname <- paste0(detectorname,"+",input$detector) 
  }
}