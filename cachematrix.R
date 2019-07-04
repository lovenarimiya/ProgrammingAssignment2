## This function creates a matrix object that can caches its inverse. 

makeCacheMatrix <- function(x = matrix()) {
  i<- Null
  set<- function(y){ ##set the value of the vector
    x<<- y
    i<<- NULL
  }
get<- function() x ## get the value of the vector
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
  i<- x$getinverse() ## retrieve the inverse from the cache
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
      
data<- x$get() 
i<- solve(data, ...)
x$setinverse(i)
i
}

## Test the functions
source("ProgrammingAssignment2/cachematrix.R")
my_matrix <- makeCacheMatrix(matrix(1:4),2,2))
my_matrix$get()
