# 메인 페이지
<img src="https://postfiles.pstatic.net/MjAxOTA1MTBfMTkz/MDAxNTU3NDQ4MDUwMjg1.IbIRq3MhvzJwXiUJz-1nOSGWoajZgtDIyp3rMMUrH5Yg.ENXBAxsSLMtESd4nJSEphtWcpieN1p82CJ0sliqOoykg.PNG.younggu1545/1.PNG?type=w966"/>
<ul>
  <li>도서리뷰관리 웹 어플리케이션</li>
  <li>네이버 도서 검색 API를 사용하여 검색 시 도서 검색 결과 반환</li>
  <li>도서 별 리뷰 작성 및 평점 관리</li>
  <li>관리자 권한을 통한 개별 권한 관리 기능 구현</li>
  <li>사이트 주소 : http://minssamlib.cafe24.com/</li>
  <li>관리자 아이디 : admin, 
</ul>

# 사용 API
<ul>
  <li>네이버 도서 검색 API</li>
  <li>도서관 정보나루</li>
</ul>

# ERM
<img src="https://postfiles.pstatic.net/MjAxOTA1MDlfMjg1/MDAxNTU3Mzc1NTMxOTAy.ErL3nuiLK4TDGrcJOnfcGZJgN5brj1t3kgZTkhBxBjsg.-FcSmgQN10qeBlF2GDnS4JDnmxOFUNy3m0_CJ4pimIIg.PNG.younggu1545/erm.png?type=w966"/>
<ul>
  <li>권한 테이블을 제외한 다른 테이블은 member테이블을 외래키로 받아서 사용</li>
  <li>도서 정보는 ISBN값을 기준으로 사용하며, 필요할때 검색하여 사용</li>
</ul>

# 검색 페이지
<img src="https://postfiles.pstatic.net/MjAxOTA1MDlfMjAg/MDAxNTU3Mzc1NjcxMjQ3._bjLhVF9UGC2FWbu86HB9C8tcbmgL9VulFqcakhlKSUg.pNat0w6E7lv8xPWhU7Sszv0TpgLpu2TUHIl4G5Kal4Qg.PNG.younggu1545/1.PNG?type=w966"/>
<ul>
  <li>네이버 API 사용하여 검색 페이지 처리 진행</li>
  <li>JSON으로 결과 받아와, jsonParser를 사용하여 DTO로 변환하여 사용</li>
</ul>

# API 사용하여 결과 반환하는 메서드
<img src="https://postfiles.pstatic.net/MjAxOTA1MDlfMjcz/MDAxNTU3Mzc3MzA0OTM1.nd1HaR6p8yLrbl6IifIXvR7Y3gQZSpFH_l5WsLWueKgg.tWD_zB3jQvDT2B6nyZWgblLRUeFijD4uG2lLBDKEK8Ag.PNG.younggu1545/1.PNG?type=w966"/>
<ul>
  <li>네이버 검색 API를 사용하여 검색한 결과를 JSON으로 받아 오는 코드</li>
</ul>

# 받아온 결과값을 List로 파싱하여 반환하는 메서드
<img src="https://postfiles.pstatic.net/MjAxOTA1MDlfMTA5/MDAxNTU3Mzc3MzA0OTQx.ac-WKyn-hmXZbhNv5T5kEwYiRWfBszaQXtUvGxQVGlUg.TCWgZKeGmOxHnbIHh56YTTY4Q4FUStRR7wnU-3kjAEUg.PNG.younggu1545/2.PNG?type=w966"/>
<ul>
  <li>JSON으로 받아온 결과를 사용하기 쉽게 DTO로 변환하여 List로 반환해주는 메서드</li>
  <li>변환시 ISBN 값으로 DB에서 조회하여 Review목록 및 등록한 점수 정보를 불러와 저장</li>
</ul>

