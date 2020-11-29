#' @export
sgd<-function(x, y, betas, iters, lambda)
{
  beta<-as.matrix(cbind(rep(betas[1], iters),
                        rep(betas[2], iters),
                        rep(betas[3],iters))
  )
  for (i in 2:iters)
  {
    m <- nrow(x)
    sample_num <- sample.int(m, 1)
    row_x <- x[sample_num,]
    row_y <- y[sample_num]
    beta[i, 1] <- beta[i-1, 1] - (lambda*(beta[i-1, 1] +
                                            beta[i-1, 2]*row_x[[1]] +
                                            beta[i-1, 3]*row_x[[2]] -
                                            row_y)
    )
    beta[i, 2] <- beta[i-1, 2] - (lambda*(beta[i-1, 1] +
                                            beta[i-1, 2]*row_x[[1]] +
                                            beta[i-1,3]*row_x[[2]] -
                                            row_y)*row_x[[1]]
    )
    beta[i, 3] <- beta[i-1,3] - lambda*(beta[i-1, 1] +
                                          beta[i-1, 2]*row_x[[1]] +
                                          beta[i-1,3]*row_x[[2]] -
                                          row_y)*row_x[[2]]
  }
  return(beta);
}
