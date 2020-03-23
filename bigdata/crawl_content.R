library("stringr")
library("mongolite")

load(file = "crawl_data.RData")

final_data
url_list <- final_data[,3]

url <- final_data[,3]
url_data <- readLines(url[2], encoding = "UTF-8")

content_data <- url_data[which(str_detect(url_data,"<p>"))]
content <- str_extract(content_data, "(?<=p>).*(?=</p>)")

content <- gsub("<br>","",content)
content <- gsub("&nbsp","",content)
write.csv(content, "crawl_content.csv")
save(content, file="crawl_content.RData")

final_data
final_data[,3]
final_data[2,3]
