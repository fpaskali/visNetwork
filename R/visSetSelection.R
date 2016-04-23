#' Function to select edge(s) / node(s) from network, with shiny only.
#'
#' Function to select edge(s) / node(s) from network, with shiny only. 
#' 
#'@param graph : a \code{\link{visNetworkProxy}}  object
#'@param nodesId : vector of id, nodes(s) to select
#'@param edgesId : vector of id, edges(s) to select
#'@param unselectAll : Boolean. Unselect all nodes & edges before current selection ? Default to TRUE
#'@param highlightEdges : Boolean. highlight Edges also ? Default to TRUE
#'
#'@seealso \link{visNodes} for nodes options, \link{visEdges} for edges options, \link{visGroups} for groups options, 
#'\link{visLegend} for adding legend, \link{visOptions} for custom option, \link{visLayout} & \link{visHierarchicalLayout} for layout, 
#'\link{visPhysics} for control physics, \link{visInteraction} for interaction, \link{visNetworkProxy} & \link{visFocus} & \link{visFit} for animation within shiny,
#'\link{visDocumentation}, \link{visEvents}, \link{visConfigure} ...
#' 
#' @examples
#'\dontrun{
#'
#'# have a look to : 
#'shiny::runApp(system.file("shiny", package = "visNetwork"))
#'
#'}
#'
#'@export

visSetSelection <- function(graph, nodesId = NULL, edgesId = NULL, unselectAll = TRUE, highlightEdges = TRUE){

  if(!any(class(graph) %in% "visNetwork_Proxy")){
    stop("Can't use visSetSelection with visNetwork object. Only within shiny & using visNetworkProxy")
  }

  data <- list(id = graph$id, selection = list(nodes = nodesId, edges = edgesId), 
               options = list(unselectAll = unselectAll, highlightEdges = highlightEdges))
  
  graph$session$sendCustomMessage("visShinySetSelection", data)

  graph
}