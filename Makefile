PLOTS=iris_data.png errors.png benchmark_train.png benchmark_pred.png arcene_times.png
DATA=iris_benchdata.RData arcene_data.RData

all : ${PLOTS}

clean :
	rm ${PLOTS} ${DATA}

iris_data.png : iris_plot.R
	Rscript iris_plot.R $@

errors.png : plot_errors.R
	Rscript plot_errors.R $@

benchmark_train.png : bench_plot_train.R iris_benchdata.RData
	Rscript $^ $@

benchmark_pred.png : bench_plot_predict.R iris_benchdata.RData
	Rscript $^ $@

iris_benchdata.RData : iris_benchmark.R
	Rscript $^ $@

arcene_times.png : arcene_plot_times.R arcene_data.RData
	Rscript $^ $@

arcene_data.RData : arcene_train.R
	Rscript $^ $@
