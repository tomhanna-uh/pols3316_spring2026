# load tidyverse in case needed

library(tidyverse)

# You will need to load the datasets we used in the last two labs by whichever method
# worked for you - see the Lab 2 and 3 instructions and the Canvas Announcement 
# https://canvas.uh.edu/courses/27445/pages/lab-3-error-fixes

# after the data is loaded...


# find the correlation and covariance for exports and polyarchy from v-dem
# find the correlation and covariance for lifeExp and pop from gapminder_data

# get variable names for the three files

colnames(gapminder_data)

colnames(vdem_indices_2014)



# look at the help for the cov() function

?cov

?cor

# get the covariances and correlations and store them as 1 for the vdem
# and 2 for the gapminder

cov1 <- cov(vdem_indices_2014$exports, vdem_indices_2014$polyarchy,
            use = "pairwise.complete.obs")
cor1 <- cor(vdem_indices_2014$exports, vdem_indices_2014$polyarchy,
            use = "pairwise.complete.obs")

cov2 <- cov(gapminder_data$lifeExp, gapminder_data$pop,
            use = "pairwise.complete.obs")
cor2 <- cor(gapminder_data$lifeExp, gapminder_data$pop,
            use = "pairwise.complete.obs")


# create a data frame with the results



stats_df <- data.frame(
        Dataset = c("V-Dem 2014", "Gapminder"),
        Covariance = c(cov1, cov2),
        Correlation = c(cor1, cor2)
)

# produce a table from the dataframe using stargazer

library(stargazer)

stargazer(stats_df,
          summary = FALSE,
          rownames = FALSE,
          type = "text")  # or "text"/"html"


## correlation matrix of V-dem data (vdem_indices_2014) in table

# if needed - remove the comment from the install.packages, run it, and either 
# delete or recomment it. You can also just copy it to the console without the 
# comment (#) and hit enter
# install.packages("corrplot")

library(dplyr)
library(corrplot)

# we have to remove the non-numeric variables to avoid errors

# keep only numeric variables
vdem_num <- vdem_indices_2014 %>% 
        select(where(is.numeric))

# correlation matrix (Pearson, pairwise complete obs)
cor_mat <- cor(vdem_num, use = "pairwise.complete.obs", method = "pearson")

# view as a table in console
round(cor_mat, 2)

stargazer(cor_mat, type = "text", title = "Correlation Matrix of V-Dem 2014 Variables", align = TRUE)

# produce a simple correlogram with pairs()

pairs(vdem_num)



# basic correlogram with corrplot

corrplot(cor_mat)

# slightly nicer: only upper triangle, clustered
corrplot(
        cor_mat,
        method = "color",
        type   = "upper",
        order  = "hclust",
        addCoef.col = "black",   # add correlation coefficients
        tl.col = "black",        # text label color
        tl.srt = 45              # text rotation
)




vdem_indices_2014 <- read_csv("data/vdemdata.csv")