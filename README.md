## 노코기리로 맛집 불러오기 ##
저번시간에 배운 nokogiri 젬으로 원하는 페이지에서 불러오기

저번 시간에 배운걸 더듬어보니 파싱해올 수 있는게 있고 없는게 있었다.
예를들자면 로그인해야 파싱이 되는 경우도 있고, 동적으로 처리하는 경우에는 파싱하기 힘들었다.
그래서 저번에 테스트 하면서 konkuk.rb를 만든 것 처럼, 모델에 저장하기 전에 파싱이 가능한지 파악했고

다이닝코드의 오늘의 맛집이 가능하다는 것을 확인하고 만들게 되었다.

### 문제를 겪었던 부분 ###
1. http://suspected.tistory.com/177 처음에는 이곳을 참고해서 시작했는데
- 이곳은 모델이 아니라 배열에다 저장해서 배열의 값을 불러오는 것
- `<<` 이걸로 모델에 값을 넣을 수 있지 않을까 삽질 한시간 정도 함ㅎㅎ...바보멍청이

1. 파싱해온 부분의 html 태그가 딸려왔다.
- inner.text로 했는데도 왜 태그가 딸려왔는지는 모르겠지만, 나중에 div태그안에 속한 a 를 가져와야한다는 것을 파악
- `doc.css('.dc-restaurant-name//a').each do |x|` //a 를 추가하면서 해결되었다. 
- '진짜진짜진짜 문제가 없는데 왜 안되는거지 대체???' 할 때 서버를 껐다켜니 되었다. 

2. db에 값이 저장되어 있는지 안되어있는지 몰라서 이게 제대로 저장된걸 불러오는건지 그냥 가져다 보여주기만 하는지 확인을 못했다
- `db:drop`명령어로 날려보니까 실제로 모델에 저장되어있지 않았다. 그래서 선홍이가 이부분에 대해서 도움을 줬다.
- (선홍도움) restaurant.rb 파일 안에서 불러와서 저장시켜야 한다는 것
- 그래서 이부분에 대해서 구글링한 결과 https://stackoverflow.com/questions/6405179/parse-with-nokogiri-and-then-save-to-database,https://stackoverflow.com/questions/40563276/how-do-i-save-the-scraped-data-from-nokogiri-to-a-rails-database <- 여기에서 해결의 실마리를 찾을 수 있었다.
- 모델에 create로 값을 저장하는데 성공!!

### 마치면서 ###
- 지금은 text만 불러왔는데 링크가 걸려있는 상태로 크롤링해와서 클릭하면 해당 페이지로 이동하게끔 했으면 편했을거 같당
- 저번시간에 특정 문자를 검색하는 기능도 넣을 수 있었는데, 이 기능도 활용하면 충분히 도움될 듯.
- 이미지를 불러오는 것도 배워보고 싶다.
- 다른 친구들 보니까 검색기능도 넣었는데, 나도 넣어볼껄 그랬따....

#### 참고 ####
http://suspected.tistory.com/177
https://stackoverflow.com/questions/6405179/parse-with-nokogiri-and-then-save-to-database
https://stackoverflow.com/questions/40563276/how-do-i-save-the-scraped-data-from-nokogiri-to-a-rails-database