Analysis of Cycling Data(1)

1. Analysis of CSV data for cycling(strava, cheetah)
2.make dataframe which contains strava and cheetah(using join())
3.remove the rides with no mearsure power 
4. analyze 'time moving', 'distance', 'average power', 'tss','average speed' by histogram, median, mean, skewness
5.creat new data frame ('new_everyRide') which has 8 variables (distance,time moving,average heart rate, 
average power, np, tss, elvation gain) to see the correlation between the variables
6. using table, heatmap, piarplot to analyze the correlation
7.using scatter plots to find out the variables which have specific figure and form base on the workout_type(race,workout,ride)
8.analyze 4 variables (average speed, average power, average heart rate, np) in (ride,race,workout )by histogram and boxplot 
9. get the dataframe from weather_data2018.csv and weather_data2019.csv
10. make two dataframe into one dataframe(everyWeather)
11.merge everyWeather and everyRide dataframe(result)
12.make new table that only contain the variables that i want to check the correlation(new_result)
13.check correlation table, heatmap, pairplot.
14.challenge1:from the correlation table, heatmap, pairplot we can see the correltaionship between the variabels and kudos
15.challenge2: make 3 lists(TSS,distance,average speed) per month. and make new dataframe with the three lists. after that make scatterplot to analyze and summarise the data.



Appliance analysis(2)

1. import all the method and library that i need for linear regression, data analysis
2. get training, testing file check and do the data preprocessing.
3.analyze data with the different types of plots  (pairgrid: scatter plot, correlation, histogram)
4.make first 4 weeks tables in February table for heatmap and analyze with the heatmap
5.Drop the useless categorical values and make complete dataframe for train, test for linear regression
6.do linear regression and figure out RMSE, MAE, MAPE, R2 score for testing , training.
7. make RMSE plot and RFECV plot to find out the Optimal number of features and Best features to improve model.


Evaluation(3)

1.vectorized the texts in books summary columns
2.divide dataset into two (Training, testing )
3.doing model training to find out the accuracy (logistic regression, 4 Naive Bayes models, KNN)
4.Evaluation

Evaluation-1(Logistic regression)
Logistic regression is the model that is most accurate.
Logistic Regression uses a different method for estimating the parameters, which gives better results(unbiased, with lower variances.) and don't need naive assumption compare to Naive Bayes models

Evaluation-2(Naive Bayes)
There are 4 types of Naive Bayes models, and two models(Multinomial Naive Bayes,Bernoulli Naive Bayes)are relatively more accurate than Complement Naive Bayes and Gaussian Naive Bayes
Reasons why Multinomial Naive Bayes and Bernoulli Naive Bayes are more accurate: BernoulliNB applies to binary data and MultinomialNB applies to count data. so BernoulliNB, MultinomialNB are mostly used to classify text data.
These two naive Bayes models are used to count sparse data such as text. MultinomialNB usually outperforms BernoulliNB on datasets with relatively many non-zero features. so MultinomialNB is more accurate this time because summary column is really long and max_feature is more than 100.
ComplementNB implements the complement naive Bayes (CNB) algorithm, which is particularly suited for imbalanced data sets. but this testing, training dataset is randomly distributed and balanced so other Naive bayes models like Multinomial, Bernoulli is more accurate then complementNB.
The naive Bayes model and the linear model have similar advantages and disadvantages. Training and prediction speed is fast, and the training process is easy to understand. It works well on sparse high-dimensional data, and is relatively insensitive to parameters. For very large data sets that take too long to learn with a linear model, the Naive Bayes model is worth trying, and is often used.

Evaluation-3(KNN)
KNN models: If the amount of training data is large, the classification speed is slow (in fact, because there is no separate learning process because pre-calculation is not possible, the classification speed is slow)
Larger dimensions (vectors) increase the amount of computation. In that reason KNN is not the best model for text data classification.
so KNN is less accurate than logistic regression and Multinomial Naive Bayes here.