files <- list.files("data", pattern =".md$")
meta <- dplyr::tibble(file =files) |>
  dplyr::mutate(meta = stringr::str_remove_all(file, ".md$")) |>
  tidyr::separate(meta, c("source", "year", "page_from", "page_to"), sep= "_") |>
  dplyr::mutate(dplyr::across(3:5, ~as.numeric(.x))) |>
  dplyr::left_join(readr::read_csv("data/page_splits_manual_labels.csv"))



for (file in files){

  md_in <- readLines(file.path("data", file))
  md_in <- md_in |>
    stringr::str_replace_all("# C. <u>Section C: Timescale</u>", "# C. Section C: Timescale") |>
    stringr::str_replace_all("# D. <u>Section D: Performance</u>", "# D. Section D: Performance" ) |>
    stringr::str_replace_all("# C. <u>Section C: Timescale</u>[^2]", "# C. Section C: Timescale" ) |>
    stringr::str_replace_all("# A. <u>Section A: The Project</u>", "# A. Section A: The Project" ) |>
    stringr::str_replace_all("# A. <u>Section A: The Project</u>", "# A. Section A: The Project" ) |>
    stringr::str_replace_all("# B. <u>Section B: Cost</u>" , "# B. Section B: Cost") |>
    stringr::str_replace_all("# D. <u>Section D: Performance</u> - not applicable" , "# D. Section D: Performance - not applicable") |>
    stringr::str_replace_all("# C. Section C: Time" , "# C. Section C: Timescale") |>
    paste(collapse = "\n")
  write(md_in, file.path("data", file))
}

for (file in files){
  
  md_in <- readLines(file.path("data", file))
  md_in <- md_in |>
    stringr::str_replace_all("# C. Section C: Timescale\\[\\^2\\]" , "# C. Section C: Timescale") |>
    stringr::str_replace_all("# D. Section D: Performance - not applicable",  "# D. Section D: Performance - Not Applicable") |>
    stringr::str_replace_all("# E. <u>Section D: Performance</u>" , "# D. Section D: Performance") |>
    stringr::str_replace_all("# D. Section D: Performance - Not Applicable" , "# D. Section D: Performance – Not Applicable") |>
    stringr::str_replace_all("# D. Section D: Performance – not applicable" , "# D. Section D: Performance – Not Applicable") |>
    paste(collapse = "\n")
  write(md_in, file.path("data", file))
}

sections <- purrr::map_df(files, ~{
  file = .x
  md_in <- readLines(file.path("data", file))

  index <- tolower(md_in) |>
    stringr::str_detect("(?=.*#)(?=.*section)") |>
    which()
  
  label <- md_in[index]
  rows <- diff(c(index, length(md_in)))
  dplyr::tibble(file, label, index, rows)
  
})

sections |>
  dplyr::distinct(label) |>
  dplyr::pull()
