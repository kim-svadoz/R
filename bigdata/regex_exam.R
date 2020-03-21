library("stringr")
#패턴
mytext <- "test$uuuuu"
mytext2 <- "https://cran.-r-project.org/"

# 패턴과 일치하는 문자열도 같이 리턴
str_extract(mytext2, ".+(:)")
# 패턴과 일치하는 문자를 찾아 일치 문자 바로 전까지리턴
str_extract(mytext2, ".+(?=:)") # 일치하는 문자열은 빼고
str_extract(mytext, ".+(?=\\$)") # #전방탐색(?=)
str_extract(mytext, "(?<=\\$).*") #후방탐색(?<=)

#문자열 관련 함수,cnt==pj

#paste - "\"(?[])
str <- c("java","hadoop","R","mongodb")
paste(str,collapse = ",")
paste0(mytext,mytext2)
#문자열안의 특정 문자열을 replace
data <- gsub("u","u",mytext)
data
