#send keys

RSelenium:::selKeys %>%
  names()

remDr$getActiveElement()
remDr$sendKeysToActiveElement(list(key = 'page_down'))
remDr$sendKeysToActiveElement(list(key = "page_up"))

remDr$sendKeysToActiveElement(list(key = 'down_arrow'))

remDr$executeScript("return window.scrpllY", args = list(1))
remDr$executeScript("return document.body.scrollHeight", args = list(1))
# window sizes
remDr$executeScript("return document.innerHeight", args = list(1))
remDr$executeScript("return document.innerWidth", args = list(1))


# note: 
# html_session()
# html_form()
# 
# docker run --name chrome  -d -p 4445:4444 -p 5901:5900 selenium/standalone-chrome-debug:latest
# 
# 
# tools used: docker, standalone-chrome, tightVNC


# corr getter
# corr name
# #anonCarousel1 .p13n-sc-truncated
product_name2 <- doc %>%
  html_nodes("#anonCarousel1 .p13n-sc-truncated") %>%
  html_text() %>%
  str_trim()

# corr star
# #anonCarousel1 .a-icon-alt
product_star2 <- doc %>%
  html_nodes("#anonCarousel1 .a-icon-alt") %>%
  html_text() %>%
  str_trim() %>%
  # convert string to number
  str_remove_all(" out of 5 stars") %>%
  as.numeric()

# corr price
# #anonCarousel1 .p13n-sc-price
product_price2 <- doc %>%
  html_nodes("#anonCarousel1 .p13n-sc-price") %>%
  html_text() %>%
  str_trim() %>%
  str_remove_all("£") %>%
  as.numeric() 

# # corr is prime
# # .a-icon-small
# (product_is_prime <- doc %>%
#   html_nodes(".a-icon-small") %>%
#   html_text() %>%
#   str_trim())

# corr n_rev
# #anonCarousel1 .a-size-small
product_n_rev2 <- doc %>%
  html_nodes("#anonCarousel1 .a-size-small") %>%
  html_text() %>%
  str_trim() %>%
  as.numeric()

corr_link <- doc %>%
  html_nodes(xpath = "/data-p13n-asin-metadata/a-link-normal") %>%
  html_attr("href")

out <- tibble(
  corr_link = corr_link,
  product = product_name2,
  star_rating = product_star2,
  price = product_price2,
  n_rev = product_n_rev2
)

return(out)





remDr$open()
remDr$navigate(corr_view$also_view[64])
get_product(corr_view$also_view[64],remDr)

doc <- get_html(remDr)

doc %>%
  html_nodes('.cm_cr_grid_center_container') %>%
  html_nodes(".a-icon-alt")


(link <- corr_view$also_view[1])