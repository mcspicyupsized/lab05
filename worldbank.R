library(dplyr)
library(tidyr)
library(readr)

# Load the CSV file
file_path <- 'C:/Users/itsss/Desktop/lab05/lab05/data/API_SP.POP.TOTL_DS2_en_csv_v2_45183.csv'
population_data <- read_csv(file_path, skip = 4)

# Inspect the first few rows to understand its structure
head(population_data)

# Clean column names
colnames(population_data) <- make.names(colnames(population_data), unique = TRUE)

# Reshape data to long format
population_long <- population_data %>%
  pivot_longer(cols = starts_with("X"),
               names_to = "Year",
               names_prefix = "X",
               values_to = "Population") %>%
  mutate(Year = as.integer(Year),
         Population = as.numeric(Population))

# Inspect the cleaned data
head(population_long)

# Save the cleaned data to a new CSV file
write_csv(population_long, "C:/Users/itsss/Desktop/lab05/lab05/new_data/cleaned_population_data.csv")
