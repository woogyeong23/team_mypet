<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event List</title>
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
margin-right: 20%;
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

                        <h2><span class="cur">자주하는 질문</span></h2>
                        <p>고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</p>

                    </div>
                    <div style="display:flex; position:relative">
                        <div class="side_nav"style="float:left;">
                   <nav>
                   <b style=" padding: 5px 0px 35px 1px; font-weight: 500; font-size: 28px; line-height: 35px;
    color: rgb(51, 51, 51);
    letter-spacing: -1px;"> 고객센터 </b>
                       <ul>
                   		    <li><a href="${pageContext.request.contextPath}/Notice">공지사항</a></li>
                   		    <li><a href="#"><span class="cur">이벤트</span></a></li> 
                   			<li><a href="${pageContext.request.contextPath}/MostQuery">자주하는 질문</a></li> 
                   			<li><a href="#">1:1문의</a></li>
                   			<li><a href="#">입점문의</a></li>  
                       </ul>
                    </nav>
                    </div>
                    
                                
                    
                    
                    
           
      <div class="outer">
                    <ul style="margin-top:50px;">
<li><b style="display: block;
    padding-right: 80px;
    font-size: 18px;
    font-weight: bold;
    color:#000000;"><a href="${pageContext.request.contextPath}/EventView">이벤트1111111111</a></b>
 <span style="    display: block;
    margin: 2px 0 13px 0;
    color: rgba(0,0,0,0.56);
    font-size:15px;">기간 2022.08.02~끝날때까지</span> </li>

<li><details>
<summary>[포장/배송]  상품은 어떻게 포장되나요?<br><br></summary>
<p>■ 포장법 안내
<br>
<br>
상품 보관방법별로 구분하여 포장 됩니다. ( 상온 / 냉장 / 냉동 )
<br>
- 상온 : 보냉재 X
<br>
- 냉장 : 보냉재 O - 아이스팩(only 물)
<br>
- 냉동 : 보냉재 O - 드라이아이스(or PCM 사용)
<br>
* 깨지기 쉬운 제품인 경우 종이 또는 비닐 완충제를 사용합니다.
<br>
* 박스에 들어가지 않는 상품은 별도 외포장하여 송장 부착 후 배송 됩니다.
<br>
* 상온+냉장 일부 상품의 경우, 많은 포장재 사용을 자제하고자 합포를 진행하고 있습니다.
<br>
기본적으로 컬리는 최대한 사람과 환경 모두에게 이로운 방법으로 상품을 포장하고자 합니다.
<br>
이에 현재 일부 배송지역은 전면 포장재를 종이로 활용하고 있으나, 일부로는 비닐 소재도 함께 혼용하고 있으며 최근에는 마이펫 전용박스를 개발하여 재사용할 수 있는 방법 또한 강구하였습니다.
<br>
상품뿐만이 아니라 유통, 배송과정 고려하여 친환경 캠페인에 동참할 수 있도록 노력하는 마이펫가 되겠습니다.</p>
</details> </li>
<!-- --------------------------구분선----------------------------------------- -->
<li><details>
<summary>[반품/취소]반품신청 기간이 어떻게 되나요?<br><br></summary>
<p>교환/반품은 배송 완료 후 7일 이내 접수 가능합니다.<br>
기한 경과 후 교환/반품이 필요하다면 판매자에게 문의해 주세요.<br>
기한 경과 후 판매자와 협의 없이 임의로 판매자에게 상품을 발송하는 경우 교환/반품이 거절될 수 있습니다.</p>
</details> </li>
<!-- --------------------------구분선----------------------------------------- -->

<li><details>
<summary>[공통] 현금영수증 발급받고 싶어요.<br><br></summary>
<p>현금영수증은 현금성 결제수단으로 결제 시 발급이 가능합니다.
<br>
결제 단계에서 현금영수증을 신청하면 자동으로 발행되지만,<br>
신청을 누락했거나 발행받지 못한 경우라면 영수증 확인 후 국세청에서 자진발급분을 등록해 주시길 바랍니다.<br>
<br>
[네이버페이]<br>
- 결제 단계에서 현금영수증 신청하면 자동으로 발행 (19년 12월 26일 시행)<br>
- 자진발급 : 네이버페이 > 결제내역 > 주문건 > 주문상세정보 > 영수증 발급내역 > 현금영수증 확인<br>
- 단, 19년 12월 26일 10시 이전 결제 건은 여기어때 고객행복센터로 요청<br>
<br>
[간편계좌이체 / TOSS / PAYCO]<br>
- 결제 단계에서 현금영수증 신청하면 자동으로 발행<br>
- 단, 간편계좌이체의 경우 신청 누락 시 여기어때 고객행복센터로 요청<br>
<br>
[카카오페이] <br>
- 카카오페이머니 결제 시 자동으로 발행 <br>
- 자진발급 : 카카오톡 > pay > 우측톱니바퀴(나의 카카오페이) > 이용내역 > 결제 > 개별 상세내역 > 현금영수증 확인</p>
</details> </li>

<!-- --------------------------구분선----------------------------------------- -->
<li><details>
<summary>[취소/교환/환불] 교환(반품) 진행 시, 배송비가 부과 되나요?<br><br></summary>
<p>■ 교환(반품) 진행 시, 배송비 안내
<br>
<br>
- 단순변심에 의한 교환/반품 시 배송비 6,000원 (주문건 배송비를 낸 경우 3,000원)을 고객님께서 부담하셔야합니다. 
<br>
<br>
▶ 가공식품 및 일부 비식품류에 한해서만 반품 가능
<br>
① 상품에 이상이 없거나 상품의 특성적인 부분인 경우
<br>
② 단순 변심에 의해 교환 및 반품하는 경우
<br>
③ 옵션 및 상품을 잘못 선택하여 잘못 주문했을 경우
<br>
<br>
▶ 판매자 과실 등 상품에 문제로 인해 교환 시 판매자 부담
<br>
① 수령한 상품이 불량인 경우
<br>
② 수령한 상품이 파손된 경우 
<br>
③ 상품이 상품상세정보와 다른 경우
<br>
④ 주문한 상품과 다른 상품이 배송된 경우 등</p>
</details> </li>
<!-- --------------------------구분선----------------------------------------- -->

<li><details>
<summary>[취소/변경/환불] 배송지 주소를 변경할 수 있나요?<br><br></summary>
<p>판매업체 확인 후 상품준비중 단계까지는 변경이 가능합니다.</p>
</details> </li>
<!-- --------------------------구분선----------------------------------------- -->

<li><details>
<summary>[배송] 상품마다 배송비가 다른 이유가 뭔가요?<br><br></summary>
<p>상품마다 판매업체가 상이하며, 판매업체마다 이용하는 계약 택배사가 달라 배송비 또한 달라질 수 있습니다.
<br>
또한 상품의 부피/무게에 따라서도 부과되는 배송비가 상이합니다.
<br>
구매를 원하시는 상품의 배송비는 상품 상세페이지를 통해 확인하실 수 있습니다.</p>
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