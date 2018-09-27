## These two functions compute the inverse of any invertible matrix x that is given as argument to cacheSolve()
## In case the matrix has already been inverted the data is retrived from the cache with the message 'getting cache data'
## Otherwise the inverted matrix is calculated anew.

## makeCachematrix receives the matrix x and makes it the global environment argument m. Then it creates the empty 
## matrix im.
##
## To test I have used m1<<-matrix(c(4,7,2,6),2,2), m2<-matrix(c(0.6,-0.2,-0.7,0,4),2,2) 
## Then it runs like this:
##> cacheSolve(m1)
##     [,1] [,2]
##[1,]  0.6 -0.7
##[2,] -0.2  0.4
##> cacheSolve(m1)
##getting cached data
##     [,1] [,2]
##[1,]  0.6 -0.7
##[2,] -0.2  0.4
##> cacheSolve(m2)
##     [,1] [,2]
##[1,]    4    7
##[2,]    2    6
##> cacheSolve(m2)
##getting cached data
##     [,1] [,2]
##[1,]    4    7
##[2,]    2    6


makeCacheMatrix <- function(x = matrix()) {
    ## Reset variables m, im, does not return any value
  m<<-x
  im <<- NULL
}


## cacheSolve verifies whether im is not null, and if the matrix x is identical to the last value of m. If both 
## conditions are met, then it retrieves the inverted matrix of m from the cache memory and does not recalculate.
## if any of the conditions above is not met, then the functions calls makeCacheMatrix and solves m. It returns 
## im, the inverted matrix of x.

cacheSolve <- function(x = matrix) {
        ## Return a matrix that is the inverse of 'x'
  if((!is.null(im)) && (x==m))
    {
    message("getting cached data")
    return(im)
    }
    else{
      makeCacheMatrix(x)
      im<<-solve(m)
    } 
  im
}
