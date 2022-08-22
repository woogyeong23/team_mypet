<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>주문상세내역 수정하기</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- css************************************************ -->
	    <jsp:include page="../../include/head.jsp" />  
	<!-- ************************************************ -->

	 <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/sidebar.css" rel="stylesheet">
    <!-- css************************************************ -->
    <jsp:include page="../../include/membermodi.jsp" />  
    	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
	 <script>
	 function execPostCode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                   extraRoadAddr += data.bname;
	               }
	               // 건물명이 있고, 공동주택일 경우 추가한다.
	               if(data.buildingName !== '' && data.apartment === 'Y'){
	                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	               }
	               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	               if(extraRoadAddr !== ''){
	                   extraRoadAddr = ' (' + extraRoadAddr + ')';
	               }
	               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	               if(fullRoadAddr !== ''){
	                   fullRoadAddr += extraRoadAddr;
	               }

	               // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               console.log(data.zonecode);
	               console.log(fullRoadAddr);
	               
	               
	               $("[name=orders_addr1]").val(data.zonecode);
	               $("[name=orders_addr2]").val(fullRoadAddr);
	               $("[name=orders_addr3]").val("");
	               /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
	               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
	               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
	           }
	        }).open();
	    }
	 
	 </script>   
	<style>
		html, body{
			height: 100%
		}
		
		#wrap {
			min-height: 100%;
			position: relative;
			padding-bottom: 60px;
		}
		
		footer {
			position: relative;
			transform:translatY(-100%);
		}
		
		html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font: inherit;
    vertical-align: baseline;
}
		div {
    display: block;
}
	
	.table-style.type2 {
    width: 100%;
    border: 1px solid #d9d9d9;
}
	.table-style:first-child {
    margin-top: 0;
}
	table {
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
    box-sizing: border-box;
}
	table>* {
    color: inherit;
    font-size: inherit;
}
	colgroup {
    display: table-column-group;
}
	col {
    display: table-column;
}

	element.style {
    width: 120px;
}
	thead {
    display: table-header-group;
	}
	.table-style.type2.th-bd tr th {
    border-left: 1px solid #d9d9d9;
}
	.table-style.type2 th:first-child {
    text-indent: 16px;
}
	.table-style.type2 th {
    background-color: #f5f5f5;
    line-height: 1.3em;
    vertical-align: middle;
}
	.table-style th {
    padding: 12px 0;
    background: #f5f5f5;
}
	.table-style th, .table-style td {
    color: #666;
}
	.ta-c {
    text-align: center !important;
}
	th {
    display: table-cell;
    }
	tbody {
    border-color: inherit;
}
	.table-style.type2 td {
    padding: 16px 0;
}
.table-style th:first-child, .table-style td:first-child {
    border-left: 0 none;
    text-align: left;
}
.table-style td {
    border-top: 1px solid #d9d9d9;
}
	.list-item-wrap div.list-item, .table-style.type2 div.list-item {
    display: table;
    width: 100%;
}
	.table-style .list-item {
    position: relative;
}
.table-style .list-item {
    padding: 16px 0;
    overflow: hidden;
}
	.list-item-wrap div.list-item, .table-style.type2 div.list-item {
    display: table;
    width: 100%;
}
	.table-style .list-item {
    position: relative;
}
.table-style .list-item {
    padding: 16px 0;
    overflow: hidden;
}
	.list-item-wrap .list-item .area-img, .table-style.type2 .list-item .area-img {
    width: 50px;
    vertical-align: top;
}
.list-item-wrap .list-item .area-txt, .list-item-wrap .list-item .area-img, .table-style.type2 .list-item .area-txt, .table-style.type2 .list-item .area-img {
    float: none;
    display: table-cell;
}
.table-style.disable-ui td .area-img {
    margin-left: 0;
}
	.list-item-wrap .list-item [data-ui=list-checker], .table-style.type2 .list-item [data-ui=list-checker] {
    display: none;
}
	element.style {
    background-image: url(https://image.idus.com/image/files/3dfb8d4…_320.jpg);
}
	.list-item-wrap .list-item .img-bg, .list-item-wrap .list-item .artist_card__img, .table-style.type2 .list-item .img-bg, .table-style.type2 .list-item .artist_card__img {
    display: inline-block;
    width: 64px;
    height: 64px;
    background: #efefef;
    vertical-align: top;
	background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
}	
	.table-style .area-img .img-bg, .table-style .area-img .artist_card__img {
    margin-left: 16px;
}	
	
	.list-item-wrap .list-item .area-txt, .table-style.type2 .list-item .area-txt {
    width: auto;
    padding-left: 8px;
    padding-right: 20px;
    vertical-align: middle;
    overflow: hidden;
}
	.table-style .area-txt {
    margin-left: 8px;
}
	.table-style.type2 td {
    padding: 16px 0;
}
	.table-style td {
    border-top: 1px solid #d9d9d9;
}
	.wow-b {
    word-wrap: break-word;
}
	.table-style.type2 .td-controller .col+.col {
    margin-top: 5px;
}
	.wow-b {
    word-wrap: break-word;
}
	.table-style.type2 .td-controller {
    padding-left: 10px;
    padding-right: 10px;
    vertical-align: middle;
}
.table-style.type2 td {
    padding: 16px 0;
}
.table-style td {
    border-top: 1px solid #d9d9d9;
}
	.order-result.root {
    display: table;
    width: 100%;
    table-layout: fixed;
    border-collapse: collapse;
}
	.order-result .row {
    display: table-row;
}
	.order-result .col {
    display: table-cell;
    border: 1px solid #555;
    padding: 20px;
    vertical-align: top;
}
	.order-result.artist-list .artist-item {
    overflow: hidden;
}
	.order-result.artist-list .artist-name+.value-list {
    margin-top: 10px;
}
.order-result.artist-list .value-list {
    overflow: hidden;
    border: 1px solid #d9d9d9;
    background: #faf9f9;
    padding: 10px 20px;
}	
	.order-result .col.no-spacing {
    padding: 0;
}
.order-result .col {
    display: table-cell;
    border: 1px solid #555;
    padding: 20px;
    vertical-align: top;
}	
	.order-result .row {
    display: table-row;
}	
	.order-result .col>.row.result-list {
    padding: 24px;
    background: #faf9f9;
}
.order-result .col>.row {
    display: block;
    width: 100%;
}	
		
		
		
		.order-memo {
    margin-top: 10px;
}
	.textarea {
    height: 50px;
}	
	.textarea .textarea-div, .textarea textarea {
    font-size: 14px;
    line-height: 20px;
    border: 1px solid #acacac;
    width: 100%;
    height: 100%;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding: 8px;
    /* -webkit-border-radius: 2px; */
    -moz-border-radius: 2px;
    border-radius: 2px;
    -webkit-transition: all 150ms;
    -o-transition: all 150ms;
    -moz-transition: all 150ms;
    transition: all 150ms;
    resize: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
}	
	.order-result.artist-list .value-name {
    float: left;
}	
		.order-result.artist-list .value-price {
    float: right;
}
	.order-result.artist-list .value-item {
    overflow: hidden;
}	
		
		
	
	</style>

</head>

<body>
<div id="wrap">

	<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->
	
	
	
	
	<section class="product-grids section">
	<form name="frm" action="${pageContext.request.contextPath}/seller_ordersModifProcess.do?midx=${member_id}&detail_idx=${ordersContent.detail_idx}" method="post"  enctype="multipart/form-data">
	
		<div class="container">
			<div class="row">
			
				<!-- sidebar -->
				<div class="col-md-3 col-12">
					<div class="product-sidebar">
							<!-- 사이더와 js************************************************ -->
						    <jsp:include page="../../include/seller_sidebar.jsp" />  
					</div>
				</div>
				<!-- /sidebar -->
				
				<!-- content -->
				<div class="col-md-9 col-12">
					<div class="tab-content" id="nav-tabContent">
						<h3 class="pb-1 border-bottom" style="margin-bottom:10px; font-size: 24px;font-weight: bold;vertical-align: middle;color: #333;">주문 상세내역 수정</h3>
						
						
						<section>
	            			
							<table class="table" style="border : 1px solid #d9d9d9;">
							  <thead>
							    <tr>
							      <th scope="col">주문번호</th>
							      <th scope="col">상품명</th>
							      <th scope="col">고객 이메일/이름</th>
							      <th scope="col">상태</th>
							      <th scope="col">가격</th>
							      <th scope="col">주문날짜</th>
							    </tr>
							  </thead>
							  <tbody class="table-group-divider">
									<tr>
								      <td><a href="${pageContext.request.contextPath}/seller_ordersDetail.do?detail_idx=${ordersContent.detail_idx}">${ordersContent.detail_idx}</a></td>
								      <td>${ordersContent.p_name}</td>
								      <td>${ordersContent.m_name} / ${ordersContent.m_id}</td>
								      <td>
								     	 <c:choose>
								     	 	<c:when test="${ordersContent.detail_status == 0}">입금대기</c:when>
											<c:when test="${ordersContent.detail_status == 1}">결제완료</c:when>
											<c:when test="${ordersContent.detail_status == 2}">준비중</c:when>
											<c:when test="${ordersContent.detail_status == 3}">배송중</c:when>
											<c:when test="${ordersContent.detail_status == 4}">배송완료</c:when>
											<c:when test="${ordersContent.detail_status == 5}">구매확정</c:when>
										</c:choose>
								      </td>
								      <td><fmt:formatNumber value="${ordersContent.fixprice}" pattern="#,###" />원</td>
								      <td>${ordersContent.orders_day}</td>
								    </tr>					    
							  </tbody>
							</table>
                			<br><br>
			                    <h2 class="title2-style mt30">요청 사항</h2>
			                    <br>
			                    <input type="textarea" style="  width: 100%;
								    height: 130px;
								    padding: 9px;
								    border: 1px solid #ddd;
								    font-size: 15px;
								    resize: none;
								    color: #000;"
								    name="detail_request"
								    required
								    value="${ordersContent.detail_request}">
								    
			                    
			                   <br>
			                   <br>
				            <div class="">
				                <h2 class="title2-style mt30">배송 정보</h2><br>
				                <table class="table-style-head-left">
				                    <tbody>
				                        <tr>
				                            <th>받는분</th>
				                            <td><input type="text" required name = "orders_name" value="${ordersContent.orders_name}"></td>
				                        </tr>
				                        <tr>
				                            <th>전화</th>
				                            <td><input type="text" required name = "orders_phone" value="${ordersContent.orders_phone}"></td>
				                        </tr>
				                        <tr>
				                            <th>주소</th>
				                            <td>
				                            	<div class="form-group">                   
												<input class=" " style="width: 40%; display: inline;" placeholder="우편번호" name="orders_addr1" id="orders_addr1" type="text" value="${ordersContent.orders_addr1}" readonly="readonly" >
												    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
												</div>
												<div class="form-group">
												    <input class=" " style="top: 5px;" placeholder="도로명 주소" name="orders_addr2" id="orders_addr2" type="text" value="${ordersContent.orders_addr2}" readonly="readonly" />
												</div>
												<br>
												<div class="form-group">
												    <input class=" " placeholder="상세주소" name="orders_addr3" id="orders_addr3" value="${ordersContent.orders_addr3}" type="text"  />
												</div>
				                            
				                             </td>
				                        </tr>
				                    </tbody>
				                </table>
				            </div>

                   			<br>
			                 <div >
			                    <br>
			                    
                                    </section>
						<input type="hidden" name="orders_idx" value="${ordersContent.orders_idx}">
							<input type="button"  class="btn btn-light" onclick="history.back(-1)" value="취소">
						<input type="submit" class="btn btn-light" value="수정완료">
						
						
						
					</div>
				</div>
				<!-- /content -->
				
			</div>
		</div>
	</form>
	</section>
	
</div>

	
	
	
	
	
	<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
	<!-- ************************************************ -->
	
</body>
</html>        