# assigning the values to objects so they are ready to use

mu_0 <- 500
sigma <- 100
n <- 64
xbar <- 530

alpha <- .05

# compute z-test statistic (xbar - mu_0)/(sigma/sqrt(n))

se <- sigma/sqrt(n)

z_test_stat <- (xbar - mu_0)/se

z_test_stat

p_value <- 2 * (1 - pnorm(abs(z_test_stat)))

p_value


# critical values for a two-tail test with a .05 alpha

z_crit_lower <- qnorm(.05/2)

z_crit_upper <- qnorm(1 - alpha/2)

z_crit_lower

z_crit_upper


# Berkley Admissions

data("UCBAdmissions")

str(UCBAdmissions)

summary(UCBAdmissions)

ucb_df <- as.data.frame(UCBAdmissions)

head(ucb_df)

# Overall gender admit / reject

overall_table <- xtabs(Freq ~ Gender + Admit, data = ucb_df)

overall_table 

# chi-test for the overall table

chisqu_overall <- chisq.test(overall_table, correct = FALSE)

chisqu_overall

# create a table that includes departments

table_3d <- xtabs(Freq ~ Admit + Gender + Dept, data = ucb_df)

table_3d

# helper function to go department by department

admit_rates <- function(tab_AG) {
        #tab_AG: rows = admit, columns = gender
        admitted <- tab_AG["Admitted",]
        totals <- colSums(tab_AG)
        rates <- admitted / totals
        return(rates)
        }

# admit rates for each department

rates_A <- admit_rates(table_3d[ , , "A"])
rates_B <- admit_rates(table_3d[ , , "B"])
rates_C <- admit_rates(table_3d[ , , "C"])
rates_D <- admit_rates(table_3d[ , , "D"])
rates_E <- admit_rates(table_3d[ , , "E"])
rates_F <- admit_rates(table_3d[ , , "F"])

rates_A
rates_B
rates_C
rates_D
rates_E
rates_F

# chi sq by department

chisq_A <- chisq.test(table_3d[ , , "A"], correct = FALSE)
chisq_B <- chisq.test(table_3d[ , , "B"], correct = FALSE)
chisq_C <- chisq.test(table_3d[ , , "C"], correct = FALSE)
chisq_D <- chisq.test(table_3d[ , , "D"], correct = FALSE)
chisq_E <- chisq.test(table_3d[ , , "E"], correct = FALSE)
chisq_F <- chisq.test(table_3d[ , , "F"], correct = FALSE)

chisq_A 
chisq_B 
chisq_C 
chisq_D 
chisq_E 
chisq_F 


ucb_df
