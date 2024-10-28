library(ggsegExtra)

# Make palette
brain_pals <- make_palette_ggseg(atlastrack_3d)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)
devtools::load_all(".")

# fix atlas
atlastrack_n <- as_ggseg_atlas(atlastrack)

atlastrack_n %>%
  ggseg(atlas = ., show.legend = TRUE,
        colour = "black",
        mapping = aes(fill=region)) +
  scale_fill_brain("atlastrack", package = "ggsegAtlasTrack", na.value = "grey")


atlastrack <- atlastrack_n
usethis::use_data(atlastrack,
                  internal = FALSE,
                  overwrite = TRUE,
                  compress="xz")