

#' eq_location_clean
#' @importFrom stringr str_to_title
#' @importFrom stringr str_trim
#' @importFrom stringi stri_locate_last
#' @param v string to clean
#' @return seperate representation of string
#' @examples
#' eq_location_clean("hello")
#' @export
eq_location_clean = Vectorize(function(v){
   stringr::str_to_title(
   stringr::str_trim(
   substr(v,
          if(is.na(stringi::stri_locate_last(
             v,
               fixed = ":")[1]))
             0
          else
           stringi::stri_locate_last(
             v,
             fixed = ":")[1]+1,
          nchar(v))))})

#' eq_clean_data
#' @importFrom dplyr mutate
#' @param data NOAA data frame
#' @return seperate representation data
#' @examples
#' \dontrun{eq_clean_data(data)}
#' @export
eq_clean_data = function(data){
 dplyr::mutate(
   .data = data,
   DATE = ISOdate(data$YEAR, data$MONTH, data$DAY),
   LONGITUDE = as.numeric(data$LONGITUDE),
   LATITUDE = as.numeric(data$LATITUDE),
   EQ_PRIMARY = as.numeric(data$EQ_PRIMARY),
   DEATHS = as.numeric(data$DEATHS),
   LOCATION_NAME = eq_location_clean(data$LOCATION_NAME))}


