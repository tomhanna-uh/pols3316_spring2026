# Load the required package
library(rsconnect)

# Define your file paths and title
doc_title <- "Lectures 10 and 11"
html_file <- "C:/Users/tomha/R_Projects/pols3316_spring2026/Lectures/lecture_10_11_assumptions_of_ols_and_other_models/lecture_10_11_assumptions_of_ols_and_other_models.html" 
source_file <- "C:/Users/tomha/R_Projects/pols3316_spring2026/Lectures/lecture_10_11_assumptions_of_ols_and_other_models/lecture_10_11_assumptions_of_ols_and_other_models.qmd" # Works with .Rmd as well

# Execute the upload
publish_result <- rpubsUpload(
        title = doc_title, 
        contentFile = html_file, 
        originalDoc = source_file
)

# Launch the browser to complete the setup
if (!is.null(publish_result$continueUrl)) {
        browseURL(publish_result$continueUrl)
} else {
        print(publish_result$error)
}