
## Introducción
El código de bash se encuentra en la carpeta file que cuenta con la siguiente estructura:

```bash 
├── R
│   └── Tarea_.qmd
├── R-Readme.md
├── aux_info
│   └── links.txt
├── bash
│   ├── 1_get_links
│   ├── 2_download_info
│   ├── 3_preprocess
│   ├── 4_conteos_rows
│   ├── 5_category_summary
│   ├── 6_continue_summary
│   ├── 7_split_hour
│   ├── check_headers
│   └── get_linksw_op2
├── bash-Readme.md
├── data
│   ├── 2020-12.csv
│   ├── 2022-08.csv
│   ├── _output
│   ├── ecobici_2022_10.csv
│   ├── ecobici_2022_11.csv
│   ├── ecobici_2022_12.csv
│   ├── ecobici_2023_01.csv
│   ├── ecobici_2023_02.csv
│   ├── ecobici_2023_03.csv
│   ├── ecobici_2023_04.csv
│   ├── ecobici_2023_05.csv
│   ├── ecobici_2023_06.csv
│   ├── ecobici_2023_07.csv
│   ├── ecobici_2023_08.csv
│   ├── ecobici_2023_09.csv
│   └── test.txt
└── data_procesada
    ├── archivo_final.csv
    ├── archivo_final_hour1.csv
    └── archivo_final_hour2.csv
```

El codigo en el file bash realiza las siguientes acciones:

- 1_get_links: Obtine los links de ecobici y los coloca en la carpeta aux_info como links.txt
- 2_download_info: Dessacarga la información de cada link en  links.txt y lo guarda en data 
- 3_preprocess: Elimina los headers de cada file, los concatena y los guarda en data_procesada como archivo_final.csv
- 4_conteos_rows: Cuenta los registros de  archivo_final.csv y todos los contenidos en data
- 5_category_summarys: Conteo por categoria de 
- 6_continue_summary: Media y varianza de edad y hora 
- 7_split_hour: Obtiene la información de la hora , substrayendolo de las columnas Hora_Arribo,Hora_Retiro y las coloca .Primero substrae Hora_Arribo y se guarda en data_procesada/archivo_final_hour1.csv, despues, Hora_Retiro  y se guarda en data_procesada/archivo_final_hour2.csv 

              




