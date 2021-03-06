#' @title Calculate the Kier and Hall Chi Chain Indices of Orders 3, 4, 5, 6 and 7
#'
#' @description Calculate the Kier and Hall Chi Chain Indices of Orders 3, 4, 5, 6 and 7
#' 
#' @details Evaluates chi chain descriptors.
#' The code currently evluates the simple and valence chi chain descriptors 
#' of orders 3, 4, 5, 6 and 7. 
#' It utilizes the graph isomorphism code of the CDK to find fragments matching 
#' SMILES strings representing the fragments corresponding to each type of chain.
#' 
#' @param molecules Parsed molucule object.
#' @param silent Logical. Whether the calculating process 
#' should be shown or not, default is \code{TRUE}.
#'
#' @return A data frame, each row represents one of the molecules, 
#' each column represents one feature. 
#' This function returns 10 columns, in the following order:
#' \itemize{
#' \item \code{SCH.3} - Simple chain, order 3
#' \item \code{SCH.4} - Simple chain, order 4
#' \item \code{SCH.5} - Simple chain, order 5
#' \item \code{SCH.6} - Simple chain, order 6
#' \item \code{SCH.7} - Simple chain, order 7
#' \item \code{VCH.3} - Valence chain, order 3
#' \item \code{VCH.4} - Valence chain, order 4
#' \item \code{VCH.5} - Valence chain, order 5
#' \item \code{VCH.6} - Valence chain, order 6
#' \item \code{VCH.7} - Valence chain, order 7
#' }
#' 
#' @note These descriptors are calculated using graph isomorphism to identify 
#' the various fragments. As a result calculations may be slow. In addition, 
#' recent versions of Molconn-Z use simplified fragment definitions 
#' (i.e., rings without branches etc.) whereas these descriptors use 
#' the older more complex fragment definitions.
#' 
#' @keywords extrDrugChiChain Chi Chain
#' 
#' @aliases extrDrugChiChain
#' 
#' @author Min-feng Zhu <\email{wind2zhu@@163.com}>, 
#'         Nan Xiao <\url{http://r2s.name}>
#' 
#' @export extrDrugChiChain
#' 
#' @importFrom rcdk eval.desc
#' 
#' @name connectivity
#' 
#' @examples
#' 
#' smi = system.file('vignettedata/test.smi', package = 'BioMedR')
#' mol = readMolFromSmi(smi, type = 'mol')
#' # Calculate the Kier and Hall Chi Chain Indices of Orders 3, 4, 5, 6 and 7
#' dat = extrDrugChiChain(mol)
#' head(dat)
#' 

extrDrugChiChain = function (molecules, silent = TRUE) {

    x = eval.desc(molecules, 
                  'org.openscience.cdk.qsar.descriptors.molecular.ChiChainDescriptor', 
                  verbose = !silent)

    return(x)

}


#' @rdname connectivity
#' 
#' @title Evaluates the Kier and Hall Chi cluster indices of orders 3, 4, 5 and 6
#'
#' @description Evaluates the Kier and Hall Chi cluster indices of orders 3, 4, 5 and 6
#' 
#' @details Evaluates chi cluster descriptors.
#' It utilizes the graph isomorphism code of the CDK 
#' to find fragments matching SMILES strings 
#' representing the fragments corresponding to each type of chain.
#'
#' @return  extrDrugChiCluster: 
#' This function returns 8 columns, 
#' the order and names of the columns returned is:
#' \itemize{
#' \item SC.3 - Simple cluster, order 3
#' \item SC.4 - Simple cluster, order 4
#' \item SC.5 - Simple cluster, order 5
#' \item SC.6 - Simple cluster, order 6
#' \item VC.3 - Valence cluster, order 3
#' \item VC.4 - Valence cluster, order 4
#' \item VC.5 - Valence cluster, order 5
#' \item VC.6 - Valence cluster, order 6
#' }
#' 
#' @note These descriptors are calculated using graph isomorphism to identify 
#' the various fragments. As a result calculations may be slow. 
#' In addition, recent versions of Molconn-Z use simplified fragment 
#' definitions (i.e., rings without branches etc.) 
#' whereas these descriptors use the older more complex fragment definitions.
#' 
#' @keywords extrDrugChiCluster Chi Cluster
#'
#' @aliases extrDrugChiCluster
#' 
#' @export extrDrugChiCluster
#' 
#' @importFrom rcdk eval.desc
#' 
#' @examples
#' # Evaluates the Kier and Hall Chi cluster indices of orders 3, 4, 5 and 6
#' dat = extrDrugChiCluster(mol)
#' head(dat)
#' 