# 비동기 방식을 사용한 권환 관리 기능
<img src="https://postfiles.pstatic.net/MjAxOTA1MDlfMTg4/MDAxNTU3Mzc2ODUyODY2.DH8KDzzMMM6ef3Ww9efWGYWHZ-MFqLnmAFjL373OyMEg.XZ28kL682cHYsFIVoSxx95OmEbaWDQkceUm3Q0KKqowg.PNG.younggu1545/2.PNG?type=w966"/>
<img src="https://postfiles.pstatic.net/MjAxOTA1MDlfMjQy/MDAxNTU3Mzc2ODUyODY4.O4rVCzx7wa6_xrUla-Qn4BE29T5qQrHxp9_bo-G-YuIg.EyAJXQIhg-q1A2XGit1zIWQAP2011D-yfF2PAQmsFKUg.PNG.younggu1545/5.PNG?type=w966"/>
<ul>
  <li>Ajax 비동기 요청 처리 진행</li>
  <li>REST API를 활용하여 리스트 표시, 추가, 수정, 삭제 기능 구현</li>
  <li>기본적인 권한(일반유저,master)은 수정 불가능하며, </li>
</ul>

# AOP를 활용한 Admin 보안 기능 구현
<img src="https://postfiles.pstatic.net/MjAxOTA1MTBfMjY3/MDAxNTU3NDQ3MjE4MDIy.uFmrXHT5dLbOU2Ax7X45JoN01vJXDNWdYL-C_JGb87Eg.VeLjJv_IomySeExNH-0m7VL5r6fAIuLHlB3fybroM50g.PNG.younggu1545/1.PNG?type=w966"/>
<ul>
  <li>aop를 활용한 admin 페이지 진입 시 보안 기능 구현</li>
  <li>권한, 멤버, 리뷰, 코멘트 페이지 진입 시 각각의 권한 있는지 확인</li>
</ul>

# EL/JSTL을 사용한 데이터 표시
<img src="https://postfiles.pstatic.net/MjAxOTA1MDlfMjg5/MDAxNTU3Mzc2ODUyODY5.u0La6CffZ10jixe_LwDhf63c_tw52Rtpfb-RE-QgM4kg.JVKT4Jo9piM3s4kVfACw-3fYUshpDbMuAzGuRtrLn7Ig.PNG.younggu1545/6.PNG?type=w966"/>
<ul>
  <li>EL/JSTL을 사용한 데이터 표시</li>
  <li>EL/JSTL을 사용한 페이징 처리 구현</li>
</ul>

# JSP 구문을 활용한 데이터 표시
<img src="https://postfiles.pstatic.net/MjAxOTA1MDlfMTUy/MDAxNTU3Mzc2ODUyODcz.iQqIGQQ_4BTJ7HvC22TXcGhUdg-2pfXUy3OIsek9kQMg.S2ZzJ8rByQlQf85p6itFrfmfIOJg1Cbmz2CV7KjxHLMg.PNG.younggu1545/7.PNG?type=w966"/>
<ul>
  <li>JSP 구문을 활용한 데이터 표시</li>
  <li>JSP 구문을 활용한 페이징 처리 구현</li>
</ul>

# Join을 활용한 검색 기능
<img src="https://postfiles.pstatic.net/MjAxOTA1MDlfMTgw/MDAxNTU3Mzc2ODUyODYz.q7oDdEpqKgGZULFReUBWOG1XnhwqDESidnvnxUQVLG0g.AzbaZuWG4SlETEE42RSj6ealGYMahRETEbUfBboxf5Ug.PNG.younggu1545/4.PNG?type=w966"/>
<img src="https://postfiles.pstatic.net/MjAxOTA1MTBfMjY3/MDAxNTU3NDUxOTkzMDE5.kiqLafGVJtscCPOtOepKMmYjgfBGb5Dtqz3lNbkX1BUg.bJgT9wMzBEIJi5hjBEjdCmPS3Lt7cuP9e94XiNit2eMg.PNG.younggu1545/1.PNG?type=w966"/>
<ul>
  <li>Join문을 활용하여 서로 다른 테이블에 있는 값 가져와 검색 기능 구현</li>
</ul>
