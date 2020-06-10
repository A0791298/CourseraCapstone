#' GeomTimeline
#' @importFrom ggplot2 Geom
#' @importFrom ggplot2 ggproto
#' @importFrom ggplot2 aes
#' @return geom timeline class
#' @export

GeomTimeline =
  ggplot2::ggproto("GeomTimeline",
    ggplot2::Geom,
    required_aes =
      c("x"),
    default_aes =
      ggplot2::aes(
        y = 0,
        size = 7,
        alpha = 0.5),
    draw_panel = function(data, params, coord) {
      coords = coord$transform(data, params)
      grid::pointsGrob(
        x = coords$x,
        y = coords$y,
        pch = 16,
        size = unit(coords$size,"mm"),
        gp =  grid::gpar(
          col = coords$colour,
          alpha = coords$alpha))})


#' geom_timeline
#' @importFrom ggplot2 layer
#' @return geom timeline function
#' @param mapping ggplot item
#' @param data ggplot item
#' @param stat ggplot item
#' @param position ggplot item
#' @param na.rm ggplot item
#' @param show.legend ggplot item
#' @param inherit.aes ggplot item
#' @param ... ggplot item
#' @examples
#' \dontrun{geom_timeline()}
#' @export

geom_timeline = function(mapping = NULL, data = NULL, stat = "identity",
                          position = "identity", na.rm = FALSE, show.legend = NA,
                          inherit.aes = TRUE, ...) {
  ggplot2::layer(
    geom = GeomTimeline, mapping = mapping,  data = data, stat = stat,
    position = position, show.legend = FALSE, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...))}
