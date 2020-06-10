test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


test_that("GeomTimeline works", {
  expect_equal(class(GeomTimeline)[[1]], "GeomTimeline")
})

test_that("GeomTimelineLabel works", {
  expect_equal(class(GeomTimelineLabel)[[1]], "GeomTimelineLabel")
})

test_that("eq_clean_data works", {
  expect_equal(
    nrow(
      eq_clean_data(
        suppressWarnings(readr::read_delim(
          system.file(
          "extdata",
          "signif.txt",
          package = "CourseraCapstone"),
          delim = "\t"))
        )
    ),
    6181
    )
})

test_that("eq_create_label works", {
  expect_equal(
    eq_create_label(
      eq_clean_data(
        suppressWarnings(
          readr::read_delim(
            system.file(
              "extdata",
              "signif.txt",
              package = "CourseraCapstone"),
            delim = "\t"))))[[1]],
    "<b>Location: </b>Bab-A-Daraa,Al-Karak<br><b>Magnitude: <b>7.3<br>")
})

test_that("eq_location_clean works", {
  expect_equal(
    eq_location_clean("This is an awful course")[[1]],
    "This Is An Awful Course")
})

test_that("eq_map works", {
  expect_equal(
    class(eq_map), "function")
})

test_that("geom_timeline works", {
  expect_equal(
    class(geom_timeline), "function")
})

test_that("geom_timeline_label works", {
  expect_equal(
    class(geom_timeline_label), "function")
})


