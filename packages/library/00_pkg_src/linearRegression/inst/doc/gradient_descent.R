## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ----setup--------------------------------------------------------------------
library(linearRegression)

## -----------------------------------------------------------------------------
data_matrix

## -----------------------------------------------------------------------------
predict_output

## -----------------------------------------------------------------------------
featureDerivative

## -----------------------------------------------------------------------------
regression_gradient_descent

## -----------------------------------------------------------------------------
file_path = "D:/MasterInfo/AN1-SEM1/DataMining/DataMining/"
kc_house_data <- read.csv(paste(file_path, "kc_house_data.csv",
sep = ""))
house_data <- kc_house_data[, c("price", "bedrooms", "sqft_living")]


set.seed(22)
inTrain <- createDataPartition(house_data$price, p = 0.5, list = F)
house_train_data = house_data[inTrain,]
house_test_data = house_data[-inTrain,]


my_features <- c("bedrooms", "sqft_living")
my_output <- "price"


feature_matrix = data_matrix(house_train_data, my_features, my_output)[[1]]
output_matrix = data_matrix(house_train_data, my_features, my_output)[[2]]
initial_weights = c(0, 0, 0)
step_size = 0.01
tolerance = 1e-5



weights = regression_gradient_descent(feature_matrix,
                                      output_matrix,
                                      initial_weights,
                                      step_size,
                                      tolerance)
weights

## -----------------------------------------------------------------------------
sgd

