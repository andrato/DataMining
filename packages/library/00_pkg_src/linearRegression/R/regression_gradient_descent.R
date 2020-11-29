#' @export
regression_gradient_descent = function(feature_matrix, output,
                                       initial_weights, step_size, tolerance)
{
  converged = FALSE
  weights = initial_weights
  i = 0
  while (!converged)
  {
    predictions = predict_output(feature_matrix, weights)
    errors = predictions - output
    gradient = featureDerivative(errors, feature_matrix)
    gradient_norm = sqrt(sum(gradient^2))

    weights = weights + step_size * gradient
    if (gradient_norm < tolerance)
    {
      converged = TRUE
    }
    i = i + 1
  }
  return(list(weights = weights, Iters = i))
}
