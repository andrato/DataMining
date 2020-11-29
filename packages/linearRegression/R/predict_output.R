#' @export
predict_output = function(feature_matrix, weights)
{
  predictions = (as.matrix(feature_matrix)) %*% weights
  return(predictions)
}
