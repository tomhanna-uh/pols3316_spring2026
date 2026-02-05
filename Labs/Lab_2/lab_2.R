# load the data from last lab

my_data_columns <- read.csv("data/my_data_columns.csv")

# View the data

View(my_data_columns)

# find the means and medians of each column

column_means_columns <- apply(my_data_columns, 2, mean)

column_medians_columns <- apply(my_data_columns, 2, median)



# Now, let's find the variances of each column

column_variances <- apply(my_data_columns, 2, var)

column_standard_deviations <- apply(my_data_columns, 2, sd)

# Create a table with all the statistics

statistics_table <- data.frame(
        Mean = column_means_columns,
        Median = column_medians_columns,
        Variance = column_variances,
        Standard_Deviation = column_standard_deviations
)

statistics_table

## Load USArrests data in a dataframe called Arrests

Arrests <- USArrests

# View the Arrests data

View(Arrests)

# Display the column names of Arrests

colnames(Arrests)

# display the means of the variables

mean(Arrests$Murder)
mean(Arrests$Assault)
mean(Arrests$UrbanPop)
mean(Arrests$Rape)

# display the medians of the variables

median(Arrests$Murder)
median(Arrests$Assault)
median(Arrests$UrbanPop)
median(Arrests$Rape)

# display the standard deviations of the variables

sd(Arrests$Murder)
sd(Arrests$Assault)
sd(Arrests$UrbanPop)
sd(Arrests$Rape)

# display the variances of the variables
var(Arrests$Murder)
var(Arrests$Assault)
var(Arrests$UrbanPop)
var(Arrests$Rape)

# load tidyverse

library(tidyverse)

# define the URL we want to read

url <- "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv"

# read the data from the URL into a dataframe called gapminder_data

gapminder_data <- read_tsv(url)

# View the gapminder_data

View(gapminder_data)

# get the colnames

colnames(gapminder_data)

# use apply to find the means of the numeric columns

numeric_columns <- gapminder_data %>% select(where(is.numeric))








