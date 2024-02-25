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
  wrong_headers <- text_in[wrong_header]
  if(length(wrong_headers)>0){
    error <- stringr::str_extract(wrong_headers, "^##\\s[A-Z]\\.[1-9]\\s")
    replacement <- paste0(trimws( stringr::str_extract(wrong_headers, "^##\\s[A-Z]\\.[1-9]\\s")),". ")
    text_in[wrong_header] <- stringr::str_replace(wrong_headers , error, replacement)
  }
  
  text_in |> paste(collapse = "\n") |> write(file)
}

for(file in file.path(d, f)){
  text_in <- readLines(file)
  
  header <- stringr::str_detect(text_in, "^#\\s|^#{2}\\s|^#{3}\\s|")
  text_in[header] <- tools::toTitleCase(text_in[header])
  
  text_in |> paste(collapse = "\n") |> write(file)
}

for(file in file.path(d, f)){
  text_in <- readLines(file)
  wrong_header <- stringr::str_detect(text_in, "^#.\\.\\s[a-z]")
  wrong_headers <- text_in[wrong_header]
  if(length(wrong_headers)>0){
    error <- stringr::str_extract(wrong_headers, "^#.\\.\\s[a-z]")
    replacement <- paste0(substr(error, 1, nchar(error)-1), toupper(substr(error, nchar(error), nchar(error))))
    text_in[wrong_header] <- stringr::str_replace(wrong_headers , error, replacement)
  }
  
  text_in |> paste(collapse = "\n") |> write(file)
}

for(file in file.path(d, f)){
  text_in <- readLines(file)
  
  header <- stringr::str_detect(text_in, "^# SECTION 1: ABOUT the PROJECT")
  text_in[header] <- "# SECTION 1: ABOUT THE PROJECT"
  
  text_in |> paste(collapse = "\n") |> write(file)
}

for(file in file.path(d, f)){
  text_in <- readLines(file)
  
  header <- stringr::str_detect(text_in, "^# SECTION 5: HISTORY UP to MAIN GATE APPROVAL")
  text_in[header] <- "# SECTION 5: HISTORY UP TO MAIN GATE APPROVAL"
  
  text_in |> paste(collapse = "\n") |> write(file)
}


for(file in file.path(d, f)){
  text_in <- readLines(file)
  wrong_header <- stringr::str_detect(text_in, "^##\\s[A-Z]\\.[0-9]\\.[0-9]\\s")
  wrong_headers <- text_in[wrong_header]
  if(length(wrong_headers)>0){
    error <- stringr::str_extract(wrong_headers, "^##\\s[A-Z]\\.[0-9]\\.[0-9]\\s")
    replacement <- paste0(substr(error, 1, nchar(error)-1), ". ")
    text_in[wrong_header] <- stringr::str_replace(wrong_headers , error, replacement)
  }
  
  text_in |> paste(collapse = "\n") |> write(file)
}
