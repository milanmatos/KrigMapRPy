if(length(source_name) == 0)
{
# List all .R files
 r_files <- list.files(path = "./inputs", pattern = "\\.R$", full.names = FALSE)
# Check if there are any files
 if (length(r_files) == 0) {
   print("No .R files found in './inputs'")
 }
 else {
  # Print numbered list
  cat("Available .R files:\n")
  for (i in seq_along(r_files)) {
   cat(sprintf("%d: %s\n", i, r_files[i]))
  }
 }
# Prompt user to select a file
 choice_r <- as.integer(readline(prompt = "Enter the number of the file you want to select: \n (enter 0 if you want to build a new input file) "))
 if (choice_r == 0)
 {
   # List all data files
   d_files <- list.files(path = "./data", pattern = "\\.(xlsx|csv)$", full.names = FALSE)
   if (length(d_files) == 0) {
    stop("No data files found in './data'")
   }
   # Print numbered list
   cat("Available data files:\n")
   for (j in seq_along(d_files)) {
     cat(sprintf("%d: %s\n", j, d_files[j]))
   }
   # Prompt user to select a file
   choice_d <- as.integer(readline(prompt = "Enter the number of the file you want to select: "))
   if(endsWith(paste0("data/",c(d_files[choice_d])), ".xlsx")) {data <- read_excel(paste0("data/",c(d_files[choice_d])))}
   else if(endsWith(paste0("data/",c(d_files[choice_d])), ".csv")) {data <- read.csv(paste0("data/",c(d_files[choice_d])))}
   
   
   for (k in seq_along(names(data))) {
     cat(sprintf("%d: %s\n", k, names(data)[k]))
   }
   choice_lo <- as.integer(readline(prompt = "Longitude column: "))
   choice_la <- as.integer(readline(prompt = "Latitide column:  "))
   choice_va <- as.integer(readline(prompt = "Value column:  "))
   
   choice_site <- readline(prompt = "Date and location: ")
   choice_detector <- readline(prompt = "Detector (M350): ")
   choice_quantity <- readline(prompt = "Quantity with unit (Dose rate (uGy/h)): ") 
   choice_unitName <- readline(prompt = "Short name (dose): ")
   choice_constant <- as.numeric(readline(prompt = "Multiplication constant (usually 1): "))
  
   choice_utm <- as.integer(readline(prompt = "UTM (Austria 32633): "))
   
   source_name <- gsub(" ","-",
          paste0(choice_site,"-",choice_detector,"-",choice_unitName,".R") )
   newfile <- paste0("inputs/",source_name)
   
   if(file.exists(newfile))
   {
     choice_overw <- as.integer(readline(prompt = paste0("File ",newfile," exists, overwrite? [1=Yes, 0=No]: ")))
     if(choice_overw != 1)
     {
       stop("Exiting.")
     }
   }
   
   cat("input <- data.frame(\n", file = newfile)
   cat(paste0("  filename <- \"",c(d_files[choice_d]),"\",\n"), file = newfile, append = TRUE)
   
   cat(paste0("  longitude <- \"",names(data)[choice_lo],"\",\n"), file = newfile, append = TRUE)
   cat(paste0("  latitude <- \"",names(data)[choice_la],"\",\n"), file = newfile, append = TRUE)
   cat(paste0("  column <- \"",names(data)[choice_va],"\",\n"), file = newfile, append = TRUE)
  
   cat(paste0("  site <- \"",choice_site,"\",\n"), file = newfile, append = TRUE)  
   cat(paste0("  detector <- \"",choice_detector,"\",\n"), file = newfile, append = TRUE)
   cat(paste0("  quantity <- \"",choice_quantity,"\",\n"), file = newfile, append = TRUE)
   cat(paste0("  unitName <- \"",choice_unitName,"\",\n"), file = newfile, append = TRUE)
   cat(paste0("  constant <- ",choice_constant,",\n"), file = newfile, append = TRUE)
  
   cat(paste0("  utm <- ",choice_utm,",\n"), file = newfile, append = TRUE)       
   cat("  resolution <- 1,\n  subsetting <- 3\n\n)", file = newfile, append = TRUE)

   readLines(newfile)
} 
 # Validate input
 if (is.na(choice_r) || choice_r < 0 || choice_r > length(r_files)) {
   stop("Invalid selection.")
 }
 # Assign selected file to source_name
 if(choice_r != 0)
 {
   source_name <- c(r_files[choice_r])
 }
 # Show the selected file
 cat("You selected:", source_name, "\n")
}
crs <- 4326
