## -----------------------------------------------------------------------------------------------------------------------------------------------------------------
library(metabolomicsWorkbenchR)
library(SummarizedExperiment)

# Query para obtener los datos del estudio ST000291
query_result <- do_query(
  context = "study", # Contexto de la consulta
  input_item = "study_id", # Item de entrada
  input_value = "ST000291", # Valor de entrada
  output_item = "SummarizedExperiment") # Item de salida
query_result


## -----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Guardamos el objeto contenedor con los datos y los metadatos en formato binario
save(query_result, file = "metabolomics_data_container.Rda")


## -----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Ver estructura general del dataset. Utilizamos max.level para simplificar la salida
str(query_result$AN000464, max.level = 3)


## -----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Extraemos y guardamos la matriz de intensidades de metabolitos
metabolite_data_positive <- assay(query_result$AN000464)
write.csv(metabolite_data_positive, "metabolomics_data_positive.csv", row.names = TRUE)

# Extraemos y guardamos los metadatos de las muestras
sample_metadata_positive <- colData(query_result$AN000464)
write.csv(sample_metadata_positive, "metabolomics_metadata_positive.csv", row.names = TRUE)

# Extraemos y guardamos los nombres y datos de los metabolitos
metabolite_metadata_positive <- rowData(query_result$AN000464)
write.csv(metabolite_metadata_positive, "metabolites_metadata_positive.csv", row.names = TRUE)


## -----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Extraemos y guardamos la matriz de intensidades de metabolitos
metabolite_data_negative <- assay(query_result$AN000465)
write.csv(metabolite_data_negative, "metabolomics_data_negative.csv", row.names = TRUE)

# Extraemos y guardamos los metadatos de las muestras
sample_metadata_negative <- colData(query_result$AN000465)
write.csv(sample_metadata_negative, "metabolomics_metadata_negative.csv", row.names = TRUE)

# Extraemos y guardamos los nombres y datos de los metabolitos
metabolite_metadata_negative <- rowData(query_result$AN000465)
write.csv(metabolite_metadata_negative, "metabolites_metadata_negative.csv", row.names = TRUE)


## -----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Ver estructura general del dataset
str(query_result$AN000465, max.level = 3) # Para el dataset de modo negativo


## -----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Ver los datos de muestra y resumen de la variable Treatment
col_data <- colData(query_result$AN000464)
col_data


## -----------------------------------------------------------------------------------------------------------------------------------------------------------------
rowData(query_result$AN000464)
cat("\n")
rowData(query_result$AN000465)


## -----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Obtener la matriz de intensidades y visualizar algunos datos
metabolite_data <- assay(query_result$AN000464)
summary(metabolite_data)


## -----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Librería para el PCA y visualización
library(ggplot2)

metabolite_data <- metabolite_data[complete.cases(metabolite_data), ]

# Calcular PCA
pca <- prcomp(t(metabolite_data), scale. = TRUE)
pca_df <- as.data.frame(pca$x)
pca_df$Treatment <- col_data$Treatment_

# Visualización PCA
ggplot(pca_df, aes(x = PC1, y = PC2, color = Treatment)) +
  geom_point() +
  labs(title = "PCA de las Muestras", x = "PC1", y = "PC2") +
  theme_minimal()

