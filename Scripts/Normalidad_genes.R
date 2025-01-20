#Cargamos el dataset (data) con nuestros datos de interes:

data <- read.csv("https://raw.githubusercontent.com/AlfonsoBravoPaneque/Actividad-2/refs/heads/main/Data/Dataset%20expresi%C3%B3n%20genes.csv")

#Comprobamos la normalidad de los genes
#Para determinar si los genes siguen una distribución normal utilizamos la prueba de Anderson-Darling (ya que el tamaño muestral N>50). 
#La hipótesis nula (H0) es que los datos siguen una distribución normal o paramétrica (p > 0.05), y la alternativa (H1) es que siguen una distribución no normal o no paramétrica (p <= 0.05).

p_values_ad_g <- matrix(NA, nrow = 46, ncol = 1) #generamos matriz vacía

genes <- select(data, starts_with("AQ_")) #seleccionamos los genes
all_genes <- c(colnames(genes)) #vector tipo caracter con todos los nombres de los genes

for (i in 1:length(all_genes)) { #bucle for para obtener los p valores
  ad_result_g <- ad.test(data[[all_genes[i]]])
  p_values_ad_g[i,1] <- ad_result_g$p.value
}

p_values_ad_g_df <- as.data.frame(p_values_ad_g) #data.frame
colnames(p_values_ad_g_df) <- "Valor_p"
p_values_ad_g_4digits <- signif(p_values_ad_g_df, digits = 4) #dígitos significativos

data_table1 <- p_values_ad_g_4digits %>% #añadimos y renombramos las columnas
  dplyr::mutate(
    Interpretacion = if_else(Valor_p > 0.05,
                             "Se acepta la H0: los datos siguen una distribución normal",
                             "Se acepta la H1: los datos siguen una distribución no normal"
    ),
    Test_utilizado = "Prueba de Anderson-Darling",
    Genes = all_genes)

data_table1_sorted <- data_table1 %>% 
  select(Genes, Test_utilizado, Valor_p, Interpretacion) #ordenamos las columnas

table_1 <- data_table1_sorted %>%
  gt() %>% #convertimos a objeto gt para poder personalizar la tabla
  tab_header(
    title = md("**Tabla 1. Evaluación de la normalidad de los datos de expresión génica.**")
  ) %>%
  cols_label(
    Genes = md("**Genes**"),
    Test_utilizado = md("**Test utilizado**"),
    Valor_p = md("**Valor p**"),
    Interpretacion = md("**Interpretación**")
  ) %>%
  tab_options(
    table.border.top.style = "none",
    table.border.bottom.style = "none",
    table.font.style = "Arial",
    column_labels.background.color = "gray",
    heading.align = "left"
  ) %>%
  tab_style( 
    style = cell_borders(
      sides = c("left", "right", "top", "bottom"),
      color = "gainsboro",
      weight = px(1.6)
    ),
    locations = cells_body(
      columns = everything()
    )
  ) %>%
  tab_style( 
    style = cell_borders(
      sides = c("left", "right", "top", "bottom"),
      color = "gainsboro",
      weight = px(1.6)
    ),
    locations = list(
      cells_body(
        columns = everything()
      ),
      cells_column_labels(
        columns = everything()
      )
    )
  ) %>%
  cols_align( # se alinean las columnas al centro
    align = "center"
  ) %>%
  tab_footnote(
    footnote = "p valores obtenidos con la prueba de Anderson-Darling."
  )

table_1
