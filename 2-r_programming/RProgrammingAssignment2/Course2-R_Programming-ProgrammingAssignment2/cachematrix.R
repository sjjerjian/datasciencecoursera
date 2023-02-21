## Put comments here that give an overall description of what your
## functions do

## create a special matrix, list containing functions which
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the matrix inverse, using solve function
## 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Calculate inverse of x, but check first if inverse has already been calculated,
## if so, use that cached value
## if not, calculate the inverse, and store in the cache using setinv

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached inverse")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}