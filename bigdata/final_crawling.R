###### 모두의 광장의 1페이지 : 10페이지의모든 게시글 크롤링 #######
# 1. 모든페이지의 title,hit,url,content 추출하기
# 2. crawl_result.csv, crawl_result.RData저장
# 3. mongodb저장 ( 300개 저장 )
# 4. for, if문을 활용

install.packages("mongolite")
library("stringr")
library("mongolite")

con <- mongo(collection = "crawl",
             db="bigdata",
             url="mongodb://127.0.0.1")

#0번부터 9번 페이지까지 반복작업
final_data_list=NULL;
for (i in 0:9) {
  ### 페이지마다 달라질 페이를준비
  myurl <- paste0("https://www.clien.net/service/group/community?&od=T31&po=",i)
  url_data <- readLines(myurl,encoding="UTF-8")
  
  ### title
  filter_data <- url_data[str_detect(url_data,"subject_fixed")]
  title <- str_extract(filter_data, "(?<=\">).*(?=</span>)")
  ### hit
  hit_data <- url_data[str_detect(url_data,"<span class=\"hit\">")]
  hit <- str_extract(hit_data, "(?<=\">).*(?=</span>)")[-1]
  ### url
  myurl <- url_data[which(str_detect(url_data,"subject_fixed"))-3]
  url_value <- str_extract(myurl, "(?<=href=\").*(?=data-role)")
  url_value <- str_sub(url_value,end=-3)
  url_value <- paste0("https://www.clien.net",url_value)
  ###### url을 이용해서 content 추출
  contentlist=NULL # 최초 변수 선언시 null로 초기화
  
  for(page in 1:length(url_value)){
    contentdata <- readLines(url_value[page], encoding="UTF-8")
    start = which(str_detect(contentdata, "post_content"))
    end = which(str_detect(contentdata, "post_ccls"))  
    content_filter_data <- contentdata[start:end]
    content_filter_data <- paste(content_filter_data, collapse = "")
    content_filter_data <- gsub("<.*?>","",content_filter_data)
    content_filter_data <- gsub("\t|&nbsp;<.*?>","",content_filter_data)
    # 기존의 저장되어 잇는 contentlist의 내용에 추가가
    contentlist <-  c(contentlist,content_filter_data)
    cat("\n",page)
  }
  
   final_data <- cbind(title,hit,url_value,contentlist)
   final_data_list<-rbind(final_data_list, final_data)
   cat("\n", i)
}

write.csv(final_data_list, "crawl_result.csv")
save(final_data_list, file="crawl_result.RData")

#### mongodb에 저장하기 ####
if(con$count() > 0){
  con$drop()
}
final_mongo_data <- data.frame(final_data_list)
con$insert(final_mongo_data)
