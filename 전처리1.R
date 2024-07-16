
remove(list = ls())

#문제1
#데이터셋(basic1.csv)의 'f5' 컬럼을 기준으로 상위 10개의 데이터를 구하고,
#'f5'컬럼 10개 중 최소값으로 데이터를 대체한 후,
#'age'컬럼에서 80 이상인 데이터의'f5 컬럼 평균값 구하기

#csv 파일 한글 깨질시, 메모장으로 연 후 ansi저장후
df<-read.csv(file.choose())

#R에서 전처리는 무조건 dplyr 
install.packages("dplyr")

#ctrl + shift + m  단축키를 이용하여 chaining 기법(연속적으로 데이터를 전처리 해 나감)을 사용함

# 데이터 프레임 %>% filter(조건)

df %>% filter(age >= 90)

# 데이터 프레임 %>% select(컬럼) 원하는 칼럼 뽑기

df %>% select(f5)

# 데이터 프레임 %>% select(컬럼) 원하는 칼럼 뽑은 후 정렬 (arrange()   컬럼명에 -붙이면 내림차순)

# 데이터프레임 %>% mutate  새로운 칼럼 만들기


ifelse(TRUE , "hi" , "nice")

ifelse(FALSE , "hi" , "nice")

df$f5[10]

df$f5>=df$f5[10]

df %>% arrange(-f5)

#ifelse(df$f5>=91.297791,df$f5[10],df$f5)

df %>% arrange(-f5) %>% mutate(pre_f5=ifelse(f5>=f5[10],f5[10],f5)) %>% filter(age>=80)  %>%  summarise(value=mean(pre_f5))



df %>% arrange(-f5) %>% mutate(pre_f5=ifelse(f5>=f5[10],f5[10],f5)) 


df %>% arrange(-f5) %>% mutate(pre_f5=ifelse(f5>=f5[10],f5[10],f5)) %>% filter(age>=80)

?summarise

df %>% arrange(-f5) %>% mutate(pre_f5=ifelse(f5>=f5[10],f5[10],f5)) %>% filter(age>=80)  %>%  summarise(mean(pre_f5))

df %>% arrange(-f5) %>% mutate(pre_f5=ifelse(f5>=f5[10],f5[10],f5)) %>% filter(age>=80)  %>%  summarise(value=mean(pre_f5))


#문제 2



#문제 3




