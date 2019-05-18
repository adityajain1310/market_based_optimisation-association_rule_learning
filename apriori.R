# Apriori

# Data Preprocessing
# install.packages('arules')
library(arules)
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 100)

# Training  Apriori on the dataset
rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2)) 
# support is the product is in atleast 3 transaction in a day.So 21 times in a week and 
# suport = product transactions/total transactions ( 21 / 7500 )

# Visualising the Results
inspect(sort(rules, by = 'lift')[1:10])