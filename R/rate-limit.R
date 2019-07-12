



rate_limit <- function() {
    # Get api key from cache
    api_key <- get_api_key()

    # Set headers
    headers <- httr::add_headers(
        "APIKey" = api_key,
        "Content-Type" = "application/json")

    tryCatch({
        response <- httr::get(
            URL_RATE_LIMIT,
            headers,
            body = query,
            encode = "form",
            timeout = 60)},
        error = function(c) {
            stop("Could not connect to Stat-Xplore: the server may be down")
        })

}
