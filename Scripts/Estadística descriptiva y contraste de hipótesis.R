#Cargamos el dataset (data) con nuestros datos de interes:

data <- read.csv("https://raw.githubusercontent.com/AlfonsoBravoPaneque/Actividad-2/refs/heads/main/Data/Dataset%20expresi%C3%B3n%20genes.csv")

df_genes <- select(data, trat, tumor, starts_with("AQ_")) # con select() de dplyr se selecciona lo deseado

table_2 <- df_genes %>%
  tbl_strata(
    strata = trat, # se estratifican los datos por tratamiento
    .tbl_fun = ~ .x %>%
      tbl_summary(
        by = tumor, # se agrupan los datos por tumor
        statistic = all_continuous() ~ "{median} ({p25} - {p75})", # se calcula la mediana y el RIC
        type = all_continuous() ~ "continuous",
        digits = all_continuous() ~ function(x) format(x, digits = 3, scientific = TRUE) # formato científico
      ) %>%
      add_p( # se añade una columna con el p valor
        test = list(all_continuous() ~ "kruskal.test"), # se emplea la prueba de Krustal-Wallis
        pvalue_fun = ~ style_pvalue(.x, digits = 3)  
      )
  )

table_2_gt <- table_2 %>%
  as_gt() %>% # se convierte la tabla a un objeto gt para poder personalizarla
  tab_header( # se agrega el título a la tabla
    title = md("**Tabla 2. Estadísticas descriptivas y contraste de hipótesis de los genes 
               según el tipo de tumor y tratamiento.**")
  ) %>%
  cols_label( # se nombra la columna
    label = md("**Genes**")
  ) %>%
  tab_options( # se configura el aspecto global de la tabla
    table.border.top.style = "none",
    table.border.bottom.style = "none",
    table.font.style = "Arial",
    column_labels.background.color = "gray",
    heading.align = "left"
  ) %>%
  tab_style( # se aplican estilos personalizados
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
      ),
      cells_column_spanners(
        spanners = everything()
      )
    )
  ) %>%
  tab_style( # se aplican estilos personalizados
    cell_text(
      align = "center",
      v_align = "middle"
    ),
    locations = cells_column_labels(
      columns = label
    )
  ) %>%
  cols_align( # se alinean las columnas al centro
    align = "center"
  ) %>%
  tab_footnote( # se introduce una nota al pie de la tabla
    footnote = "Los valores p fueron calculados empleando la prueba de Krustal-Wallis."
  )

table_2_gt
