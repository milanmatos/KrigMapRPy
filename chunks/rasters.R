
 value_krig_sf <- st_as_sf(value_krig, coords = c("lon", "lat"), crs = crs)
 
 # Ensure sf object has a defined CRS
 crs_val <- st_crs(value_krig_sf)
 # Convert sf to SpatVector
 value_vect <- vect(value_krig_sf)

 # Define raster template
r_template <- rast(ext(value_vect), resolution = 0.05, crs = crs_val$wkt)

# Rasterize
value_raster <- rasterize(value_vect, r_template, field = "var1.pred")
names(value_raster) <- input$quantity  #  variable name

# Write raster without normalization
writeRaster(value_raster,
            paste0("rasters/", input$site, "-", detectorname, "-", input$unitName, "-krig.tif"),
            overwrite = TRUE)


# Normalize raster values to [0, 1]
vals <- values(value_raster, mat = FALSE)
vals_scaled <- (vals - min(vals, na.rm = TRUE)) / (max(vals, na.rm = TRUE) - min(vals, na.rm = TRUE))

# Map scaled values to viridis colors
viridis_palette <- viridis(256)
index <- as.integer(vals_scaled * 255) + 1
index[is.na(index)] <- 1  # Replace NA to avoid errors
rgb <- col2rgb(viridis_palette[index])

# Create new RGB rasters
r <- setValues(rast(value_raster), rgb["red", ])
g <- setValues(rast(value_raster), rgb["green", ])
b <- setValues(rast(value_raster), rgb["blue", ])

# Create alpha raster (127 = 50% opacity, 0 = fully transparent)
alpha_vals <- ifelse(is.na(vals), 0, 255)
alpha <- setValues(rast(value_raster), alpha_vals)

#  Combine all bands
rgba_raster <- c(r, g, b, alpha)
names(rgba_raster) <- c("red", "green", "blue", "alpha")

#Write RGBA raster
writeRaster(rgba_raster, paste0("rasters/",input$site,"-",detectorname,"-",input$unitName,"-krig_rgb.tif"),
            datatype = "INT1U", overwrite = TRUE, gdal = c("ALPHA=YES"))
