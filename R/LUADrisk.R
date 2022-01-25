#' Evaluate Lung Adenocarcinoma Survival Risk
#'
#' @param genes_expr Gene expression matrix. Rownames of the input matrix are genes, and colnames of the input matrix are sample names
#' @param parallel Set calculation parallel numbers
#' @return Data frame includes signature score, survival risk and gene expression.
#'
#' @examples
#' library(LPRI)
#' Sample_risk <- runLPRI(genes_expr)
#' @export
runLPRI <- function(genes_expr, parallel = 1){
  checkmate::assert_matrix(genes_expr)
  options(warn=-1)
  genes <- rownames(genes_expr)
  if(TRUE %in% (genes %in% gene_list)){
    genes_expr <- genes_expr[intersect(gene_list, genes),]
    res_es <- GSVA::gsva(genes_expr, res_select, mx.diff=T, verbose=T, method="gsva", parallel.sz=parallel)
    signature <- as.matrix(t(res_es)) %*% as.matrix(TCGA_gene$beta)
    res_es <- as.data.frame(t(res_es))
    res_es$LPRI <- signature
    res_es$Risk_subgroup <- ifelse(signature > 0.33,"High","Low")
    res_es <- res_es %>%
      dplyr::select("Risk_subgroup", "LPRI", everything())
    return(res_es)
  }else{
    stop("Error: Please check the matrix. Rownames of the input matrix are genes, and colnames of the input matrix are sample names")
  }
}
