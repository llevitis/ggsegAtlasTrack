library(ggplot2)

# ggseg ----
context("test-palettes")
test_that("check new palettes work", {
  expect_equal(length(brain_pal("atlastrack", package = "ggsegAtlasTrack")), 35)
  
  expect_error(brain_pal("atlastrack"), "not a valid")
  
  expect_true(all(names(brain_pal("atlastrack", package = "ggsegAtlasTrack")) %in% brain_regions(atlastrack)))
})

context("test-ggseg-atlas")
test_that("atlases are true ggseg atlases", {
  
  expect_true(is_brain_atlas(atlastrack))
  
})

context("test-ggseg")
test_that("Check that polygon atlases are working", {
  expect_is(ggseg(atlas = atlastrack),c("gg","ggplot"))
  
  expect_is(ggseg(atlas = atlastrack, mapping = aes(fill = region)),
            c("gg","ggplot"))
  
  expect_is(ggseg(atlas = atlastrack, mapping = aes(fill = region)) +
              scale_fill_brain("atlastrack", package = "ggsegAtlasTrack"),
            c("gg","ggplot"))
  
  expect_is(ggseg(atlas = atlastrack, mapping = aes(fill = region)) +
              scale_fill_brain("atlastrack", package = "ggsegAtlasTrack"),
            c("gg","ggplot"))
  
  expect_is(ggseg(atlas = atlastrack, mapping=aes(fill=region), adapt_scales = F ),c("gg","ggplot"))
  
})


# ggseg3d ----
context("test-ggseg3d")
test_that("Check that mesh atlases are working", {
  expect_is(
    ggseg3d(atlas=atlastrack_3d),
    c("plotly", "htmlwidget")
  )
})



context("test-ggseg3d-atlas")
test_that("atlases are true ggseg3d atlases", {
  
  expect_true(is_ggseg3d_atlas(atlastrack_3d))
  
})