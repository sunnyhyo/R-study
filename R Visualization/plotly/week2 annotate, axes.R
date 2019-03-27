# 13.4. Creating a Network Graph 

install.packages("igraph")
library(tidyverse)
library(igraph)
library(gcookbook)

# Specify edges for a directed graph
# 방향이 있는 그래프
gd <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6)) 
plot(gd)
# For an undirected graph 
# 방향이 없는 그래프
gu <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6), directed=FALSE) # No labels 
plot(gu, vertex.label=NA)

str(gd)
str(gu)

set.seed(229) 
plot(gu) 

madmen2

# creat a graph object from the data set
g <-  graph.data.frame(madmen2, directed = TRUE)

# remove unnecessary margin
par(mar= c(0,0,0,0))
plot(g, layout = layout.fruchterman.reingold, vertex.size = 9, edge.arrow.size = 0.5,
     vertex.label = NA)
plot(g, layout=layout.fruchterman.reingold, vertex.size=8, edge.arrow.size=0.5,     vertex.label=NA)


g <- graph.data.frame(madmen, directed=FALSE) 
par(mar=c(0,0,0,0))  # Remove unnecessary margins 
plot(g, layout=layout.circle, vertex.size=8, vertex.label=NA)



#13.5 Using text labels in a network graph

library(igraph) 
library(gcookbook) # For the data set 
# Copy madmen and drop every other row 
m <- madmen[1:nrow(madmen) %% 2 == 1, ] 
g <- graph.data.frame(m, directed=FALSE)
# Print out the names of each vertex 
V(g)$name
plot(g, layout=layout.fruchterman.reingold,
     vertex.size        = 4,          # Smaller nodes     
     vertex.label       = V(g)$name,  # Set the labels    
     vertex.label.cex   = 0.8,        # Slightly smaller font  
     vertex.label.dist  = 0.4,        # Offset the labels  
     vertex.label.color = "black")



# This is equivalent to the preceding code 
V(g)$size        <- 4 
V(g)$label       <- V(g)$name
V(g)$label.cex   <- 0.8 
V(g)$label.dist  <- 0.4 
V(g)$label.color <- "black"
# Set a property of the entire graph 
g$layout <- layout.fruchterman.reingold
plot(g)


# View the edges 
E(g)
# Set some of the labels to "M" 
E(g)[c(2,11,19)]$label <- "M"
# Set color of all to grey, and then color a few red 
E(g)$color             <- "grey70"
E(g)[c(2,11,19)]$color <- "red"
plot(g)

