# Group 29 Project Proposal

## What Factors Determine Smoking Rates by Country?
#### Aman Jaswal (46486747), Hyeokjin kwon (46135057), Omair Mohammed (45972907), Muhammad Khaled (44978286)

Do increased taxes on cigarettes cause their affordability to decrease? Does this decrease the rates of cigarette smoking within countries? Our Project will aim to determine whether there is a correlation between government tax structures and the affordability of cigarettes and whether this affects the rates of cigarette smoking in countries.

Our Project will also aim to find out which other policies have the greatest impact on smoking rates, such as enforcing bans on advertising or placing warnings on packages.

## Data Sets to be used

- Affordability CSV Data Set from WHO. Will need to convert entries for certain columns from objects to numeric values, will also need to account for NaN values in columns of the data set relating to whether there is a specific tax, price dispersion and category of change as the entry given for the 2018 row applies for all entries for previous years for the same country. Will also need to account for countries where data is not provided for every year.
- Age-standardised estimates of current tobacco use, tobacco smoking and cigarette smoking from WHO (saved as a CSV file called current_tobacco_use). Will need to remove brackets after entries and make sure entries are numeric values rather than objects. We will also need turn the first row into an index as it holds no values and instead indicates which gender the entries below it are (male, female or both). Finally, will need to either drop countries where data is not available for all years or find ways to account for this so that they can be compared with countries with complete data.
- National Taxes on a pack of 20 cigarettes (saved as a CSV file called national taxes on cigarettes). May not use this data set however if we do we will need to find a way to be able compare prices between different currencies, most likely by converting all values to one common currency.
- MPower_Overview.csv Data Set from WHO. Data is almost cleaned, may need to just drop any rows where data is not available for certain columns or filling them with zero to indicate that they have no score. 

## Analysis Techniques we expect to use in this Project

- Linear Regression: Predicting smoking rate’s factors as a Baseline Model
- Logistic Regression: Using Affordability and MPower Data Sets
- Clustering (K-Means): Discovering relationship with policies and smoking rates
- Maybe another model such as K-Nearest Neighbour Classifier or Naive Bayes Classifiers depending on whether they are applicable to our Project

## Milestones we expect to accomplish during this Project

- **Beginning of Mid-Semester Break** Have Data Preparation and Data Cleaning finished for all data sets being used.
- **End of 1st Week of Mid-Semester Break** Have Data Visualisation and Modelling completed including Clustering of Data.
- **End of Mid-Semester Break** Have Linear Regression modelling completed and evaluate the model's performance.
- **Week 10** Have any other prediction model completed and its performance evaluated.
- **Week 12** Have Project video presentation completed one week before the due data. In the final week we can look over our project and make any changes if need be. We will know we have been successful in achieving each of the milestones we set out for ourselves if we can conclusively answer whether the models used in our project are able to accurately predict the smoking rates across countries based on the factors we have examined.

## Relevant Prior Work
There have been many previous articles and papers which have assessed the effectiveness of taxes and other factors such as advertising bans on tobacco usage rates. A few which are of interest to us are:

- **Smoking prevalence following tobacco tax increases in Australia between 2001 and 2017: an interrupted time-series analysis** (https://www.thelancet.com/journals/lanpub/article/PIIS2468-2667(19)30203-8/fulltext#seccestitle150). This article found that policies introduced by the Australian Government to increase taxes on tobacco products did result in decreases in tobacco usage. It did find a variance in the amount tobacco usage decreased depending on whether the policies were implemented with or without forewarning, and the types of tobacco usage.

- **The impact of tobacco advertising bans on consumption in developing countries** (https://www.sciencedirect.com/science/article/abs/pii/S0167629608000155?via%3Dihub). This article examines whether tobacco advertising bans reduce tobacco consumption in developed countries. It found that both comprehensive and limited bans both reduced consumption however comprehensive bans have a greater impact.