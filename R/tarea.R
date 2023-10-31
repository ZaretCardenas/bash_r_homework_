library(dplyr)
library(lubridate)




data <- read.csv('../data_procesada/archivo_final_hour2.csv',head=FALSE)
names(data)<-c("Genero_Usuario","Edad_Usuario","Bici","Ciclo_Estacion_Retiro",
               "Fecha_Retiro","Hora_only_retiro","Hora_Retiro","Ciclo_EstacionArribo"
               ,"Fecha_Arribo","Hora_only_arribo","Hora_Arribo")



data<- data%>% 
  mutate(
    arrival_date_f = strptime(paste(Fecha_Arribo, Hora_Arribo), "%d/%m/%Y %H:%M:%S"),
    departure_date_f = strptime(paste(Fecha_Retiro, Hora_Retiro), "%d/%m/%Y %H:%M:%S")
  )

print("¿Cuál es el tiempo promedio de recorrido?")

q1<-data%>%mutate(duration=difftime(arrival_date_f, departure_date_f, units = "mins"),
)%>%summarise(mean_time=mean(duration))
print(q1)

print("¿Cuál es el tiempo promedio de recorrido por sexo?")

data%>%mutate(duration =difftime(arrival_date_f, departure_date_f, 
              units = "mins"))%>%group_by(Genero_Usuario)%>%summarise(mean_time=mean(duration))


print("¿Cuál es el tiempo promedio de recorrido por hora? (responder con una gráfica)?")

data%>%mutate(duration =difftime(arrival_date_f, 
departure_date_f, units = "mins"))%>%group_by(Hora_only_retiro)%>%summarise(mean_time=mean(duration))

print("¿Cómo es la distribución de recorridos por día de la semana? (conteo por día)")


resumen_wd<- data%>%
  mutate(weekday =weekdays( as.Date(data$Fecha_Retiro, format = "%d/%m/%Y") ))%>%
  group_by(weekday)%>%summarise("conteo"=n())

resumen_wd

print("¿Cuáles son los recorridos más comunes y cómo se distribuye la frecuencia (or-dest)?")


data%>%group_by(Ciclo_Estacion_Retiro,Ciclo_EstacionArribo)%>%summarise("conteo"=n())


print("¿Cómo es la distribución de recorridos por día de la semana? (duracion media por día)")


resumen_wd<- data%>%
  mutate(weekday =weekdays( as.Date(data$Fecha_Retiro, format = "%d/%m/%Y")),duration =difftime(arrival_date_f, departure_date_f, units = "mins"))%>%
  group_by(weekday)%>%summarise('duracion'=mean(duration))

resumen_wd


print("¿Cual es la maxima duracion?")

resumen_wd<- data%>%
  mutate(weekday =weekdays( as.Date(data$Fecha_Retiro, format = "%d/%m/%Y")),duration =difftime(arrival_date_f, departure_date_f, units = "mins"))%>%summarise('duracion'=max(duration))

resumen_wd

print("¿Cual es la ruta con la mayoría de viajes?")

rutas=data%>%group_by(Ciclo_Estacion_Retiro,Ciclo_EstacionArribo)%>%summarise("conteo"=n())
rutas

print("¿Cual es la edad promedio por dia de la semana?")

resumen_wd<- data%>%
  mutate(weekday =weekdays( as.Date(data$Fecha_Retiro, format = "%d/%m/%Y")),
         Edad_Usuario= as.numeric(Edad_Usuario))%>%filter(!is.na(Edad_Usuario))%>%
  group_by(weekday)%>%summarise('edad'=mean(as.numeric(Edad_Usuario)))

resumen_wd

print("¿Cual es la edad promedio por hora")
resumen_wd<- data%>%
  mutate(weekday =weekdays( as.Date(data$Fecha_Retiro, format = "%d/%m/%Y")),
         Edad_Usuario= as.numeric(Edad_Usuario))%>%filter(!is.na(Edad_Usuario))%>%
  group_by(Hora_only_retiro)%>%summarise('edad'=mean(as.numeric(Edad_Usuario)))

resumen_wd







