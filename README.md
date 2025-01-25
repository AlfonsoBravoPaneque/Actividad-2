
| Autores | Alfonso Bravo Paneque, Laura Fort Aznar, Mauricio David Izquierdo Pérez y Judit Ponce Casañas|
:--------------------------------------------------------------------------------------------------------|:-

# **Actividad-2**

### **Propósito**

<div align="justify">
  
Este repositorio fue creado como parte de la actividad grupal de la asignatura Introducción a la Programación científica del máster de bioinformática ofertado por la UNIR. Para llevar a cabo esta actividad, se utilizó el material de la asignatura Estadística y R para Ciencias de la Salud del mismo máster, empleando el *dataset* y parte del material complementario de dicha asignatura. La mayoría de los análisis llevados a cabo en este repositorio se pueden consultar en estos documentos realizados por los integrantes del repositorio: [documento 1](https://www.dropbox.com/scl/fi/1moktcqw9vqmbzwtumz8x/Actividad_1-Bravo-Paneque-Alfonso.html?rlkey=h58416u2guqwcdw3108sx4f65&st=bfr0568z&dl=0), [documento_2](https://www.dropbox.com/scl/fi/oejgl0itbulhgmjtixd0g/Actividad_2-Bravo_Paneque_Alfonso.html?rlkey=l8ul2ubrkb08l6pll03yozs91&st=lfl8txxi&dl=0), [documento_3](https://www.dropbox.com/scl/fi/rgc7ngwyvjv315mke7pwo/Ponce_Casa-as_Judit_Act1.html?rlkey=xf9kgvtttifooc9a9jrqlf8uy&st=z7z1o7an&dl=0), [documento_4](https://www.dropbox.com/scl/fi/9nfvzjerkbv9mtlz2qyaf/Ponce_Casa-as_Judit_Actividad2.html?rlkey=ztbcklcg2w849ryxp7o6qf0zr&st=40uofzhw&dl=0), [documento_5](https://www.dropbox.com/scl/fi/ji7fre8wgndgdroldteqb/Actividad1_MauricioIzquierdo.html?rlkey=j8v621onlnc7t3qxab8pbxduv&st=uzoiqg34&dl=0), [documento_6](https://www.dropbox.com/scl/fi/2mbuclb03hiqx3p867dyi/Actividad2_Mauricio-Izquierdo.html?rlkey=iwe9q1nwekxjzlpy9aoxmn83t&st=k94g5gm2&dl=0), [documento_7](https://www.dropbox.com/scl/fi/i2kb943k2r39elq47g9l9/mubio02_act1_laurafort.html?rlkey=ladjz52tj0gklpcg19niz0bei&st=jpy0ub6h&dl=0).

</div>


### **Objetivos**

<div align="justify">

- Familiarizarnos con el uso de Git y su interfaz GitHub como herramientas de control de versiones y colaboración en este proyecto bioinformático de análisis de un dataset de pacientes.
- Crear nuestro repositorio con sus archivos y carpetas y aprender a editar en sus respectivas ramas.
- Promover la colaboración y el trabajo en equipo a través de la creación de un repositorio compartido.
- Utilizar y estudiar un *dataset* con diferentes muestras de pacientes y expresiones de genes para analizar la distribución de los genes según el tipo de tratamiento recibido, visualizar su comportamiento mediante *heatmaps*, determinar si siguen una distribución normal, y realizar los respectivos tests estadísticos para identificar si hay algún gen de interés que presente diferencias significativas en función del tipo de tratamiento y tumor. 

</div>


### **Estructura de las carpetas**

📁 **Bibliography/:**

<div align="justify">

La carpeta [*Bibliography*](https://github.com/AlfonsoBravoPaneque/Actividad-2/tree/main/Bibliography) contienel bilbiografía empleada para llevar a cabo los análisis de este repositorio.

</div>

📁 **Data/:**

<div align="justify">

La carpeta [*Data*](https://github.com/AlfonsoBravoPaneque/Actividad-2/tree/main/Data) contiene el *dataset* titulado [Dataset expresión genes.csv](https://github.com/AlfonsoBravoPaneque/Actividad-2/blob/main/Data/Dataset%20expresi%C3%B3n%20genes.csv), el cual recopila información sobre la expresión de 46 genes en 65 pacientes, obtenida mediante qPCR (PCR en tiempo real). Cada paciente está clasificado según distintos tipos de tratamiento (A o B) y características tumorales, incluyendo el tipo de tumor y su extensión.

Además de las variables principales de interés, el *dataset* también incluye información adicional de cada paciente, como variables bioquímicas, sintomáticas y sociodemográficas, que aunque no son el foco principal del estudio pueden ser de utilidad para análisis complementarios.

</div>


📁 **Images/:**

<div align="justify">

La carpeta [*Images*](https://github.com/AlfonsoBravoPaneque/Actividad-2/tree/main/Images) contiene a su vez diferentes carpetas con los resultados proporcionados por los diferentes *scripts* presentes en el respositorio.

-  La carpeta *Genes_distribution_box_plots* incluye diagramas de cajas (*box plots*) que muestran la expresión de cada gen en función del tratamiento seguido por los pacientes (A o B).
-  La carpeta *Heatmaps* contiene mapas de calor (*heatmaps*) de expresión génica, representando la expresión de cada gen por paciente.
-  La carpeta *Normality* almacena una tabla con el análisis de normalidad de los genes, realizado mediante el test de Anderson-Darling.
-  La carpeta *Descriptive_statistics_and_hypothesis_testing* incluye una tabla descriptiva estratificada por tipo de tratamiento (A o B) y agrupada por tipos de tumor: colorrectal (CCR), pulmón (CP) y mama (CM).

</div>

📁 **Scripts/:**

<div align="justify">

La carpeta [*Scripts*](https://github.com/AlfonsoBravoPaneque/Actividad-2/tree/main/Scripts) contiene el código, en lenguaje R, empleado para el análisis del conjunto de datos. 
El código se organiza en cuatro ficheros independientes. Cada fichero corresponde a cada uno de los estudios realizados sobre los datos. 

- El fichero *Normalidad_genes.R* contiene un análisis de Anderson-Darling para determinar la normalidad de los genes, proporcionando resultados útiles para la posterior selección de las pruebas estadísticas. La tabla generada puede encontrarse en la carpeta *Normality*, dentro de la carpeta *Images*.
- El fichero *Distribución_genes_según_tratamiento.R* genera diagramas de cajas (*box plots*) que muestran la expresión diferencial para cada gen en función del tratamiento aplicado. Los *box plots* están almacenados en la carpeta *Genes_distribution_box_plots*, dentro de la carpeta *Images*.
- El fichero *Heatmaps_expresión_génica.R* genera los mapas de calor (*heatmaps*) de expresión génica, almacenados en la carpeta *Heatmaps* dentro de la carpeta *Images*.
- El fichero *Librerías_empleadas.R* recoge todas las librerías empleadas que son necesarias para la realización de los estudios.
- El fichero *Estadística_descriptiva_y_contraste_hipótesis_genes.R* recoge los análisis descriptivos realizados empleando la mediana y el rango intercuartílico. La tabla generada puede encontrarse en la carpeta *Descriptive_statistics_and_hypothesis_testing*, dentro de la carpeta *Images*.

Los scripts permiten el análisis de los datos, facilitando la interpretación y generación de resultados reproducibles. 

</div> 

### **Bibliografía**

<div align="justify">

[Tema_4_Bioestadística](https://cms.unir.net/file/=MXdv12b552buFmJmAEQmYyN3cjMycTN/esl-ES)

[Tema_5_Bioestadística](https://cms.unir.net/file/=MXdv12b552buFmJmAEQmYSM4gTOxYTN/esl-ES)

[Tema_6_Bioestadística](https://cms.unir.net/file/=MXdv12b552buFmJmAEQmYSM4gTOxYTN/esl-ES)

</div> 




