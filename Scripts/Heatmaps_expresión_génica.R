#Carga del dataset
data <- read.csv("https://raw.githubusercontent.com/AlfonsoBravoPaneque/Actividad-2/refs/heads/main/Data/Dataset%20expresi%C3%B3n%20genes.csv") #carga del dataset

#Se establece una semilla de repetición, de modo que los resultados sean reproducibles. 
set.seed(1995)

#Se seleccionan las columnas del dataset que contienen la expresión génica, es decir, todas aquellas columnas cuyo nombre empieza por "AQ_"
datos <- select(data, id, starts_with("AQ_"))

#Se toma la columna id como nombre de las filas del dataset
datos <- column_to_rownames(datos, var ="id") 

#Se escalan los datos para estandarizar la expresión
datos_escalados <- scale(datos)

#Transposición del dataset
datos_escalados_t <- t(datos_escalados)

#Se comrpueba que los datos no presenten valores infinitos, NA o NaN
anyNA(datos_escalados)
any(is.nan(datos_escalados))
any(is.infinite(datos_escalados))

#Generación del heatmap
pheatmap(datos_escalados,
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         color = colorRampPalette(c("plum", "white", "red"))(100),
         main = "Heatmap de expresión génica",
         fontsize = 10,
         cutree_rows = 3,
         cutree_cols = 3)

# Eliminación de los genes NOX5 y ADIPOQ, que muestran una expresión diferencial en el paciente 14. 
datos2 <-select(data, id, starts_with("AQ_"), -"AQ_NOX5",-"AQ_ADIPOQ") 

datos2 <- column_to_rownames(datos2, var ="id") #Columna id como nombre de filas del dataset

datos_escalados2 <- scale(datos2) #Escalado de datos
datos_escalados_t2 <- t(datos_escalados2) #Transposición de datos

#Se comrpueba que los datos no presenten valores infinitos, NA o NaN
anyNA(datos_escalados_t2)
any(is.nan(datos_escalados_t2))
any(is.infinite(datos_escalados_t2))

#Heatmap
pheatmap(datos_escalados_t2,
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         color = colorRampPalette(c("plum", "white", "red"))(100),
         main = "Heatmap de expresión génica",
         fontsize = 10,
         cutree_rows = 3,
         cutree_cols = 3)
