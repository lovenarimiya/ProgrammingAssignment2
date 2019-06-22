## This function creates a matrix object that can caches its inverse. 

makeCacheMatrix <- function(x = matrix()) {
  i<- Null
  set<- function(y){
    x<<- y
    i<<- NULL
  }
get<- function() x
setinverse<- function(inverse) i <<-inverse
getinverse<- function() i
list(set=set,
     get=get,
     setinverse= setinverse,
     getinverse= getinverse
     )
}
## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  i<- x$getinverse()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
        ## Return a matrix that is the inverse of 'x'
data<- x$get()
i<- solve(data, ...)
x$setinverse(i)
i
}

## Test the functions
source("ProgrammingAssignment2/cachematrix.R")
my_matrix <- makeCacheMatrix(matrix(1:4),2,2))
my_matrix$get()
