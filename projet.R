# Charger les packages nécessaires
library(maps)
library(ggplot2)
library(lubridate)
library(ggmap)
library(dplyr)
library(tidyverse)

# Chargement des données depuis le fichier CSV
donnees <- read.csv("C:/Téléchargements/FRW00034048 (1).csv", stringsAsFactors = FALSE)

# Conversion de la colonne "DATE" en format de date
donnees$DATE <- as.Date(donnees$DATE, format = "%Y-%m-%d")

donnees$TAVG <- as.numeric(donnees$TAVG)

# Charger les données de la carte de la France
france <- map_data("france")

# Créer un objet ggplot en utilisant les données de la carte de la France
p <- ggplot() + 
  geom_polygon(data = france, aes(x = long, y = lat, group = group), fill = "lightgrey", color = "grey")

# Ajouter un point sur Châteauroux
p <- p + geom_point(aes(x = 1.6815, y = 46.8095), color = "red", size = 3) + annotate("text", x = 1.75, y = 47.20, label = "Châteauroux", color = "darkblue", size = 3)

# Ajouter Paris
p <- p + geom_point(aes(x = 2.3522, y = 48.5866), color = "red", size = 3) + annotate("text", x = 2.35, y = 49.00, label = "Paris", color = "darkblue", size = 3)  

# Ajouter Reims
p <- p + geom_point(aes(x = 4.0324, y = 49.2583), color = "red", size = 3) + annotate("text", x = 4.05, y = 49.70, label = "Reims", color = "darkblue", size = 3)

# Afficher la carte
print(p)


# Visualisation de la distribution des températures minimales (TMIN)
ggplot(donnees, aes(x = TMIN)) +
  geom_histogram(binwidth = 2, fill = "lightblue", color = "black") +
  labs(title = "Distribution des températures minimales",
       x = "Température minimale (°C)",
       y = "Nombre d'occurrences")

# Visualisation de la relation entre la température maximale (TMAX) et la précipitation (PRCP)
ggplot(donnees, aes(x = TMAX, y = PRCP)) +
  geom_point(color = "darkblue") +
  labs(title = "Relation entre la température maximale et la précipitation",
       x = "Température maximale (°C)",
       y = "Précipitation (mm)")

# Visualisation de la relation entre la température minimale (TMIN) et la température maximale (TMAX)
ggplot(donnees, aes(x = TMIN, y = TMAX)) +
  geom_point(color = "darkgreen") +
  labs(title = "Relation entre la température minimale et la température maximale",
       x = "Température minimale (°C)",
       y = "Température maximale (°C)")

# Visualisation de la relation entre la température minimale (TMIN) et la précipitation (PRCP)
ggplot(donnees, aes(x = TMIN, y = PRCP)) +
  geom_point(color = "darkred") +
  labs(title = "Relation entre la température minimale et la précipitation",
       x = "Température minimale (°C)",
       y = "Précipitation (mm)")

# Visualisation de la distribution des températures maximales (TMAX)
ggplot(donnees, aes(x = TMAX)) +
  geom_histogram(binwidth = 2, fill = "lightgreen", color = "black") +
  labs(title = "Distribution des températures maximales",
       x = "Température maximale (°C)",
       y = "Nombre d'occurrences")

# Visualisation de la distribution de la vitesse du vent (WSFG)
ggplot(donnees, aes(x = WSFG)) +
  geom_histogram(binwidth = 2, fill = "lightgray", color = "black") +
  labs(title = "Distribution de la vitesse du vent",
       x = "Vitesse du vent (km/h)",
       y = "Nombre d'occurrences")

# Visualisation de la relation entre la température moyenne (TAVG) et la vitesse du vent (WSFG)
ggplot(donnees, aes(x = TAVG, y = WSFG)) +
  geom_point(color = "darkorange") +
  labs(title = "Relation entre la température moyenne et la vitesse du vent",
       x = "Température moyenne (°C)",
       y = "Vitesse du vent (km/h)")

# Visualisation de la relation entre la température maximale (TMAX) et la température moyenne (TAVG)
ggplot(donnees, aes(x = TMAX, y = TAVG)) +
  geom_point(color = "purple") +
  labs(title = "Relation entre la température maximale et la température moyenne",
       x = "Température maximale (°C)",
       y = "Température moyenne (°C)")

# Visualisation de la relation entre la précipitation (PRCP) et la vitesse du vent (WSFG)
ggplot(donnees, aes(x = PRCP, y = WSFG)) +
  geom_point(color = "darkgray") +
  labs(title = "Relation entre la précipitation et la vitesse du vent",
       x = "Précipitation (mm)",
       y = "Vitesse du vent (km/h)")

# Visualisation de la distribution de la pression atmosphérique (PRCP)
ggplot(donnees, aes(x = PRCP)) +
  geom_histogram(binwidth = 2, fill = "lightpink", color = "black") +
  labs(title = "Distribution de la pression atmosphérique",
       x = "Pression atmosphérique (hPa)",
       y = "Nombre d'occurrences")

# Visualisation de la distribution de la couverture nuageuse (CLDD)
ggplot(donnees, aes(x = CLDD)) +
  geom_histogram(binwidth = 2, fill = "lightyellow", color = "black") +
  labs(title = "Distribution de la couverture nuageuse",
       x = "Couverture nuageuse (%)",
       y = "Nombre d'occurrences")

