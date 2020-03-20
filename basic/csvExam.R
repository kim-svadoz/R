#실습
#csv_exam.csv를 읽어서 데이터를 수정한 후 csv_exam_result.csv로 저장하기

#-  science가 80이상인 데이터를 추출
#-  추출된 데이터에 mytotal과 myavg컬럼을 추가
#-  mytotal : 모든 과목의 총점
#-  myavg : 모든 과목의 평균
mydata <- read.csv("csv_exam.csv")
mydataResult <- mydata[mydata$science>=80, ]
mydataResult$mytotal <- as.numeric(mydataResult$math+mydataResult$english+mydataResult$science)
mydataResult$myavg <- as.numeric(mydataResult$mytotal/3)
write.csv9mydataResult, file="result.csv"
