# Instalar os pacotes
install.packages("GetBCBData")
install.packages("tidyverse")
install.packages("gganimate")
install.packages("gifski")

# Carregar as bibliotecas
library(GetBCBData)
library(tidyverse)
library(ggplot2)
library(gganimate)
library(gifski)

# Acessar o SGS do Banco Central (opcional)
browseURL("http://www.bcb.gov.br/?sgs")

# Baixar dados da Base Monetária (exemplo: código 24364)
df.bcb <- gbcbd_get_series(id = 24364, first.date = '1991-02-04', last.date = '2025-05-16')

# Conferir os dados
head(df.bcb)

# Organizar e tratar os dados
df.bcb <- df.bcb %>% 
  mutate(ref.date = as.Date(ref.date)) %>% 
  filter(!is.na(ref.date), !is.na(value))

# Criar gráfico animado
p_animado <- ggplot(df.bcb, aes(x = ref.date, y = value)) +
  geom_line(color = "steelblue", size = 1) +
  labs(
    title = 'Evolução da Base Monetária',
    subtitle = 'Período: {frame_along}',
    x = 'Data',
    y = 'Base Monetária (R$)'
  ) +
  theme_light() +
  transition_reveal(ref.date)

# Gerar animação
animate(p_animado, width = 800, height = 500, fps = 20, duration = 10, renderer = gifski_renderer())

# Salvar GIF
anim_save("base_monetaria.gif", animation = last_animation())
