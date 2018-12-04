## Put comments here that give an overall description of what your
## functions do

## Creating cache matrix:

makeCacheMatrix <- function(x = matrix()){
  s<- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)  
}



## Creating new solve of the matrix or get it from cache:

cacheSolve<-function(x,...){
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
