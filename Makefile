PLOTS=iris_data.png errors.png

all : ${PLOTS}

iris_data.png : iris_plot.R
	Rscript iris_plot.R $@

errors.png : plot_errors.R
	Rscript plot_errors.R $@
