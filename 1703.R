#install.packages("WDI")
#library(WDI)
WDIsearch('gdp')

#baixar dados do pib

GDP (current US$)(NY.GDP.MKTP.CD)
COD_GDP <- WDIsearch('gdp')
options(scipen = 999)
basepib <- WDI(country = "all",
               indicator = 'NY.GDP.MKTP.CD',
               start = 2023, end = 2023)


