## Data Loading

# this command loads the reader package and needs to be in the script

library(readr) 

# This command will load the data from the csv file into a new data frame
# called my_data_loaded

my_data_loaded <- read_csv("data/my_data.csv")

# load the tidyverse

library(tidyverse)

# define the web address or URL to the Gapminder dataset

url <- "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv"

# read the data from the URL into a dataframe called gapminder_data

gapminder_data <- read_tsv(url)

# load the vdemdata package
library(vdemdata)

# load the 5 main vdem indices and some economic data for the year 2014 into a dataframe called vdem_indices_2014
vdem_indices_2014 <- vdemdata::vdem %>%
        filter(year == 2014) %>%
        select(country_name, v2x_polyarchy, v2x_libdem, v2x_partipdem, v2x_delibdem, v2x_egaldem, e_gdppc, e_cow_exports, e_cow_imports, e_gdp, e_pop)

View(vdem_indices_2014)  

vdem_indices_2014 <- vdem_indices_2014 %>%
        rename(
                country = country_name,
                polyarchy = v2x_polyarchy,
                liberal_democracy = v2x_libdem,
                participatory_democracy = v2x_partipdem,
                deliberative_democracy = v2x_delibdem,
                egalitarian_democracy = v2x_egaldem,
                gdp_per_capita = e_gdppc,
                exports = e_cow_exports,
                imports = e_cow_imports,
                gdp = e_gdp,
                population = e_pop
        )

## Data Visualization

# load ggplot2

library(ggplot2)


# from my_data_loaded create a simple scatterplot of X1 versus X2

ggplot(my_data_loaded, aes(x = X1, y = X2)) +
        geom_point() +
        labs(title = "Scatterplot of X1 vs X2", x = "X1", y = "X2")


# create a histogram of the values in X5 in my_data_loaded


ggplot(my_data_loaded, aes(x = X1)) +
        geom_histogram(binwidth = 1) +
        labs(title = "Histogram of X5", x = "X5", y = "Frequency")



# create a simple scatter plot of gdp per capita vs polyarchy from vdem_indices_2014

ggplot(vdem_indices_2014, aes(x = gdp_per_capita, y = polyarchy)) +
        geom_point() +
        labs(title = "Scatterplot of GDP per Capita vs Polyarchy", x = "GDP per Capita", y = "Polyarchy")

# create a simple dot plot of gdp per capita from vdem_indices_2014

ggplot(vdem_indices_2014, aes(x = gdp_per_capita)) +
        geom_dotplot(binwidth = 10) +
        labs(title = "Dot Plot of GDP per Capita", x = "GDP per Capita", y = "Frequency")



# create a histogram of the gdp per capita variable logged from vdem_indices_2014

ggplot(vdem_indices_2014, aes(x = log(gdp_per_capita))) +
        geom_histogram(binwidth = 0.5) +
        labs(title = "Histogram of Log GDP per Capita", x = "Log GDP per Capita", y = "Frequency")

# create a histogram of the polyarchy variable from vdem_indices_2014 with some color

ggplot(vdem_indices_2014, aes(x = polyarchy)) +
        geom_histogram(binwidth = 0.1, fill = "blue", color = "black") +
        labs(title = "Histogram of Polyarchy", x = "Polyarchy", y = "Frequency")


# create a scatter plot of gdp per polyarchy vs gdp per capita from vdem_indices_2014 with some color and size aesthetics create a scatter plot of gdp 
# per capita vs polyarchy from vdem_indices_2014 with an lm line

ggplot(vdem_indices_2014, aes(x = gdp_per_capita, y = polyarchy)) +
        geom_point(aes(color = country, size = population)) +
        geom_smooth(method = "lm", se = FALSE) +
        labs(title = "Scatterplot of GDP per Capita vs Polyarchy with LM Line", x = "GDP per Capita", y = "Polyarchy") +
        theme(legend.position = "none")


## create a scatter plot of liberal democracy vs exports from vdem_indices_2014 with some color and size aesthetics create a scatter plot
# with an lm line

ggplot(vdem_indices_2014, aes(x = liberal_democracy, y = imports)) +
        geom_point(aes(color = country, size = population)) +
        geom_smooth(method = "lm", se = FALSE) +
        labs(title = "Scatterplot of Liberal Democracy vs Imports", 
        x = "Liberal Democracy", y = "Imports") + 
        theme(legend.position = "none")



## create a histogram of lifeExp from the gapminder_data dataset
## overlay it with a normal distribution curve with the same mean and standard deviation as the lifeExp variable

ggplot(gapminder_data, aes(x = lifeExp)) +
        geom_histogram(aes(y = ..density..), binwidth = 5, fill = "green", color = "black") +
        stat_function(fun = dnorm, args = list(mean = mean(gapminder_data$lifeExp), sd = sd(gapminder_data$lifeExp)), color = "red", size = 1) +
        labs(title = "Histogram of Life Expectancy with Normal Curve", x = "Life Expectancy", y = "Density")

