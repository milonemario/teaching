# library(rbokeh)
# 
# # Test
# p <- figure() %>%
#   ly_points(Sepal.Length, Sepal.Width, data = iris,
#             color = Species, glyph = Species,
#             hover = list(Sepal.Length, Sepal.Width))
# p
# rbokeh2html(p, file='test_graph.html')

# library(magrittr)
# library(highcharter)
# hchart(mtcars, "scatter", hcaes(wt, mpg, z = drat, color = hp)) %>%
#   hc_title(text = "Scatter chart with size and color")

library(tidyverse);
library(plotly);
library(htmlwidgets);

df <- data.frame(x = 1:25, y = c(1:25 * 1:25))
gg <- ggplot(df,aes(x = x, y = y)) + geom_point()

# Save ggplotly as widget in file test.html
saveWidget(ggplotly(gg), file = "test.html");