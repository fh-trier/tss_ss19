# Installieren von
# Pakete einkommentieren sofern nicht durch library geladen werden können.
# install.packages("dplyr", repos = "https://ftp.gwdg.de/pub/misc/cran/")
# install.packages("histogram", repos = "https://ftp.gwdg.de/pub/misc/cran/")
# install.packages("mosaic", repos = "https://ftp.gwdg.de/pub/misc/cran/")

# Laden von Paketen
library(dplyr)
library(histogram)
library(mosaic)

# Aufgabe 1a
# Laden Sie den Datensatz eines Onlinehandels über den angegebenen Link in ein R-Studio-Script.
# - Sollte wohl eher heißen, laden Sie sich die Datei unter dem angegebenen Link herunter und
#   laden sie die Datensätze.
download.file(url = "https://www.dropbox.com/s/d0tbztusw1igtw0/onlineShop.csv?dl=1", destfile="uebung04.csv")
dataset <- read.csv(file = "uebung04.csv", header = TRUE, dec = ".", sep = ",")
View(dataset)

# Aufgabe 1b
# Interpretieren Sie die gegebenen Spalten im Sachzusammenhang.
str(dataset)      # Gibt an, welche Spalten innerhalb des Dataframes von welchem Datentyp sind.
summary(dataset)  # Gibt eine Zusammenfassung über das Dataframe aus.

# Aufgabe 1c
# Stellen Sie die Variable customer.package in einer passenden Grafik dar und interpretieren Sie
# diese im Sachzusammenhang.
plot(dataset$customer.package)

# Aufgabe 1d
# Stellen Sie die Variable lifetime.value in einer passenden Grafik dar unter interpretieren Sie
# diese im Sachzusammenhang.
plot(dataset$lifetime.value, type="o")

# Aufgabe 1e
# Stellen Sie die Variable last.order.time in einer passenden Grafik dar und interpretieren Sie
# diese im Sachzusammenhang.


# Aufgabe 1f
# Stellen Sie die Variable terminate in einer passenden Grafik dar und interpretieren Sie
# diese im Sachzusammenhang.


# Aufgabe 1g
# Lassen Sie sich ledeglich die Kunden mit dem customer.package "prime" anzeigen.
primeCustomers <- dataset %>%
  filter(customer.package == "prime")
View(primeCustomers)

# Aufgabe 1h
# Lassen Sie sich ledeglich die Kunden mit einem lifetime.value von mehr als 70.000 anzeigen.
richCustomers <- dataset %>%
  filter(lifetime.value > 70000)
View(richCustomers)

# Aufgabe 1i
# Lassen Sie sich von den Kunden mit einem Wohnort in "GER" nur die last.order.time und den
# last.order.value anzeigen.
customersPlaceOfResidence <- dataset %>%
  filter(place.of.residence == "GER") %>%
  select(last.order.time, last.order.value)
View(customersPlaceOfResidence)

# Aufgabe 1j
# Lassen Sie sich von den Kunden, die gekündigt haben, das customer.package und den
# lifetime.value anzeigen. Dabei sollen die Datensätze nach dem lifetime.value sortiert werden.
sortedRichTerminatedCustomers <- dataset %>%
  filter(terminate == "TRUE") %>%
  select(customer.package, lifetime.value) %>%
  arrange(lifetime.value)
View(sortedRichTerminatedCustomers)