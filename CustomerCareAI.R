
library(RTextTools)
library(e1071)

training =  rbind(
  c('change my account to postpaid', 'post'),
  c('i want a billing plan', 'post'),
  c('i want to pay as per usage', 'post'),
  c('I want my plan to be flexible', 'post'),
  c('i dont want to pay beforehand', 'post'),
  c('I want to make payments in advance', 'pre'),
  c('This prepaid scheme is nice', 'pre'),
  c('I want a fixed bill every month', 'pre'),
  c('I want to pay in advance', 'pre'),
  c('i prefer recharging instead of billing at the end of the month', 'pre')
)

test= rbind(c('i want to pay fixed bill switch me to prepaid','pre'),
            c('Switch me to prepaid','pre'),
            c('I prefer prepaid','pre'),
            c('I want a prepaid plan','pre'),
            c('I want to make payments in advance','post'),
            c('i want postpaid','post'),
            c('i want to pay as per usage','post'))

test2= rbind(c('i want to pay fixed bill switch me to prepaid'),
            c('i like prepaid better as it suits my needs currently'),
            c('I prefer prepaid'),
            c('I want a prepaid plan'),
            c('I want to make payments in advance'),
            c('i want postpaid'),
            c('i want to pay as per usage'))


# build dtm
matrix1= create_matrix(training, language="english", 
                      removeStopwords=TRUE, removeNumbers=TRUE, 
                      stemWords=TRUE) 
matrix2= create_matrix(test, language="english", 
                      removeStopwords=TRUE, removeNumbers=TRUE, 
                      stemWords=TRUE)
matrix3= create_matrix(test2, language="english", 
                       removeStopwords=TRUE, removeNumbers=TRUE, 
                       stemWords=TRUE)
# train the model
mat1 = as.matrix(matrix1)
mat2 = as.matrix(matrix2)
mat3 = as.matrix(matrix3)

classifier = naiveBayes(mat1[1:10,], as.factor(training[,2]) )

# test the validity
predicted = predict(classifier,mat2)
predicted2 = predict(classifier,mat3)
result=cbind(test,predicted)
result2=cbind(test2,predicted2)


#space to add dynamic input

dynamic=c('I want to make payment in advance advance payment plan')
matrixd=create_matrix(dynamic, language="english", 
                      removeStopwords=TRUE, removeNumbers=TRUE, 
                      stemWords=TRUE)

matd = as.matrix(matrixd)

predicted7= predict(classifier,matd)
resultfinal= cbind(dynamic,predicted7)
sink("output.txt")
cat(predicted7)
sink()
file.append()

#the predicted output will be reflected in resultfinal 
