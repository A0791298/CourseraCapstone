# library(ggplot2)
#
#
# eq = readr::read_delim("inst/extdata/signif.txt", delim = "\t")
# eq = eq_clean_data(eq)
# xmin = ISOdate(2006,1,1)
# xmax = ISOdate(2016,1,1)
# eq = dplyr::filter(
#   eq,
#   DATE >= xmin,
#   DATE <= xmax)
# countries = c("USA","CHINA")
#
# ggplot()+
#   geom_timeline_label(
#     data = dplyr::filter(eq, COUNTRY %in% countries),
#     nmax = 5,
#     aes(
#       label = LOCATION_NAME,
#       x=DATE,
#       y=COUNTRY,
#       size = EQ_PRIMARY))+
#   geom_timeline(
#     data = dplyr::filter(eq, COUNTRY %in% countries),
#     aes(
#       x=DATE,
#       y=COUNTRY,
#       size = EQ_PRIMARY,
#       colour = DEATHS))
#
#
# readr::read_delim("inst/extdata/signif.txt", delim = "\t") %>%
#   eq_clean_data() %>%
#   dplyr::filter(COUNTRY == "MEXICO" & lubridate::year(DATE) >= 2000) %>%
#   dplyr::mutate(popup_text = eq_create_label(.)) %>%
#   eq_map(annot_col = "popup_text")
