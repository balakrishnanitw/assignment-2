# Caching the Inverse of a Matrix:
## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than compute it repeatedly.

## Below are a pair of functions that are used to create a special object that 
## stores a matrix and caches its inverse.
## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  ## sets m as NULL
  
  set <- function(y) {
    x <<- y
    m <<- NULL
    ## m is set as NULL in its respective environment 
  }
  
  get <- function() x
  ## get is a function that returns x when called
  
  setinverse <- function(inverse) m <<- inverse
  
  getinverse <- function() m
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}





## This function computes the inverse of the special "matrix" created by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then it should return the inverse from the cache. 
## Otherwise, the matrix needs to be computed from scratch.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  m <- x$getinverse()
  if(!is.null(m)) {
    ## if m is not null ...
    message("getting cached data")
    ## ...then the user knows the cached data does indeed exist
    return(m)
  }
  
  ## otherwise we need to start from scratch and find the inverse of x
  mat <- x$get()
  m <- solve(mat, ...) 
  ## the solve function is used to compute the inverse (assumed invertible)
  x$setinverse(m)
  m
}
