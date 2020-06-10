#' eq_map
#' @importFrom leaflet addCircleMarkers
#' @importFrom leaflet addTiles
#' @importFrom leaflet leaflet
#' @param data data
#' @param annot_col name of the HTML column
#' @return A leaflet map with earthquakes and annotations.
#' @examples
#' \dontrun{eq_map(eq,"name")}
#' @export

eq_map <- function(data, annot_col) {
  leaflet::addCircleMarkers(
    leaflet::addTiles(
      leaflet::leaflet()),
    lat = data$LATITUDE,
    lng = data$LONGITUDE,
    radius = data$EQ_PRIMARY,
    weight = 1,
    popup = data[[annot_col]])
}

#' eq_create_label
#' @param data A data frame containing cleaned NOAA earthquake data
#' @return HTML label string
#' @examples
#' \dontrun{eq_create_label("hello")}
#' @export

eq_create_label <- function(data) {
  paste0(
    ifelse(
      is.na(data$LOCATION_NAME),
      "",
      paste0(
        "<b>Location: </b>",
        data$LOCATION_NAME,
        "<br>")),
    ifelse(
      is.na(data$EQ_PRIMARY),
      "",
      paste0(
        "<b>Magnitude: <b>",
        data$EQ_PRIMARY,
        "<br>")),
    ifelse(
      is.na(data$TOTAL_DEATHS),
      "",
      paste0(
        "<b>Total deaths: ",
        data$TOTAL_DEATHS,
        "<br>"))
  )
  }



