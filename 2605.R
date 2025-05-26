# INSTALAR O PACOTE

install.packages("GetBCBData")

# CARREGAR A BIBLIOTECA

library(GetBCBData)
library(tidyverse) # TAMBÉM É NECESSÁRIO

# INSTRUÇÕES DO PACOTE (VIGNETTE)
# https://cran.r-project.org/web/packages/GetBCBData/vignettes/GetBCBData-vignette.html

# OS CÓDIGOS DAS VARIÁVEIS VÊM DIRETO DA PLATAFORMA
# ACESSAR O SGS
 http://www.bcb.gov.br/?sgs

# EXEMPLO COM CDI
# METADADOS
# Taxa média de juros tendo como base as operações de emissão de Depósitos 
# Interfinanceiros pré-fixados, pactuadas por um dia útil, registradas e 
# liquidadas pelo sistema Cetip, considerando apenas operações do mercado 
#interbancário realizadas entre instituições de conglomerados diferentes 
# (Extra-grupo), desprezando-se as demais (Intra-Grupo).
 library(ggplot2)
 library(gganimate)
 library(dplyr)
 
 # Garantir que ref.date esteja no formato correto
 df.bcb <- df.bcb %>% 
   mutate(ref.date = as.Date(ref.date)) %>% 
   filter(!is.na(ref.date), !is.na(value))
 
 # Criar gráfico animado
 p_animado <- ggplot(df.bcb, aes(x = ref.date, y = value)) +
   geom_line(color = "steelblue", size = 1) +
   labs(
     title = 'Evolução da Base Monetária',
     subtitle = 'Data: {04/02/1991 a 16/05/2025}',
     x = 'Data',
     y = 'Base Monetária'
   ) +
   theme_light() +
   transition_reveal(ref.date)
 
 # Gerar animação
 animate(p_animado, width = 800, height = 500, fps = 20, duration = 10, renderer = gifski_renderer())
 
 # Salvar GIF (opcional)
 anim_save("base_monetaria.gif", animation = last_animation())
 