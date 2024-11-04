# Metadatos del dataset de Metabolómica

## Descripción general del dataset

Este dataset, identificado como ST000291, se ha obtenido de la base de datos Metabolomics Workbench y contiene información metabolómica de muestras recolectadas para un análisis experimental. El dataset se ha descargado y está organizado en dos subconjuntos de datos en el contenedor `SummarizedExperiment`.

## Fuente del dataset

- **Fuente**: Metabolomics Workbench
- **Identificador del Estudio**: ST000291
- **Contexto**: Este estudio se ha utilizado como caso de uso en la documentación de `fobitools`, un paquete de Bioconductor para análisis metabolómicos.

## Descripción del dataset

- **Número de Muestras**: 45
- **Número Total de Metabolitos**:
  - Modo Positivo: 1786 metabolitos
  - Modo Negativo: 747 metabolitos

## Estructura de los datos

Cada subconjunto (modo positivo y modo negativo) se ha almacenado en un contenedor `SummarizedExperiment`, que organiza las intensidades de los metabolitos y los metadatos asociados.

### Subconjunto modo positivo (AN000464)

- **ID del Análisis**: AN000464
- **Dimensiones**: 1786 metabolitos x 45 muestras
- **Metadatos**:
  - **data_source**: Fuente de datos, Metabolomics Workbench
  - **study_id**: ST000291
  - **description**: Descripción de cada muestra y tratamiento
  - **subject_type**: Tipo de sujeto o muestra
- **Datos de Metabolitos**:
  - **rownames**: ID único para cada metabolito
  - **rowData**:
    - `metabolite_name`: Nombre del metabolito
    - `metabolite_id`: ID del metabolito en PubChem o KEGG
    - `refmet_name`: Nombre de referencia
- **Datos de las Muestras**:
  - **colnames**: IDs únicos para cada muestra
  - **colData**:
    - `local_sample_id`: ID de la muestra en el estudio
    - `study_id`: ID del estudio (ST000291)
    - `raw_data`: Ruta o referencia a los datos crudos
    - `Treatment_`: Grupo de tratamiento al que pertenece cada muestra

### Subconjunto modo negativo (AN000465)

- **ID del Análisis**: AN000465
- **Dimensiones**: 747 metabolitos x 45 muestras
- **Metadatos**:
  - **data_source**: Fuente de datos, Metabolomics Workbench
  - **study_id**: ST000291
  - **description**: Descripción de cada muestra y tratamiento
  - **subject_type**: Tipo de sujeto o muestra
- **Datos de Metabolitos**:
  - **rownames**: ID único para cada metabolito
  - **rowData**:
    - `metabolite_name`: Nombre del metabolito
    - `metabolite_id`: ID del metabolito en PubChem o KEGG
    - `refmet_name`: Nombre de referencia
- **Datos de las Muestras**:
  - **colnames**: IDs únicos para cada muestra
  - **colData**:
    - `local_sample_id`: ID de la muestra en el estudio
    - `study_id`: ID del estudio (ST000291)
    - `raw_data`: Ruta o referencia a los datos crudos
    - `Treatment_`: Grupo de tratamiento al que pertenece cada muestra 

## Referencias

- **Metabolomics Workbench**: [https://www.metabolomicsworkbench.org/](https://www.metabolomicsworkbench.org/)
