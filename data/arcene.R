arcene.train <- scan("arcene_train.data")
arcene.train <- matrix(arcene.train, ncol=10000)
arcene.train <- cbind(arcene.train, scan("arcene_train.labels"))
arcene.train <- as.data.frame(arcene.train)
names(arcene.train)[10001] <- "label"
arcene.train$label <- as.factor(arcene.train$label)
