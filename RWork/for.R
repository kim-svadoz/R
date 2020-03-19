myv <- c(1:10)
for (i in myv) {
  print(i)
}
#1부터 10가지 합 구하기
cnt <- 0
range <- c(1:10)
for(i in myv){
  cnt <- cnt+i
}
cnt
11