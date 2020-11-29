#' @export
featureDerivative = function(errors, features)
{
  derivative = -1/nrow(features) * (t(features) %*% errors)
  return(derivative)
}
