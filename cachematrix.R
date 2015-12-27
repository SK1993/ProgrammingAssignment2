## The following functions are used to create a special object that 
## stores a square matrix and cache's its inverse. 

## This function basically returns a list of functions 
## to get / set the matrix and its inverse.

makeCacheMatrix <- function(x = matrix()) {
i <- NULL
## Function to set the matrix
set <- function(y) {
x <<- y
i <<- NULL
}
## Function to get the matrix
get <- function() x
## Function to set the inverse 
setinverse <- function(solve) i<<- solve
## Function to get the inverse
getinverse <- function() i
## Returning the list
list(set = set, get = get,
setinverse = setinverse,
getinverse = getinverse)
}


## This function calculates the inverse using the special vector of the above 
## function but first checks if the inverse is already present in the cache or 
## not.

cacheSolve <- function(x,...){
i <- x$getinverse()
## Checking if the inverse is already present
if(!is.null(i)){
message("getting cached data")
return(i)
}
mat <- x$get()
## Solving for the inverse otherwise
i <- solve(mat,...)
x$setinverse(i)
i
}

