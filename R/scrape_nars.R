#' Scrape NARS data
#'
#' @param survey Survey name
#' @param year Survey year
#' @param parameter Survey parameter
#' @param type Data type; either data or metadata
#' @export

scrape_nars <- function(survey, year, parameter, type="data"){

  if(survey == "NLA"){
    survey <- "National Lakes Assessment (NLA)"
  }
  if(survey == "NCCA"){
    survey <-  "National Coastal Condition Assessment (NCCA)"
  }
  if(survey == "NRSA"){
    survey <-  "National Rivers and Stream Assessment (NRSA)"
  }
  if(survey == "NWCA"){
    survey <- "National Wetland Condition Assessment (NWCA)"
  }

  selection <- nars_links %>%
    dplyr::filter(survey_type == survey,
           survey_year == year,
           data == parameter)

  if(type == "data"){
    readr::read_csv(selection[[1, "data_url"]])
  } else if (type == "metadata"){
    read.delim(selection[[1, "metadata_url"]]) %>%
      select(2:3) %>%
      tibble::as_tibble()
  } else {
    "Type not supported. Use either 'data' or 'metadata'."
  }
}
