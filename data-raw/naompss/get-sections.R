files <- list.files("data", pattern =".md$")
meta <- dplyr::tibble(file =files) |>
  dplyr::mutate(meta = stringr::str_remove_all(file, ".md$")) |>
  tidyr::separate(meta, c("source", "year", "page_from", "page_to"), sep= "_") |>
  dplyr::mutate(dplyr::across(3:5, ~as.numeric(.x))) |>
  dplyr::left_join(readr::read_csv("data/page_splits_manual_labels.csv"))

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


meta |>
  dplyr::select(file, project = project_label, year) |>
  dplyr::left_join(
    sections |> dplyr::mutate(from = index, to = index+rows) |>
      dplyr::select(file, section = label, from, to)
  ) |>
  write.csv("data/sections.csv", row.names = FALSE)

