#####################
# MATRICES & ARRAYS #
#####################


        # 1. Defining a matrix #

    # a) using the "matrix" function 

( A <- matrix(data = c(-3,2,893,0.17), nrow = 2, ncol = 2) )
# controling the filling direction with "byrow"
matrix(data = c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = FALSE) # the default = column-wise
matrix(data = c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE) # the alternative = row-wise

    # b) by binding vectors of the same type and equal lengths row-wise...

rbind(1:3, 4:6)

    # c) ... or column-wise 

cbind(c(1, 4), c(2, 5), c(3, 6))

    # d) accesing the matrix's dimensions 

( mymat <- rbind(c(1, 3, 4), 5:3, c(100, 20, 90), 11:13) )
dim(mymat) # vector of length 2 containing the no of rows & the no of columns in that order
nrow(mymat) # no. of rows
ncol(mymat) # no. of columns
dim(mymat)[2] # alternative for the no. of columns


        # 2. Subsetting #
    
    # a) positive subsetting 

(A <- matrix( c(0.3, 4.5, 55.3, 91, 0.1, 105.5, -4.2, 8.2, 27.9), nrow = 3, ncol = 3) )
# single element extraction
A[3,2]
# single column extraction
A[,2]
# single row extraction
A[1,]

# extracting rows 2 & 3 (in that order)
A[2:3,]
# extracting columns 3 & 1 (in that order)
A[,c(3,1)]
# extracting the corner elements of the matrix
A[c(1, 3), c(1,3)]

# extracting the diagonal of a (possibily non-square) matrix
diag(A)
diag(rbind(1:3, 4:6))

    # b) negative subsetting 

# leaving one column out
A[,-2]
# mixing negative & positive subsetting
A[-1,3:2]
# leaving out row 1 and column 2
A[-1,-2]
# ommiting more than one column
A[-1, -c(2, 3)]

    # c) overwriting / changing specific elements

( B <- A )
# overwriting the second row
B[2,] <- 1:3
B
# overwriting specific elements
B[c(1, 3), 2] <- 900
B
# replacing the third column with the third row
B[,3] <- B[3,]
B
# replacing the corner elements of the matrix; recycling behaviour
B[c(1,3),c(1,3)] <- c(-7,7)
B
# ovewriting always takes place column-wise (column by column) 
B[c(1,3), 2:1] <- c(65,-65,88,-88)
B
# replacing the diagonal
diag(B) <- rep(0, times = 3)
B


        # 3. Matrix operations #

    # a) the transpose #

( A <- rbind(c(2, 5,2 ), c(6, 1, 4)) )
# transposing once
t(A)
# transposing twice (gives back the original matrix)
t(t(A))

    # b) the identity matrix #

# notice how the same function "diag" gives different types of outputs
# depending on the type of the argument
( A <- diag(3) )

    # c) scalar multiplication #

( A <- rbind(c(2, 5, 2), c(6, 1, 4)) )
a <- 2
a*A

    # d) addition and substraction #

( A <- cbind(c(2, 5, 2), c(6, 1, 4)) )
( B <- cbind(c(-2, 3, 6), c(8.1, 8.2, -9.8)) )
A - B
A + B

    # e) matrix multiplication #

( A <- rbind(c(2, 5, 2), c(6, 1, 4)) )
dim(A)
( B <- cbind(c(3, -1, 1), c(-3, 1, 5)) )
dim(B)
# both multiplications are possible
A %*% B
B %*% A

    # f) matrix inversion #

( A <- matrix(c(3, 4, 1, 2), 2, 2) )
# "solve" gives the inverse of A
solve(A)
# checking the correctness of the result
A %*% solve(A)
solve(A) %*% A

        # 4. Multidimensional arrays #

    # a) definition #

# a 3-dimensional array consisting of rows, columns and slices
( AR <- array(data = 1:24, dim = c(3, 4, 2)) )#
# a 4-dimensional array consisting of rows, columns, slices and blocks
( BR <- array(rep(1:24, times = 3), dim = c(3, 4, 2, 3)) )

    # b) subsetting an array #

# extracting all row 2 - slice 2 elements
AR[2,,2]
# #  extracting some specific elements
AR[2,c(3,1),2]
# extracting the first row of a 3D array
AR[1,,]
# extracting the element from the 2nd row, 1st column, 1st slice and 3rd block
BR[2,1,1,3]
# extracting all row 1 - block 1 elements
BR[1,,,1]
# extracting slice 2
BR[,,2,]