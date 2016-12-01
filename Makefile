PLOTS=iris_data.png

all : ${PLOTS}

iris_data.png : iris_plot.R
	Rscript iris_plot.R $@
