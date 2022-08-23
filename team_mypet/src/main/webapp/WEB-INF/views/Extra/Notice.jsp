<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
<style>
ul li summary{
border-bottom: 1px solid #e6e6e6;
color:rgba(0,0,0,0.87);
pdding-bottom: 10px;
}

ul li summary::after{
border-bottom: none;
}

.outer ul li{
 margin: 30px 0px;
 font-size: 18px; 
 line-height: normal; 
}
.outer ul li details p{
padding-top:20px;
padding-bottom:20px;
background: #fafafa;
}

.outer {
margin-left: 20%;
/* margin-right: 20%; */
}

.outer ul li p{
background: rgba(0,0,0,0.08);
font-size: 13px;
line-height: 26px;
color:#252525;
padding-top:20px;
padding-bottom:20px;
padding-left:20px;
padding-right:20px;
}

 details summary::marker{
  font-size:0;
 }
 
 .side_nav nav ul li{
  	display: block;
    font-size: 18px;
    color: rgba(0,0,0,0.56);
    margin: 15px 0px;
 } 
 
 .side_nav nav ul li a{
 text-decoration: none;   
 color: rgba(0,0,0,0.56);
 }
 
  .side_nav nav{
    display: block;
    float: left;
    width: 150px;
    padding-left: 10px;
  }
  
  .cur{
  color:rgb(237,73,86);
  font-weight: bold;
  }
 
  
 

</style>
</head>
<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ************************************************ -->
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">고객센터</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/home.do"><i class="lni lni-home"></i>Home</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
       <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">

                        <h2><span class="cur">공지사항</span></h2>
                        <p>마이펫의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</p>

                    </div>
                    <div style="display:flex; position:relative">
                    <div class="side_nav"style="float:left;">
                   <nav>
                   <b style=" padding: 5px 0px 35px 1px; font-weight: 500; font-size: 28px; line-height: 35px;
    color: rgb(51, 51, 51);
    letter-spacing: -1px;"> 고객 센터 </b>
                       <ul>
                   			<li><a href="#"><span class="cur">공지사항</span></a></li>
                   			<li><a href="${pageContext.request.contextPath}/EventList">이벤트</a></li> 
                   			<li><a href="${pageContext.request.contextPath}/MostQuery">자주하는 질문</a></li> 
                   			<li><a href="mailto:abcdeef123@naver.com">1:1문의</a></li>
                   			<li><a href="https://docs.google.com/forms/d/e/1FAIpQLSfsBMMYEBXM_XxHIlugThMzUptM52H9wElzsGNrMBr_8sQMQw/viewform" target="_blank">
                   			입점문의</a></li>  
                       </ul>
                    </nav>
                    </div>
           
      <div class="outer">
                    <ul style="margin-top:50px;">
 <li><details>
<summary>[발표]  8월 이달의 리뷰왕을 찾습니다 당첨 안내<br>
<span style="font-size: 16px; color: rgba(0,0,0,0.38);">2022.08.24</span><br><br><br></summary>
<p>안녕하세요 반려동물을 위한 마이펫입니다.
<br>
[8월 이달의 리뷰왕을 찾습니다] 이벤트 당첨자를 발표합니다.
<br>
<br>
당첨을 축하드리며 앞으로도 많은 이용 부탁드리겠습니다.
<br>
감사합니다. 
<br>
<br>
[당첨안내]
<br>
■ 마이펫 5만원 할인쿠폰 (10명)
<br>
_ 8월의 리뷰 중 화제가 되었던 리뷰어 10명 당첨자 선정
<br><br>
■ 리뷰왕(10명)
<img alt="이벤트 사진" src="${pageContext.request.contextPath}/resources/Extra/noticeimg.png">
<br>
* 참고하세요
<br>
- 당첨자 정보는 닉네임 일부로 표시됩니다.
<br>
- 당첨 경품은 마이펫 5만원 할인쿠폰으로 9월 12일(금)에 일괄 지급됩니다.
<br>
- 본 쿠폰의 유효기간은 지급일로부터 90일 이내 입니다.
<br>
- 본 쿠폰은 타 이벤트 쿠폰과 중복 사용이 불가합니다.
</p>
</details> </li>

