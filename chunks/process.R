#space between white lines later in the maps
signif(((data %>% pull(value) %>% max()) - (data %>% pull(value) %>% min()))/2,1) -> ISObinwidth 
# Subsetting a dataframe by index of rows to be selected
# data[index_of_rows, columns_of_interest] (here we want to keep all columns)
data_sub <- data[sample(1:nrow(data), (nrow(data)/input$subsetting)),]
# Convert dataframe to an "sf" compatible object
data_sf_all <- st_as_sf(data, coords = c("lon", "lat"), crs = crs)
data_sf_sub <- st_as_sf(data_sub, coords = c("lon", "lat"), crs = crs)
# Remove duplicated locations:
# Based on https://github.com/r-spatial/sf/issues/669
d = st_is_within_distance(data_sf_all, dist=0.01) #originally 0.01
dupl = unlist(mapply(function(x,y) x[x < y], d, seq_along(d)))
if(length(dupl))data_sf <- data_sf_all[-dupl, ] else data_sf <- data_sf_all
# Transform to UTM
data_utm <- st_transform(data_sf, crs = input$utm)
# Produce perimeters and bboxes
site_perimeter_sf <- st_convex_hull(st_union(data_sf))
site_perimeter_utm <- st_convex_hull(st_union(data_utm))
bbox_sf <- st_bbox(data_sf)
bbox_utm <- st_bbox(data_utm)
# Generate grids covering the bounding box and cropped by the site's perimeter.
bbox_sf %>%
  st_as_stars(dx = input$resolution, dy = input$resolution) %>% 
  st_crop(site_perimeter_sf) -> grd_sf
bbox_utm %>%
  st_as_stars(dx = input$resolution, dy = input$resolution) %>%
  st_crop(site_perimeter_utm) -> grd_utm
