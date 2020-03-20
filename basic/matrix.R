#행 렬
matrix(1:15)
? matrix
mymat1 <- matrix(1:15,ncol = 3) #3열로 작성
mymat1
mymat1 <- matrix(1:15,ncol = 3,byrow = T) #1부터 15까지의 값을 3개의 열로 표현, row방향 으로 값을 추가
mymat1
#matrix에서 원하는 값을 추출하기
mymat1[2,2]
mymat1[3,3]
mymata[1,c3,3]
mymat1[1, ] # #1행에 모든 열 처리
mymat[,1] # 열의 모든 값
#1행과 3행 을 뺀 데이터
mymat1[-c(1,3),]
#1행과 3행 데이터
mymat1[c(1,3)]
########미니실습 1- 2행부터 4행까지 출력(단, 2번3번 컬럼만)#############
mymat1[2:4,c(2,3)]
#cbind는 컬럼을 추가하는 함수 - 값이 부족하면 맨 앞의 값이 채워진다.
addmymat1 <- cbind(mymat1,c(1, 11, 111, 1111))
addmymat1
addmymat2 <- rbind(mymat1,c(1,11, 111))
addmymat2
colnames(mymat1) <- c("a","b","c")
mymat1
rownames(mymat1) <- c("r1","r2","r3","r4","r5")
mymat1
mean(mymat1)


value = c(80,90,70,100,80,99,78,72,90,78,82,78,99,89,78,90)
m1 <- matrix(value,ncol=4, byrow = T)
rownames(m1) <- c("kim","lee","hong","jang")
colnames(m1) <- c("국어","영어","과학","수학")


avg_subject <- c(mean(m1[c(1:4),1]),mean(m1[c(1:4),2]),mean(m1[c(1:4),3]),mean(m1[c(1:4),4]))
avg_subject
avg_name <- c(mean(m1[1,c(1:4)]),mean(m1[2,c(1:4)]),mean(m1[3,c(1:4)]),mean(m1[4,c(1:4)]))
avg_name