<!-- --------------------------구분선----------------------------------------- -->


<li><details>
<summary>[안내] 마이펫 구매 후기 정책 변경 안내<br>
<span style="font-size: 16px; color: rgba(0,0,0,0.38);">2022.08.22</span>
<br><br><br></summary>
<p>공지 ❑ 마이펫 구매 후기 정책 변경 안내
<br><br>
안녕하세요,<br>
마이펫 입니다. 
<br><br> 
작품의 구매 후기 작성 가능한 기준에 대한 서비스 정책 변경 안내드립니다. 
<br><br> 
● 기존 : 언제든 작성 가능<br>
● 변경 : 작품 발송 완료 후 6개월<br>
● 적용 시점<br>
- 안드로이드 : 2022년 12월 말 이후~<br>
- iOS : 2023년 2월 말 이후~<br>
<br><br>
기기 종류에 따라 적용 시점에 상이하며<br>
별도 추가 공지 이전까지<br>
WEB에서는 기존 정책에 따라 후기 작성이 가능합니다.
<br><br> 
작성 가능 기간이 지나면 더 이상 후기 작성이 불가하오니,<br>
고객님의 풍부한 사용 경험을 알려주세요!<br>
 <br><br>
소중한 후기는 작가님에게 큰 힘이 됩니다 :D<br>
감사합니다.</p>
</details> </li>

<!-- --------------------------구분선----------------------------------------- -->

<li><details>
<summary>[안내] 이용 중 발견하신 오류 또는 기능상의 불편, 건의사항을 알려주세요.<br>
<span style="font-size: 16px; color: rgba(0,0,0,0.38);">2022.08.20</span><br><br><br></summary>
<p>공지 ❑ 이용 중 발견하신 오류 또는 기능상의 불편, 건의사항을 알려주세요.
<br><br>
고객님 안녕하세요<br>
마이펫입니다.
 <br><br>
관심과 애정으로 마이펫을 이용해 주시는 점, 깊이 감사드립니다.
 <br><br>
혹시 아이디어스 이용 중 기능의 오류 또는 불편사항을 발견하셨나요?
 <br><br>
원활하고 안정적인 서비스를 제공해 드리기 위하여<br>
밤낮을 가리지 않고 노력 중이나 다소 부족함이 있었던 것 같습니다.
 <br><br>
번거로우시겠지만 아래의 설문으로 오류 내용 또는 기능 개선 의견을 알려주시면<br>
꼼꼼히 확인하고 빠르게 개선해 나갈 수 있도록 노력하겠습니다.
<br><br><br>
항상 고객님의 의견에 귀 기울이며 발전하는 마이펫이 되겠습니다.
<br><br>
혹시 기능 오류 또는 불편사항이 아닌, 작가님과 소통 중 문제, 불편이 생기신 경우라면
마이펫 고객센터로 바로 연락 주시면 빠르게 도움드리겠습니다.
 
■ 고객센터: 1234-5678
■ 카카오톡: 카카오톡 채널 - 마이펫
■ 이메일: abcdeef123@naver.com
 
감사합니다.</p>
</details> </li>



<!-- --------------------------구분선----------------------------------------- -->

<li><details>
<summary>[시스템] 서비스 점검 안내(8/23 03:00~06:30)<br>
<span style="font-size: 16px; color: rgba(0,0,0,0.38);">2022.08.17</span><br><br><br></summary>
<p>안녕하세요. 마이펫입니다.
<br>
<br>
더 나은 서비스 제공을 위한 점검 안내드립니다.
<br>
점검 시간 동안에는 여기어때 앱/웹 이용이 일시 중지됩니다.
<br>
<br> 
■  마이펫 시스템 점검 안내
<br>
<br>
- 일시: 2022년 8월 23일(화) 오전 3시 ~ 6시 30분 (3시간 30분)
<br>
- 점검 사유 : 시스템 업그레이드
<br>
- 점검 영향 : 점검 시간 동안 서비스 이용 불가.
<br>
<br>
점검 시간은 변경될 수 있으며 변경 시 공지를 통해 안내 드리겠습니다.
<br>
<br>
더 좋은 서비스로 보답하는 마이펫이 되겠습니다.
<br>
감사합니다.</p>
</details> </li>

