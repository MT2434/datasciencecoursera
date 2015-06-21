## Write a pair of functions that calculate and cache the inverse of a matrix

## Create list of functions that creates a special "matrix" object that 
## can cache its inverse (and pass to cacheSolve)

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
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

## Calculate and cache inverse matrix, unless the matrix has not changed (in which case
## return the cached inverse)

cacheSolve <- function(x, ...) {
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



