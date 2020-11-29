#' @export
data_matrix <- function(data, features, output)
{
  scaled_feature_matrix <- data.frame(scale(data[features]), row.names=NULL)
  length <- nrow(data)
  scaled_features <- as.matrix(cbind('Intercept' = rep(1, length),
                                     scaled_feature_matrix[, features]))
  output <- as.matrix(scale(data[output]))
  return(list(scaled_features, output))
}