<!-- --------------------------구분선----------------------------------------- -->
<li><details>
<summary>[안내] 수도권 배송 폭우로 인한 배송 지연 안내(2022년 8월 8일 저녁)<br>
<span style="font-size: 16px; color: rgba(0,0,0,0.38);">2022.08.08</span><br><br><br></summary>
<p>안녕하세요, 고객님. 마이펫입니다.<br><br>
2022년 8월 8일 저녁부터 수도권 지역 폭우로 도로 곳곳이 침수 피해를 입었습니다.<br>
배송매니저님의 안전을 위하여 서행 운전 하였으며,<br>
일부 도로가 침수로 통제되어 우회 도로를 이용하느라 부득이 배송이 다소 지연될 수 있는 점<br>
 양해 부탁 드립니다.<br><br>
고객님 가정에도 비로 인한 피해 없으시길 기원하겠습니다.<br>
마이펫 드림.</p>
</details> </li>

<!-- --------------------------구분선----------------------------------------- -->
<li><details>
<summary>[안내] 카드사 무이자 할부 안내<br>
<span style="font-size: 16px; color: rgba(0,0,0,0.38);">2022.07.29</span><br><br><br></summary>
<p>공지 ❑ <span style="color: #ff6600;">[2022년 8월]</span> 카드사 무이자 할부 안내
<br><br>
▶ 기간 : 2022년 8월 1일 ~ 2022년 8월 31일<br>
▶ 금액 : 5만원 이상
<br><br>
<span style="color: #ff6600;">▣ 무이자 안내</span><br>  
▶ 대상카드사<br>
1. 하나카드 (하나SK/외환): 2, 3, 4, 5, 6, 7, 8개월 무이자<br>
2. 비씨카드: 2, 3, 4, 5, 6, 7개월 무이자<br>
3. 현대카드: 2, 3, 4, 5, 6, 7개월 무이자<br>
4. 신한카드: 2, 3, 4, 5, 6, 7개월 무이자<br>
5. KB국민카드: 2, 3, 4, 5, 6, 7개월 무이자<br>
6. 삼성카드: 2, 3, 4, 5, 6개월 무이자<br>
7. NH농협카드: 2, 3, 4, 5, 6, 7, 8개월 무이자<br>
8. 롯데카드: 2, 3, 4개월 무이자<br>
9. 우리카드: 2, 3, 4, 5, 6, 7개월 무이자<br>
10. 전북카드 : 2, 3, 4, 5개월 무이자
<br><br>
<span style="color: #ff6600;">▣ 부분 무이자할부 안내 (할부 회차별 일부 할부수수료 면제)</span><br> 
▶ 대상카드사<br>
1. 하나카드<br>
10개월 : 1,2,3회차(고객부담), 4~10회차(무이자)<br>
12개월 : 1,2,3,4회차(고객부담), 5~12회차(무이자)
<br><br>
2. 국민카드<br>
10개월 : 1,2,3,4회차(고객부담), 5~10회차(무이자)<br>
12개월 : 1,2,3,4,5회차(고객부담), 6~12회차(무이자)
<br><br>
3. 신한카드<br>
10개월 : 1,2,3,4회차(고객부담), 5~10회차(무이자)<br>
12개월 : 1,2,3,4,5회차(고객부담), 6~12회차(무이자)
<br><br>
4. 삼성카드<br>
10개월 : 1,2,3,4회차(고객부담), 5~10회차(무이자)<br>
12개월 : 1,2,3,4,5회차(고객부담), 6~12회차(무이자)
<br><br>
5. BC카드<br>
10개월: 1~3회차(고객부담), 4~10회차(무이자)<br>
12개월: 1~4회차(고객부담), 5~12회차(무이자)<br>
8~10개월 사전신청에 한함: 1,2회차 고객부담, 잔여회차(무이자)<br>
11~12개월 사전신청에 한함: 1,2,3회차 고객부담, 잔여회차(무이자)<br>
* 신청방법 : ARS 사전 신청必 (☎1899-5772 ARS 등록 필수)<br>
※ Non-BC카드 제외
<br><br>
6. NH농협카드<br>
10개월: 1~3회차(고객부담), 4~10회차(무이자)<br>
12개월: 1~4회차(고객부담), 5~12회차(무이자)<br>
9~10개월 사전신청에 한함 : 1,2회차(고객부담), 잔여회차(무이자)<br>
11~12개월 사전신청에 한함: 1,2,3회차(고객부담), 잔여회차(무이자)<br>
* 신청방법 : ARS 사용 전 신청 必 (☎1644-2009 ARS 등록 필수)
<br><br>
7. 우리카드<br>
10개월 : 1,2,3회차(고객부담), 4~10회차(무이자)<br>
12개월 : 1,2,3,4회차(고객부담), 5~12회차(무이자)
<br><br>
8. 전북카드<br>
6~9개월 : 1회차(고객부담), 잔여회차(무이자)<br>
10~12개월 : 1,2회차(고객부담), 잔여회차(무이자)
<br>
<span style="color: #ff6600;">[유의사항]</span><br>
※ 상기행사는 카드사 사정에 의해 변경 및 중단될 수 있습니다. 자세한 사항은 각 카드사 홈페이지를 참조 바랍니다.<br>
※ 법인/기업(개인사업자)/체크/선불/GIFT/하이브리드/ 은행계열 카드 등 제외<br>
※ 무이자/부분무이자 적용 시, 포인트/마일리지 적립 불가.<br>
※ 상점부담 무이자/직계약/특별제휴가맹점,오프라인(비인증),대학등록금,지방세(세외수입,상수도),제약(B2B),주유,자동차,승차권,방송수신료,보험 등 제외<br>
※ 하나카드는 PG업종 외 서적, 학원, 면세점 등 별도업종 및 환금성가맹점, 토스카드 제외<br>
※ 비씨,NH농협카드 부분무이자 ARS 사전 신청 고객의 경우, 10,12개월 우대회차 적용</p>
</details> </li>


