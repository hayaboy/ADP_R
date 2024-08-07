Sys.getlocale("LC_CTYPE")
#Sys.setlocale("LC_ALL", "ko_KR.UTF-8")
setwd('C:/R/Project/data')
DF<-read.csv('example_studentlist.csv')
DF


윈도우 사용자의 경우 아래 코드를 실행해 R의 인코딩 방식을 `UTF-8`로 설정한 후 `ggChoropleth()`로 단계 구분도를 생성하면 한글이 정상적으로 출력됩니다.

```
options(encoding="UTF-8")
```

이후 `CP949` 인코딩 방식으로 저장된 한글 파일을 불러오려면 아래 코드를 실행해 인코딩 방식을 다시 `CP949`로 설정해야 합니다.

```
options(encoding="CP949")
```

`options()`를 이용해 변경한 설정은 R을 재시작하면 원상 복구됩니다.