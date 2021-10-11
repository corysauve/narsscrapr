#' Package utilities


#' #' Scrape NARS data and metadata links
#' @export

get_nars_links <- function(){
  nars_base_url <- rvest::read_html("https://www.epa.gov/national-aquatic-resource-surveys/data-national-aquatic-resource-surveys/")

  nars_content <- nars_base_url %>%
    rvest::html_table(fill = TRUE)

  nars_table <- nars_content[[1]]

  # Get data links
  nars_data <- nars_base_url %>%
    rvest::html_nodes("table tr")%>%
    rvest::html_nodes(xpath = "//td[3]") %>%
    rvest::html_nodes("a") %>%
    rvest::html_attr("href")

  nars_table$data_links <- nars_data

  # Get metadata links
  nars_metadata <- nars_base_url %>%
    rvest::html_nodes("table tr") %>%
    rvest::html_nodes(xpath="//td[4]") %>%  ## xpath
    rvest::html_nodes("a") %>%
    rvest::html_attr("href")

  nars_table[nars_table$Metadata %in% "", "Metadata"] <- NA
  nars_table[!is.na(nars_table$Metadata), "metadata_links"] <- nars_metadata

  nars_table <- nars_table %>% janitor::clean_names()
}
