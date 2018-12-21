install.packages("corrplot")
library(corrplot)

##전체 데이터 분석
##데이터 불러오기
times<-read.csv("time.csv")
times_7<-subset(times,times$register<=7)




##이상치 및 정규성 검정하기
##히스토 그램 기반의 정규성 검정
hist(times_7$register)
hist(times_7$login)
hist(times_7$view_product_search)
hist(times_7$view_product_ranking)
hist(times_7$view_ingredient)
hist(times_7$view_review)
hist(times_7$view_hwahaeplus)
hist(times_7$view_event)

##shapiro를 활용한 정규성 검정
shapiro.test(times_7$register)
shapiro.test(times_7$login)
shapiro.test(times_7$view_product_search)
shapiro.test(times_7$view_product_ranking)
shapiro.test(times_7$view_ingredient)
shapiro.test(times_7$view_review)
shapiro.test(times_7$view_hwahaeplus)
shapiro.test(times_7$view_event)

##각 변수들이 편포를 띄고 있기 때문에 비모수 통계방법을 사용하였다
##산점도
plot(times_7)

##비모수 통계법을 적용(스피어만, 켄델)
##spearman을 사용한 상관관계분석
Spearman<-cor(times_7,method = "spearman")

##히트맵 구성
corrplot(Spearman,method = "shade",addCoef.col = "white",tl.col = "black")



##kental-T지수를 사용한 상관관계분석
Kendall<-cor(times_7,method = "kendall")


##히트맵 구성
corrplot(Kendall,method = "shade",addCoef.col = "white",tl.col = "black")
