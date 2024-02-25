d <- "data-raw/naomprss/"
f <- list.files(d, ".md$")
for(file in file.path(d, f)){
  text_in <- readLines(file)
  wrong_header <- stringr::str_detect(text_in, "^#\\s[A-G]\\.[1-9]\\s")
  text_in[wrong_header] <- paste0("#", text_in[wrong_header])
  text_in |> paste(collapse = "\n") |> write(file)
}

for(file in file.path(d, f)){
  text_in <- readLines(file)
  wrong_header <- stringr::str_detect(text_in, "^#\\s[A-G]\\.[1-9]\\.[1-9]\\s")
  text_in[wrong_header] <- paste0("##", text_in[wrong_header])
  text_in |> paste(collapse = "\n") |> write(file)
}


for(file in file.path(d, f)){
  text_in <- readLines(file)
  text_in <- stringr::str_remove_all(text_in, "\\<u\\>|\\</u\\>")
  text_in |> paste(collapse = "\n") |> write(file)
}


for(file in file.path(d, f)){
  text_in <- readLines(file)
  wrong_header <- stringr::str_detect(text_in, "^[A-Z]\\. Section [A-Z]")
  text_in[wrong_header] <- paste("#", text_in[wrong_header])
  text_in |> paste(collapse = "\n") |> write(file)
}


for(file in file.path(d, f)){
  text_in <- readLines(file)
  wrong_header <- stringr::str_detect(text_in, "^[A-Z].Section [A-Z]") 
  text_in[wrong_header] <- paste("#", text_in[wrong_header])
  text_in |> paste(collapse = "\n") |> write(file)
}


for(file in file.path(d, f)){
  text_in <- readLines(file)
  wrong_header <- stringr::str_detect(text_in, "^#\\s[A-Z]\\s")
  wrong_headers <- text_in[wrong_header]
  if(length(wrong_headers)>0){
    error <- stringr::str_extract(wrong_headers, "^#\\s[A-Z]\\s")
    replacement <- paste0(trimws( stringr::str_extract(wrong_headers, "^#\\s[A-Z]\\s")),". ")
    text_in[wrong_header] <- stringr::str_replace(wrong_headers , error, replacement)
  }
  
  text_in |> paste(collapse = "\n") |> write(file)
}

for(file in file.path(d, f)){
  text_in <- readLines(file)
  wrong_header <- stringr::str_detect(text_in, "^##\\s[A-Z]\\.[1-9]\\s")
  text_in[wrong_header] <- paste0(trimws(text_in[wrong_header]), ".")
  text_in |> paste(collapse = "\n") |> write(file)
}
# 
# 
# 
# for(file in file.path(d, f)){
#   text_in <- readLines(file)
#   text_in <- stringr::str_replace(text_in, "^#\\s[A-Z]\\s", "^#\\s[A-Z]\\.") 
#   text_in |> paste(collapse = "\n") |> write(file)
# }
# 
# 
# for(file in file.path(d, f)){
#   text_in <- readLines(file)
#   text_in <- stringr::str_replace(text_in, "^#\\s[A-Z]\\s", "^#\\s[A-Z]\\.") 
#   text_in |> paste(collapse = "\n") |> write(file)
# }


