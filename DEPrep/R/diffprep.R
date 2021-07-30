#' DEPrep
#'
#' Prepares dataframe of gene counts for differential expression analysis.
#'
#' @param data A \code{data.frame} containing gene counts
#' @param gene_col_name the column name of genes in original dataframe
#' @param filter_number the number threshold of gene counts to which the data are filtered
#'
#' @return A filtered \code{matrix} with genes as the row names
#'
#' @examples
#' \dontrun{
#' diffprep(genecounts, "gene_names", 5
#' }
#'
#' @importFrom dplyr select
#' @importFrom utils ?
#' @import rmarkdown
#'
#' @author Louise Whiteside
#'
#' @notes This is my very first package and so its likely to be developed!
#'
#'
#'
#' @export
diffprep <- function(data, gene_col_name, filter_number) {
  ####### Convert to data frame
  data1 <- as.data.frame(data)
  ####### Take out the 'extra' first col of gene names out of the data (do not need it anymore)
  data_2 <- select(data1,-gene_col_name)
  ####### Convert to numeric
  data_3 <??? as.data.frame(sapply(data_2,as.numeric))
  ####### Define row names
  row.names(data_3)<-data1[,gene_col_name]
  ###### Filter data
  keep_these_counts <- rowSums(data_3) > filter_number
  final_counts <- data_3[keep_these_counts,]
  ##### Convert to matrix
  final_counts <- as.matrix(final_counts)
  ###### Change from numeric to integer class
  forceMatrixToInteger <- function(m){
    apply (m, c (1, 2), function (x) {
      (as.integer(x))
    })
  }
  final_matrix<- forceMatrixToInteger(final_counts)
  ###### Define row names
  row.names(final_matrix) <- row.names(final_counts)
  # convert to matrix
  final_matrix <- as.matrix(final_matrix)
  return(final_matrix)
}
