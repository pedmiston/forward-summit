#!/usr/bin/env Rscript
# A redesign of the pandoc diagram <http://pandoc.org/diagram.jpg>
# Pierce Edmiston

library(dplyr)
library(ggraph)

input_formats <- system("pandoc --list-input-formats", intern = TRUE)
output_formats <- system("pandoc --list-output-formats", intern = TRUE)

shorten_md <- . %>% stringr::str_replace("markdown", "md")
input_formats <- shorten_md(input_formats)
output_formats <- shorten_md(output_formats)

nodes <- data_frame(
    # Start with nodes for all input and output formats
    format = c(input_formats, output_formats),
    # Label whether each format is an input or an output
    direction = c(
      rep("input",  times = length(input_formats)),
      rep("output", times = length(output_formats))
    ),
    # Some formats are both inputs and outputs, so create
    # a unique label that identifies format and direction
    # e.g., {direction}-{format}.
    label = paste(direction, format, sep = "-"),
    # Create logical "type" for bipartite layout
    type = direction == "input"
  ) %>%
  # igraph expects unique node labels to be the first column
  select(label, everything())

# Create edges from all unique combinations of inputs and outputs
edges <- expand.grid(
    from = input_formats,
    to = output_formats,
    stringsAsFactors = FALSE
  ) %>%
  # Relabel from and to columns with {format} with {direction}-{format}
  left_join(filter(nodes, direction == "input")  %>% select(from = format, from_label = label)) %>%
  left_join(filter(nodes, direction == "output") %>% select(to = format, to_label = label)) %>%
  # Put correctly labeled edge columns first
  select(from_label, to_label, everything())

graph <- igraph::graph_from_data_frame(edges, vertices = nodes)
ggraph(graph, layout = "bipartite") +
  geom_edge_diagonal(edge_width = 0.1) +
  geom_node_text(aes(label = format, hjust = 1-type),
                 angle = 90, size = 9) +
  coord_cartesian(ylim = c(-1, 2)) +
  scale_y_reverse() +
  theme_graph()

ggsave("img/pandoc-formats.png", height = 9, width = 16)
