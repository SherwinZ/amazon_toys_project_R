
# My error:
# Selenium message:sendKeysToActiveElement
# Build info: version: '3.141.59', revision: 'e82be7d358', time: '2018-11-14T08:25:53'
# System info: host: '834b49b2b1a9', ip: '172.17.0.2', os.name: 'Linux', os.arch: 'amd64', os.version: '4.14.141-boot2docker', java.version: '1.8.0_222'
# Driver info: driver.version: unknown
# 
# Error: 	 Summary: UnknownCommand
# Detail: The requested resource could not be found, or a request was received using an HTTP method that is not supported by the mapped resource.
# Further Details: run errorDetails method

############################################################

# initiate the browser in docker
# docker run --name chrome  -d -p 4445:4444 -p 5901:5900 selenium/standalone-chrome-debug:latest

############################################################
library(tidyverse)
library(RSelenium)

remDr$open()
remDr$navigate("http://www.amazon.co.uk/Hornby-R8150-Catalogue-2015/dp/B00S9SUUBE")
remDr$sendKeysToActiveElement(list(key = "page_down"))


remDr$close()