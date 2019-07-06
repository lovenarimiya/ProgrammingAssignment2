
## This function creates a matrix object that can caches its inverse. 
makeCacheMatrix <- function(x = matrix()) {
  i<- Null
##set the value of the vector
  set<- function(y){ 
    x<<- y
    i<<- NULL
  }

  ## get the value of the vector
get<- function() x 
setinverse<- function(inverse) i <<-inverse ## set the value of the inverse
getinverse<- function() i ##get the value of the inverse

  list(set=set,
     get=get,
     setinverse= setinverse,
     getinverse= getinverse
     )
}
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
## retrieve the inverse from the cache
  i<- x$getinverse() 
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
## retrive matrix from object and set inverse       
data<- x$get() 
i<- solve(data, ...)
x$setinverse(i)
i
}

