install.packages("data.table")
library("data.table")

df <- data.frame(mydata1=1:5,
                 mydata2=letters[1:5],
                 mydata3=c("이민호","android","한^글@@#^-","test","한글"))
df
####파일write####
write.csv(df,"encoding_test.csv", row.names=FALSE)
write.csv(df,"encoding_test_euckr.csv", row.names=FALSE, fileEncoding = "euc-kr")
write.csv(df,"encoding_test_cp949.csv", row.names=FALSE, fileEncoding = "cp949")
write.csv(df,"encoding_test_utf8.csv", row.names=FALSE, fileEncoding = "utf-8")

####깨진파일 처리하기####
read.csv("encoding_test_utf8.csv")
readLines("encoding_test_utf8.csv")
readLines("encoding_test_utf8.csv", encoding = "UTF-8") # 소문자는 깨진다! 대문자여야함

#data.table - dataframe보다 강력
dftable <- fread("encoding_test_utf8.csv")
head(dftable) # head는 위에서 몇줄, tail은 밑에서 몇줄 정해놓을 수 있다.

#인코딩함수 
Encoding(dftable$mydata3) = "UTF-8"
head(dftable)
