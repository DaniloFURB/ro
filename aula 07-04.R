unique(dadosfoodexport$iso2c)
dadosfoodexport %>%
filter(iso2c == "BR")
# Baixar o painel (sem o Brasil)
dadospainel_sembr <- WDI(country = 'all',
                         indicator = 'TX.VAL.FOOD.ZS.UN') %>%
  filter(iso2c != "BR", !is.na(TX.VAL.FOOD.ZS.UN))

# Baixar os dados do Brasil separadamente
dadosbr <- WDI(country = 'BR',
               indicator = 'TX.VAL.FOOD.ZS.UN') %>%
  filter(!is.na(TX.VAL.FOOD.ZS.UN))

# Adicionar variável de destaque
dadospainel_sembr <- dadospainel_sembr %>%
  mutate(destacar_brasil = "Outros")

dadosbr <- dadosbr %>%
  mutate(destacar_brasil = "Brasil")

# Unir os dados
dadosfoodexport <- bind_rows(dadospainel_sembr, dadosbr)

grafpainel <- ggplot(dadosfoodexport,
                     aes(x = year,
                         y = TX.VAL.FOOD.ZS.UN,
                         color = destacar_brasil)) +
  geom_point(alpha = 0.7, size = 2) +
  scale_color_manual(
    values = c("Brasil" = "red", "Outros" = "#95a5a6"),
    name = "País"
  ) +
  labs(
    title = "Exportações de Alimentos (% do Total de Exportações)",
    x = "Ano",
    y = "Exportações de Alimentos (%)",
    caption = "Fonte: World Bank (WDI)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 18),
    axis.title = element_text(face = "bold"),
    legend.position = "bottom"
  )
print(grafpainel)


library(WDI)
library(ggplot2)
library(dplyr)

# Baixar os dados de 2023
dadosfoodexport2023 <- WDI(country = 'all',
                           indicator = 'TX.VAL.FOOD.ZS.UN',
                           start = 2023, end = 2023)

# Filtrar os dados válidos e destacar Brasil
dadosfoodexport2023 <- dadosfoodexport2023 %>%
  filter(!is.na(TX.VAL.FOOD.ZS.UN)) %>%
  mutate(destacar_brasil = ifelse(iso2c == "BR", "Brasil", "Outros"))

# Gráfico de barras: países no eixo X, valores no Y
grafcort <- ggplot(dadosfoodexport2023,
                   aes(x = reorder(country, TX.VAL.FOOD.ZS.UN), 
                       y = TX.VAL.FOOD.ZS.UN,
                       fill = destacar_brasil)) +
  geom_col(show.legend = FALSE) +
  scale_fill_manual(values = c("Brasil" = "red", "Outros" = "#2980b9")) +
  labs(
    title = "Exportações de Alimentos em 2023 (% do Total de Exportações)",
    x = "País",
    y = "Exportações de Alimentos (%)",
    caption = "Fonte: World Bank (WDI)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_blank(),  # esconde os nomes dos países se forem muitos
    plot.title = element_text(face = "bold", hjust = 0.5, size = 18),
    axis.title = element_text(face = "bold")
  )

print(grafcort)

library(ggplot2)
library(WDI)
library(dplyr)

# Baixar os dados do Brasil
dadosfoodexportbr <- WDI(country = 'BR',
                         indicator = 'TX.VAL.FOOD.ZS.UN')

# Filtrar valores válidos
dadosfoodexportbr <- dadosfoodexportbr %>%
  filter(!is.na(TX.VAL.FOOD.ZS.UN))

# Gráfico da série temporal
grafserie <- ggplot(dadosfoodexportbr,
                    mapping = aes(x = year,
                                  y = TX.VAL.FOOD.ZS.UN)) +
  geom_line(color = "red", size = 1.2) +
  geom_point(color = "red", size = 2) +
  labs(
    title = "Exportações de Alimentos do Brasil (% do Total de Exportações)",
    x = "Ano",
    y = "Exportações de Alimentos (%)",
    caption = "Fonte: World Bank (WDI)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 18),
    axis.title = element_text(face = "bold")
  )

print(grafserie)