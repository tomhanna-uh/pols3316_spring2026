# For a NEW document (first-time publish)
result <- rsconnect::rpubsUpload(
        title       = "Lecture 6: Law of Large Numbers, Central Limit Theorem, & Correlation",
        contentFile = "lect6_js.html",
        originalDoc = "lect6_js.qmd",  # or .qmd
        id          = NULL
)
browseURL(result$continueUrl)
