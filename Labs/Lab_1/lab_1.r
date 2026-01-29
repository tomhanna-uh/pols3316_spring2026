# First we will add some data creating 2 vectors using the c() function

first_vector <- c(1, 2, 3, 4, 5)
second_vector <- c(6, 7, 8, 9, 10)

# Next we will combine these two vectors into a matrix using the rbind() function

combined_matrix <- rbind(first_vector, second_vector)

# Now I am going to purposely create an error so you can see how error handling works in R

third_vector <- c(11, 12, 13)  # This vector has a different length

# Attempt to combine the third vector with the existing matrix

combined_matrix2 <- rbind(combined_matrix, third_vector)

# The above line will produce an error because the lengths of the vectors do not match.

# To fix this, we need to ensure that all vectors have the same length before combining them into a matrix.

fourth_vector <- c(11, 12, 13, 14, 15)  # Now this vector has the same length

# Now we can successfully combine all three vectors into a matrix

combined_matrix3 <- rbind(combined_matrix, fourth_vector)

# Print the final combined matrix
# The final output will be a matrix with three rows and five columns


combined_matrix3

# Now I want to turn this matrix into one of the basic objects in R, a data frame

my_data <- data.frame(combined_matrix3)
my_data

# Finally, I will save this data frame to a CSV file in the data folder using the write.csv() function

write.csv(my_data, file = "data/my_data.csv", row.names = TRUE)  # This will create a file named my_data.csv in the data directory with row names


# Now that we have some data, let's do some basic statistical operations on it

# we can find the mean of the first vector a couple of ways
# one is to use the sum function and the length function

mean_first_vector <- sum(first_vector) / length(first_vector)

mean_first_vector

# another way is to use the built-in mean function

mean_first_vector2 <- mean(first_vector)
mean_first_vector2

# we can also find the median of the second vector using the median function

median_second_vector <- median(second_vector)
median_second_vector

# we can also create a table of the means and medians for each row in the data frame

means <- apply(my_data, 1, mean)
medians <- apply(my_data, 1, median)
stats_table <- data.frame(Means = means, Medians = medians)
stats_table

# That apply function is very useful for applying a function to rows or columns of a data frame or matrix
# But how do you use it?
# The easiest way to find out is with the built in help function: ?

?apply 

# The first **argument** is the **data frame** or **matrix** or **vector**

#So, instead of using apply over my_data, we could just use it for one
# of our vectors

mean_first <- apply(matrix(first_vector, nrow=1), 1, mean)
mean_first

# That is not very useful, because it is easier to just use the mean function directly on the vector
# but it is good to understand how apply works

# The second **argument** is the **margin** which
# tells R whether to apply the function to rows or columns

# A margin of 1 means rows
# A margin of 2 means columns

# So, we could also use apply to find the means of the columns 
# in our data frame, which is actually a lot more common

column_means <- apply(my_data, 2, mean)
column_means

# The third **argument** is the **function** to apply

# In our case, we used the mean function

# You can also use other functions, like sum, median, sd, etc.

# Let's use apply to find the median of each column

column_medians <- apply(my_data, 2, median)
column_medians

# at this point, you may have noticed that something doesn't look quite right
# our data frame put our vectors (our lists of variable observations) 
# into rows instead of columns

# This is because we used rbind() to combine our vectors into a matrix

# Next we combine these two vectors into a matrix where each vector is a column instead of a row using the cbind() function
# using the cbind() function

combined_matrix_columns <- cbind(first_vector, second_vector, fourth_vector)
combined_matrix_columns

# Now I want to turn this matrix into one of the basic objects in R, a data frame

my_data_columns <- data.frame(combined_matrix_columns)
my_data_columns

# Finally, I want to use apply to find the means and medians of each column in this new data frame

column_means_columns <- apply(my_data_columns, 2, mean)
column_means_columns

column_medians_columns <- apply(my_data_columns, 2, median)
column_medians_columns

# I am going to save this data frame to a CSV file in the data folder using the write.csv() function

write.csv(my_data_columns, file = "data/my_data_columns.csv", row.names = FALSE)  # This will create a file named my_data_columns.csv in the data directory without row names

# We will do some more operations with this same data next time
# including creating row names, naming the columns with colnames(), 
# plotting the data, and finding the next two descriptive statistics:
# variance and standard deviation


