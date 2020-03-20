install.packages("beepr")
library("beepr")
beep()
for(i in 1:10){
  beep(sound = i)
  sys.sleep(1); # 1초동안 프로세스를 동작시키지 않겠다. ( 인터럽트 ~ )
}
.libPaths()
