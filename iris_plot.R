library(ggplot2)
library(gridExtra)
library(grid)

grid_arrange_shared_legend <- function(..., ncol = length(list(...)), nrow = 1, position = c("bottom", "right")) {

  plots <- list(...)
  position <- match.arg(position)
  g <- ggplotGrob(plots[[1]] + theme(legend.position = position))$grobs
  legend <- g[[which(sapply(g, function(x) x$name) == "guide-box")]]
  lheight <- sum(legend$height)
  lwidth <- sum(legend$width)
  gl <- lapply(plots, function(x) x + theme(legend.position="none"))
  gl <- c(gl, ncol = ncol, nrow = nrow)

  combined <- switch(position,
                     "bottom" = arrangeGrob(do.call(arrangeGrob, gl),
                                            legend,
                                            ncol = 1,
                                            heights = unit.c(unit(1, "npc") - lheight, lheight)),
                     "right" = arrangeGrob(do.call(arrangeGrob, gl),
                                           legend,
                                           ncol = 2,
                                           widths = unit.c(unit(1, "npc") - lwidth, lwidth)))
  grid.newpage()
  grid.draw(combined)

}

data(iris)
cmd.args <- commandArgs(trailingOnly=T)
fname <- cmd.args[1]
png(filename=fname, width=10,height=6,units="in", res=300)
widths <- c("Sepal.Width", "Petal.Width")
heights <- c("Sepal.Length", "Petal.Length")
p1 <- ggplot(iris, aes_string(x="Sepal.Width", y="Sepal.Length", color="Species")) + geom_point()
p2 <- ggplot(iris, aes_string(x="Sepal.Width", y="Petal.Length", color="Species")) + geom_point()
p3 <- ggplot(iris, aes_string(x="Petal.Width", y="Sepal.Length", color="Species")) + geom_point()
p4 <- ggplot(iris, aes_string(x="Petal.Width", y="Petal.Length", color="Species")) + geom_point()
grid_arrange_shared_legend(p1, p2, p3, p4, nrow=2,ncol=2, position="right")
