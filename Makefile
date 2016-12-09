PLOTS=iris_data.png errors.png benchmark_train.png benchmark_pred.png

all : ${PLOTS}

clean :
	rm ${PLOTS} benchdata.RData

iris_data.png : iris_plot.R
	Rscript iris_plot.R $@

errors.png : plot_errors.R
	Rscript plot_errors.R $@

benchmark_train.png : bench_plot_train.R benchdata.RData
	Rscript $^ $@

benchmark_pred.png : bench_plot_predict.R benchdata.RData
	Rscript $^ $@

benchdata.RData : benchmark.R
	Rscript $^ $@
