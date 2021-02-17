
##This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverseM <- function(inverseM) i <<- inverseM
  getinverseM <- function() i
  list(set = set, get = get,
       setinverseM = setinverseM,
       getinverseM = getinverseM)
}


##This function computes the inverse of the special "matrix" returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
  i <- x$getinverseM()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverseM(i)
  i
}