<!-- --------------------------구분선----------------------------------------- -->

<li><details>
<summary>[시스템] 시스템 점검으로 서비스 이용 일시 중단 안내<br>
<span style="font-size: 16px; color: rgba(0,0,0,0.38);">2022.07.20</span>
<br><br><br></summary>
<p>마이펫을 이용해 주셔서 감사합니다.
<br><br>
보다 나은 서비스 제공을 위하여 시스템 점검 작업이 진행 될 예정입니다.
<br><br>
■ <span><b>점검 기간 : 2022.7.22일(금) 23:00 ~ 2022.7.23(토) 07:00</b></span>
<br><br>
■ <b>영향도 :</b><br>
* 7.22(금) 23:00 ~ 23:30 : 주문만 불가, 홈페이지 다른 서비스 이용 가능<br>
* 7.22(금) 23:30 ~ 7.23(토) 07:00 : 마이펫 홈페이지 접속 불가<br>
<br><br>
※ 일정은 상황에 따라 변동 될 수 있습니다.
<br><br><br>
점검 기간 동안 일시적으로 서비스가 중단 됩니다. <br>
이용에 불편을 드린 점 양해 부탁 드리며, 더 나은 서비스로 돌아오겠습니다.
 <br><br>
감사합니다. <br>
마이펫 드림.
</p>
</details> </li>



 </ul>
       </div>  
                </div>

                </div>
            </div>
            </div>
            </section>
 

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />
    
</body>
</html>