extrDrugChiCluster = function (molecules, silent = TRUE) {
  
  x = eval.desc(molecules, 
                'org.openscience.cdk.qsar.descriptors.molecular.ChiClusterDescriptor', 
                verbose = !silent)
  
  return(x)
  
}


#' @rdname connectivity
#' 
#' @title Calculate the Kier and Hall Chi Path Cluster Indices of Orders 4, 5 and 6
#'
#' @description the Kier and Hall Chi Path Cluster Indices of Orders 4, 5 and 6
#' 
#' @details Evaluates chi path cluster descriptors.
#' The code currently evluates the simple and 
#' valence chi chain descriptors of orders 4, 5 and 6. 
#' It utilizes the graph isomorphism code of the CDK to find 
#' fragments matching SMILES strings representing the fragments 
#' corresponding to each type of chain.
#'
#' @return extrDrugChiPathCluster:
#' This function returns 6 columns named 
#' \code{SPC.4}, \code{SPC.5}, \code{SPC.6}, 
#' \code{VPC.4}, \code{VPC.5}, \code{VPC.6}:
#' \itemize{
#' \item \code{SPC.4} - Simple path cluster, order 4
#' \item \code{SPC.5} - Simple path cluster, order 5
#' \item \code{SPC.6} - Simple path cluster, order 6
#' \item \code{VPC.4} - Valence path cluster, order 4
#' \item \code{VPC.5} - Valence path cluster, order 5
#' \item \code{VPC.6} - Valence path cluster, order 6
#' }
#' 
#' @note extrDrugChiPathCluster : These descriptors are calculated using graph 
#'       isomorphism to identify the various fragments. As a result calculations 
#'       may be slow. In addition, recent versions of Molconn-Z use simplified 
#'       fragment definitions (i.e., rings without branches etc.) 
#'       whereas these descriptors use the older more complex 
#'       fragment definitions.
#' 
#' @keywords extrDrugChiPathCluster Chi Path Cluster
#'
#' @aliases extrDrugChiPathCluster
#' 
#' @export extrDrugChiPathCluster
#' 
#' @importFrom rcdk eval.desc
#' 
#' @examples
#' # Calculate the Kier and Hall Chi Path Cluster Indices of Orders 4, 5 and 6
#' dat = extrDrugChiPathCluster(mol)
#' head(dat)
#' 

extrDrugChiPathCluster = function (molecules, silent = TRUE) {
  
  x = eval.desc(molecules, 
                'org.openscience.cdk.qsar.descriptors.molecular.ChiPathClusterDescriptor', 
                verbose = !silent)
  
  return(x)
  
}

#' @rdname connectivity
#' 
#' @title Calculate the Kier and Hall Chi Path Indices of Orders 0 to 7
#'
#' @description Calculate the Kier and Hall Chi Path Indices of Orders 0 to 7
#' 
#' @details Evaluates chi path descriptors. This function utilizes the graph isomorphism 
#' code of the CDK to find fragments matching SMILES strings representing the 
#' fragments corresponding to each type of chain.
#'
#' @return extrDrugChiPath: 
#' This function returns 16 columns, 
#' The order and names of the columns returned is:
#' \itemize{
#' \item \code{SP.0, SP.1, ..., SP.7} - Simple path, orders 0 to 7
#' \item \code{VP.0, VP.1, ..., VP.7} - Valence path, orders 0 to 7
#' }
#' 
#' @note extrDrugChiPath: These descriptors are calculated using graph isomorphism 
#' to identify the various fragments. As a result calculations may be slow. 
#' In addition, recent versions of Molconn-Z use simplified fragment definitions 
#' (i.e., rings without branches etc.) whereas these descriptors use the older 
#' more complex fragment definitions.
#' 
#' @keywords extrDrugChiPath Chi Path
#'
#' @aliases extrDrugChiPath
#' 
#' @export extrDrugChiPath
#' 
#' @importFrom rcdk eval.desc
#' 
#' @examples
#' # Calculate the Kier and Hall Chi Path Indices of Orders 0 to 7
#' dat = extrDrugChiPath(mol)
#' head(dat)
#' 

extrDrugChiPath = function (molecules, silent = TRUE) {
  
  x = eval.desc(molecules, 
                'org.openscience.cdk.qsar.descriptors.molecular.ChiPathDescriptor', 
                verbose = !silent)
  
  return(x)
  
}


