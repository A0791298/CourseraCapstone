#' GeomTimelineLabel
#' @importFrom ggplot2 Geom
#' @importFrom ggplot2 ggproto
#' @importFrom ggplot2 aes
#' @importFrom dplyr top_n
#' @return geom timeline label class
#' @export

GeomTimelineLabel =
  ggplot2::ggproto("GeomTimelineLabel",
    ggplot2::Geom,
    required_aes =
      c("x","label"),
    default_aes =
      ggplot2::aes(
        y = 0,
        fontsize = 10,
        rot = 45,
        hjust = 0,
        size = 7,
        nmax = Inf),
    draw_panel = function(data, params, coord) {
      data =   dplyr::top_n(
        dplyr::group_by(
          data,
          y),
        n = nmax,
        wt = size)
      coords = coord$transform(data, params)

      labels =
        grid::textGrob(
          label = coords$label,
          x = coords$x,
          y = coords$y + 0.075,
          rot = coords$rot,
          hjust = coords$hjust,
          gp = grid::gpar(
            fontsize = coords$fontsize)
        )

      lines =
        grid::polylineGrob(
          x = unit(
            c(
            coords$x,
            coords$x),
          "npc"),
          y = unit(
            c(
              coords$y,
              coords$y+0.065),
            "npc"),
          id = rep(
            1:dim(coords)[1], 2),
          gp = grid::gpar(
            col = "grey")
        )

      grid::gList(labels,lines)
      })

#' geom_timeline_label
#' @importFrom ggplot2 layer
#' @param mapping ggplot item
#' @param data ggplot item
#' @param stat ggplot item
#' @param position ggplot item
#' @param na.rm ggplot item
#' @param show.legend ggplot item
#' @param inherit.aes ggplot item
#' @param ... ggplot item
#' @return geom timeline label function
#' @examples
#' \dontrun{geom_timeline_label()}
#' @export

geom_timeline_label = function(mapping = NULL, data = NULL, stat = "identity",
                               position = "identity", na.rm = FALSE, show.legend = NA,
                               inherit.aes = TRUE, ...) {
  layer(
    geom = GeomTimelineLabel, mapping = mapping,  data = data, stat = stat,
    position = position, show.legend = FALSE, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...))}








