#csv는 기본 패키지로 사용가능
#csv를 읽기
mdf <-  read.csv("csv_exam.csv")
mdf
mdf[2,2]
#datafram에 조건에 만족하는 데이터 조회
m <- matrix(1:20,ncol=4)
m
d <- data.frame(m)
d
myresult <- d[d$X3>=13,]
myresult
#조건에 만족하는 result.csv로 저장
write.csv(myresult,file = "result.csv")

#실습
input <- read.csv("csv_exam.csv")
m <- data.frame(input)
result <- m[m$science>=80,]
result <- as.integer(result)
result
myfor <- c(1:4)
for (i in myfor) {
  sum <- sum(result[i,3:5])
  tot <- sum/3
  final <- cbind(result[i,],sum, tot)
  print(final)
}
result
a1
