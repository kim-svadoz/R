install.packages("KONLP")
install.packages("Sejong")
install.packages("hash")
install.packages("rJava")
install.packages("tau")
install.packages("RSQLite")
install.packages("devtools")
library(KoNLP)
library(stringr)


############## KONLP의 함수를 테스트 ################
#명사만 추출하는 함수
extractNoun("롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다.")

SimplePos09("롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다.")

############## 분석할 샘플데이터 로딩 ###############
load("comments.RData")
load("score.RData")

length(comments)
length(score)
head(comments, 10)
head(score, 10)

sampledata <- comments[1:1000]
class(sampledata)

################# 형태소 분석을 하기 위해서 명사분리 ########################
#댓글을 분리하면 분리된 명사의 갯수가 다르므로 리스트를 이용
data_list <- list()
for(i in 1:length(sampledata)){
  data <- SimplePos09(sampledata[i])
  data_list[[i]] <-  data
}
head(data_list,20)


# /로 분할 - 리스트의 모든 요소에 저장된 문자열을 /로 분리
#         => N이 있는 문자열의 첫번째 요소
# sapply를 이용하면 반복작업을 할 수 있다.
# sapply(data.frame(test=c(1,2,3,4,5,6), test2=c(3,3,3,3,3,3)), # 반복작업할 data
#               function(x){# 반복해서 적용할 함수
#                 x[1]
#               }
#       )
class(data_list)
wordlist <- sapply(str_split(data_list, "/"),function(x){
                                              x[1]
                                          })
class(wordlist)
head(wordlist,10)
