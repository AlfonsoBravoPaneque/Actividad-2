# Primero, se carga el dataset (data) que posee los datos de interés:

data <- read.csv("https://raw.githubusercontent.com/AlfonsoBravoPaneque/Actividad-2/refs/heads/main/Data/Dataset%20expresi%C3%B3n%20genes.csv")

# Seguidamente, se realizó un diagrama de cajas por cada gen para determinar su distribución de la expresión en función del tratamiento (A o B). Para automatizar todo el proceso se empleó un bucle for:

genes <- colnames(select(data, starts_with("AQ_"))) # Se guardan los genes en un vector de tipo carácter
box_plots <- list() # lista vacía que contendrá los diagramas de cajas

for (i in genes) { # bucle for que automatiza la generación de gráficas
  plots <- ggplot(data, aes_string(x = "trat", y = i)) +
    geom_boxplot(fill = c("#FF9999", "#99CCFF"), outlier.color = "black", outlier.size = 1.7,
                 width = 0.7, outlier.shape = 19) +
    labs(title = bquote(bold("Distribución de la expresión de " * .(i))), x = "Tratamiento",
         y = expression("Expresión" ~ phantom() ~ (2^(-DCt)))) +
    theme_classic() +
    theme(plot.title = element_text(family = "Arial", size = 14, hjust = 0.5),
          axis.title.x = element_text(family = "Arial", size = 12, margin = margin(5,0,0,0)),
          axis.title.y = element_text(family = "Arial", size = 12, margin = margin(0,5,0,0)),
          axis.text = element_text(family = "Arial", size = 10))
  
  box_plots[[i]] <- plots # se agrega cada gráfico del bucle a la lista
}

# Una vez realizao el bucle y contenido en la lista box_plots todos los diagramas de cajas de los genes presentes en el dataset, se puede realizar la visualización de estos plots gen por gen (los puntos en negro son los outliers):

# Gen ADIPOQ
box_plots[["AQ_ADIPOQ"]]

# Gen ALOX5
box_plots[["AQ_ALOX5"]]

# Gen ARG1
box_plots[["AQ_ARG1"]]

# Gen BMP2
box_plots[["AQ_BMP2"]]

# Gen CCL2
box_plots[["AQ_CCL2"]]

# Gen CCL5
box_plots[["AQ_CCL5"]]

# Gen CCR5
box_plots[["AQ_CCR5"]]

# Gen CD274
box_plots[["AQ_CD274"]]

# Gen CD36
box_plots[["AQ_CD36"]]

# Gen CHKA
box_plots[["AQ_CHKA"]]

# Gen CPT1A
box_plots[["AQ_CPT1A"]]

# Gen CSF2
box_plots[["AQ_CSF2"]]

# Gen CXCR1
box_plots[["AQ_CXCR1"]]

# Gen FASN
box_plots[["AQ_FASN"]]

# Gen FOXO3
box_plots[["AQ_FOXO3"]]

# Gen FOXP3
box_plots[["AQ_FOXP3"]]

# Gen G6PD
box_plots[["AQ_G6PD"]]

# Gen GPD2
box_plots[["AQ_GPD2"]]

# Gen GPX1
box_plots[["AQ_GPX1"]]

# Gen IFNG
box_plots[["AQ_IFNG"]]

# Gen IL10
box_plots[["AQ_IL10"]]

# Gen IL1B
box_plots[["AQ_IL1B"]]

# Gen IL6
box_plots[["AQ_IL6"]]

# Gen IRS1
box_plots[["AQ_IRS1"]]

# Gen JAK1
box_plots[["AQ_JAK1"]]

# Gen JAK3
box_plots[["AQ_JAK3"]]

# Gen LDHA
box_plots[["AQ_LDHA"]]

# Gen LIF
box_plots[["AQ_LIF"]]

# Gen MAPK1
box_plots[["AQ_MAPK1"]]

# Gen NFE2L2
box_plots[["AQ_NFE2L2"]]

# Gen NFKB1
box_plots[["AQ_NFKB1"]]

# Gen NLRP3
box_plots[["AQ_NLRP3"]]

# Gen NOS2
box_plots[["AQ_NOS2"]]

# Gen NOX5
box_plots[["AQ_NOX5"]]

# Gen PDCD1
box_plots[["AQ_PDCD1"]]

# Gen PPARG
box_plots[["AQ_PPARG"]]

# Gen PTAFR
box_plots[["AQ_PTAFR"]]

# Gen PTGS2
box_plots[["AQ_PTGS2"]]

# Gen SLC2A4
box_plots[["AQ_SLC2A4"]]

# Gen SOD1
box_plots[["AQ_SOD1"]]

# Gen SREBF1
box_plots[["AQ_SREBF1"]]

# Gen STAT3
box_plots[["AQ_STAT3"]]

# Gen TGFB1
box_plots[["AQ_TGFB1"]]

# Gen TLR3
box_plots[["AQ_TLR3"]]

# Gen TLR4
box_plots[["AQ_TLR4"]]

# Gen TNF
box_plots[["AQ_TNF"]]

