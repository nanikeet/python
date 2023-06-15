factorial <- function(n) {
  if(n < 0) {
    print("Error: Factorial of a negative number is undefined.")
  } else if(n == 0 || n == 1) {
    return(1)
  } else {
    return(n * factorial(n-1))
  }
}

n <- 5
fact <- factorial(n)
cat("Factorial of", n, "is", fact)
