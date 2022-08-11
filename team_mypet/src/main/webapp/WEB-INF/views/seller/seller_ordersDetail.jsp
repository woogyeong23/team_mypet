<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>주문상세내역</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- css************************************************ -->
	    <jsp:include page="../../include/head.jsp" />  
	<!-- ************************************************ -->

	 <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/sidebar.css" rel="stylesheet">
    <!-- css************************************************ -->
    <jsp:include page="../../include/membermodi.jsp" />  
    
	    
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
						<h3 class="pb-1 border-bottom" style="margin-bottom:10px; font-size: 24px;font-weight: bold;vertical-align: middle;color: #333;">주문 상세내역</h3>
						
						
						<section>
	            			<table class="table" style="border : 1px solid #d9d9d9;">
							  <thead>
							    <tr>
							      <th scope="col">주문번호</th>
							      <th scope="col">고객 이메일/이름</th>
							      <th scope="col">상태</th>
							      <th scope="col">가격</th>
							      <th scope="col">주문날짜</th>
							    </tr>
							  </thead>
							  <tbody class="table-group-divider">
									<tr>
								      <td>${orders.orders_idx}</td>
								      <td>${orders.m_name} / ${orders.m_id}</td>
								      <td>
								     	 <c:choose>
								     	 	<c:when test="${orders.orders_status == 0}">입금대기</c:when>
											<c:when test="${orders.orders_status == 1}">결제완료</c:when>
											<c:when test="${orders.orders_status == 2}">준비중</c:when>
											<c:when test="${orders.orders_status == 3}">배송중</c:when>
											<c:when test="${orders.orders_status == 4}">배송완료</c:when>
											<c:when test="${orders.orders_status == 5}">구매확정</c:when>
										</c:choose>
								      </td>
								      <td><fmt:formatNumber value="${orders.bundleprice}" pattern="#,###" />원</td>
								      <td>${orders.orders_day}</td>
								    </tr>					    
							  </tbody>
							</table>
							<table class="table" style="border : 1px solid #d9d9d9;">
							  <thead>
							    <tr>
							      <th scope="col">주문번호</th>
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
                
				            <div class="">
				                <h2 class="title2-style mt30">배송 정보</h2>
				                <table class="table-style-head-left">
				                    <tbody>
				                        <tr>
				                            <th>받는분</th>
				                            <td>${ordersContent.orders_name}</td>
				                        </tr>
				                        <tr>
				                            <th>전화</th>
				                            <td>${ordersContent.orders_phone}</td>
				                        </tr>
				                        <tr>
				                            <th>주소</th>
				                            <td>${ordersContent.orders_addr} ${ordersContent.orders_detailaddr}</td>
				                        </tr>
				                    </tbody>
				                </table>
				            </div>

                   
			                 <div >
			                    <h2 class="title2-style mt30">결제 정보</h2>
			                    <div class="order-result root">
			                        <div class="row">
			                            <div class="col order-result artist-list">
			                                    <div class="artist-item">
			                                        <div class="value-list" style="color:black">
			                                            <div class="value-item">
			                                                <div class="value-name">
			                                                        ${ordersContent.p_name} ( ${ordersContent.detail_cnt} )   
			                                                </div>
			                                                <div class="value-price">
			                                                        <fmt:formatNumber value="${ordersContent.p_dvprice}" pattern="#,###" />원                                                  
			                                                </div>
			                                            </div>
			                                            <div class="value-item">
			                                                <div class="value-name">
			                                                    배송비
			                                                </div>
			                                                <div class="value-price">
			                                                    3,000원                                                
			                                                </div>
			                                            </div>
			                                            <div class="value-item">
			                                                <div class="value-name">
			                                                    제주 / 도서산간 추가비용
			                                                </div>
			                                                <div class="value-price">
			                                                    0원
			                                                </div>
			                                            </div>
			                                            <div class="value-item">
			                                                <div class="value-name">
			                                                    할인쿠폰
			                                                </div>
			                                                <div class="value-price">
			                                                    0원                                                
			                                                </div>
			                                            </div>
			                                            <div class="value-item">
			                                                <div class="value-name">
			                                                    배송비 할인쿠폰
			                                                </div>
			                                                <div class="value-price">
			                                                    0원 
			                                                </div>
			                                            </div>
			                                        </div>
			                                    </div>
			                            </div>
			                            
			
			                        </div>
			                        
			                	</div>    
							</div>
                                    </section>
						
						<input type="button" value="수정">
						
						
						
						
					</div>
				</div>
				<!-- /content -->
				
			</div>
		</div>
	</section>
	
</div>

	
	
	
	
	
	<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
	<!-- ************************************************ -->
	
</body>
</html>        