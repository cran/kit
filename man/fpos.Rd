\name{fpos}
\alias{fpos}
\title{ Find a matrix position inside a larger matrix }
\description{
The function \code{fpos} returns the locations (row and column index) where a small matrix may be found in a larger matrix. The function also works with vectors.  
}
\usage{
  fpos(needle, haystack, all=TRUE, overlap=TRUE)
}
\arguments{
  \item{needle}{ A matrix or vector to search for in the larger matrix or vector \code{haystack}. Note that the \code{needle} dimensions (row and column size) must be smaller than the \code{haystack} dimensions. }
  \item{haystack}{ A matrix or vector to look into.}
  \item{all}{ A logical value to indicate whether to return all occurrences (\code{TRUE}) or only the first one (\code{FALSE}). Default value is \code{TRUE}.}
  \item{overlap}{ A logical value to indicate whether to allow the small matrix occurrences to overlap or not. Default value is \code{TRUE}.}
}
\value{
A two columns matrix that contains the position or index where the small matrix (needle) can be found in the larger matrix. The first column refers to rows and the second to columns. In case both the needle and haystack are vectors, a vector is returned.
}
\author{Morgan Jacob}
\examples{
# Example 1: find a matrix inside a larger one
big_matrix = matrix(c(1:30), nrow = 10)
small_matrix = matrix(c(14, 15, 24, 25), nrow = 2)

fpos(small_matrix, big_matrix)

# Example 2: find a vector inside a larger one  
fpos(14:15, 1:30)

# Example 3: 
big_matrix = matrix(c(1:5), nrow = 10, ncol = 5)
small_matrix = matrix(c(2:3), nrow = 2, ncol = 2)

# return all occurences
fpos(small_matrix, big_matrix)

# return only the first
fpos(small_matrix, big_matrix, all = FALSE)

# return non overlapping occurences
fpos(small_matrix, big_matrix, overlap = FALSE)

# Benchmarks
# ----------
# x = matrix(1:5, nrow=1e4, ncol=5e3) # 191Mb
# microbenchmark::microbenchmark(
#  fpos=kit::fpos(1L, x),
#  which=which(x==1L, arr.ind=TRUE),
#  times=10L
# )
# Unit: milliseconds
#  expr  min  lq  mean median   uq  max neval
# fpos   202  206  220    221  231  241    10
# which  612  637  667    653  705  724    10
}
