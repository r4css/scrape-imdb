# Install Packages
install.packages(c("rvest", "tidyverse"))

# Load Packages
library(rvest)
library(tidyverse)

# Set URL
url <- read_html("https://www.imdb.com/search/title/?title_type=feature&primary_language=id&sort=year,asc&start=1")
url

# Mendapatkan Judul Film
judul_film <- url %>%
  html_elements(".lister-item-header a") %>%
  html_text()

# Mendapatkan Tahun Rilis
tahun_rilis <- url %>%
  html_elements(".text-muted.unbold") %>%
  html_text()

# Mendapatkan daftar sutradara
sutradara <- url %>%
  html_elements(".text-muted+ p a:nth-child(1)") %>%
  html_text()

# Buat sebagai sebuah data frame (Eror karena ada informasi sutradara yang kosong)
film_indonesia <- tibble(
  judul_film = judul_film,
  tahun_rilis = tahun_rilis,
  sutradara = sutradara
)

# Silahkan lanjut ke 002_fix-missing-data-problem.R
