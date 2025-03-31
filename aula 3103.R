API (FORMA DE ACESSO)
# DADOS DO BANCO MUNDIAL (WORLD BANK)
# WORLD DEVELOPMENT INDICATORS (BASE DE DADOS)

# NA AULA PASSADA, ACESSAMOS OS DADOS DO PIB
# PRODUTO INTERNO BRUTO

library(WDI) # CARREGAR A BIBLIOTECA/PACOTE

options(scipen = 999) # AJUSTA A NOT. CIENT.

# DADOS EM PAINEL
dadosfoodexport <- WDI(country = 'all',
                indicator = 'TX.VAL.FOOD.ZS.UN')
# CORTE TRANSVERSAL
dadosfoodexport2023 <- WDI(country = 'all',
                    indicator = 'TX.VAL.FOOD.ZS.UN',
                    start = 2023, end = 2023)
# SÉRIE TEMPORAL
dadosfoodexportbr <- WDI(country = 'BR',
                  indicator = 'TX.VAL.FOOD.ZS.UN')

# graficos
#install.packages("tidyverse")
#library(tidyverse)
#grafpainel
grafpainel <- ggplot(dadosfoodexport,
                     mapping = aes(y = TX.VAL.FOOD.ZS.UN, 
                                  x = year)) +
    geom_point()
  print(grafpainel)
                              

  #grafcort
  grafcort <- ggplot(dadosfoodexport23,
                       mapping = aes(y = TX.VAL.FOOD.ZS.UN, 
                                     x = year)) +
    geom_point()
  print(grafcort)         
  
   print(grafcort)
        
   
   #grafserie
   grafserie <- ggplot(dadosfoodexportbr,
                        mapping = aes(y = TX.VAL.FOOD.ZS.UN, 
                                      x = year)) +
     geom_line()
   print(grafserie)