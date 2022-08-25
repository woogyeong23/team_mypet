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
	
	<script>
function update(){

		
		  		alert("주문상세 수정 완료");
		  		//fm.action = "./memberJoinOk.jsp";
		  		//가상경로 사용 ${pageContext.request.contextPath}/registProcess.do
		  		fm.enctype="multipart/form-data"
		  		fm.action = "<%=request.getContextPath()%>/seller_productModifProcess.do";
		  		fm.method = "post";
		  		fm.submit();  
		  
		    return;
	}
	</script>
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
							      <th scope="col">상품명</th>
							      <th scope="col">고객 이메일/이름</th>
							      <th scope="col">상태</th>
							      <th scope="col">가격</th>
							      <th scope="col">주문날짜</th>
							    </tr>
							  </thead>
							  <tbody class="table-group-divider">
									<tr>
								      <td>${ordersContent.detail_completeday}</td>
								      <td><a href="${pageContext.request.contextPath}/productView.do?p_idx=${ordersContent.p_idx}&seller_idx=${ordersContent.p_idx}">${ordersContent.p_name}</a></td>
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
								    readonly
								    value="${ordersContent.detail_request}">
								    
			                    
			                    <br>
			                    
			                    
			                    
				            <div class="">
				                <h2 class="title2-style mt30">배송 정보</h2><br>
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
				                            <td>${ordersContent.orders_addr1} 
				                            <br>${ordersContent.orders_addr2}
				                            <br> ${ordersContent.orders_addr3}</td>
				                        </tr>
				                    </tbody>
				                </table>
				            </div>

                   			<br>
			                 <div >
			                    <h2 class="title2-style mt30">결제 정보</h2>
			                    <br>
			                    <div class="order-result root">
			                        <div class="row">
			                            <div class="col order-result artist-list">
			                                    <div class="artist-item">
			                                        <div class="value-list" style="color:black">
			                                            <div class="value-item">
			                                                <div class="value-name">
			                                                        ${ordersContent.p_name} ( ${ordersContent.detail_cnt}개 )   
			                                                </div>
			                                                <div class="value-price">
			                                                        <fmt:formatNumber value="${product_price}" pattern="#,###" />원                                                  
			                                                </div>
			                                            </div>
			                                            <div class="value-item">
			                                                <div class="value-name">
			                                                    배송비
			                                                </div>
			                                                <div class="value-price">
			                                                     <c:if test="${ordersContent.fixprice >= ordersContent.p_free_dvprice}">0원</c:if>
			                                                     <c:if test="${ordersContent.fixprice < ordersContent.p_free_dvprice}"><fmt:formatNumber value="${ordersContent.p_dvprice}" pattern="#,###" />원</c:if>    
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
			                                                    사용 적립금
			                                                </div>
			                                                <div class="value-price">
			                                                    0원                                                
			                                                </div>
			                                            </div>
			                                            <div class="value-item">
			                                                <div class="value-name">
			                                                    총 가격
			                                                </div>
			                                                <div class="value-price">
			                                                	<fmt:formatNumber value="${total_price}" pattern="#,###" />원      
			                                                </div>
			                                            </div>
			                                        </div>
			                                    </div>
			                            </div>
			                            
			
			                        </div>
			                        
			                	</div>    
			                	<br><br>
			                
			                	<form name="frm2" action="${pageContext.request.contextPath}/seller_DetailStatusUpdate.do?midx=${member_id}&detail_idx=${ordersContent.detail_idx}" method="post"  enctype="multipart/form-data">
			                	
			                    <h2 class="title2-style mt30">진행 내역 
			                    	<c:if test="${ordersContent.detail_status == '1' || ordersContent.detail_status == '2' || ordersContent.detail_status == '3'}">
			                    	<input type="submit" style="float:right" class="btn btn-danger" value="업데이트">
			                    	</c:if>
			                    	
			                    </h2>
			                    </form>
			                    <br>
			                	<table class="table">
								  
								  <tbody>
								    <tr class="table-active">
								    	<td>상태</td>
								    	<td>진행 일시</td>
								    </tr>
								    <c:forEach var="Detail_DayVo" items="${detailDayListVo}">
										<tr>
											<td>
											
											
												<c:if test="${Detail_DayVo.detail_status == '0'}">입금대기</c:if>
												<c:if test="${Detail_DayVo.detail_status == '1'}">결제완료</c:if>
												<c:if test="${Detail_DayVo.detail_status == '2'}">준비중</c:if>
												<c:if test="${Detail_DayVo.detail_status == '3'}">배송중</c:if>
												<c:if test="${Detail_DayVo.detail_status == '4'}">배송완료</c:if>
												<c:if test="${Detail_DayVo.detail_status == '5'}">구매확정</c:if>
											</td>
											<td><fmt:formatDate value="${Detail_DayVo.detail_progressday}" pattern="yyyy-MM-dd"/>	
											
											</td>
										</tr>
										
										
										
										
									</c:forEach>
								  </tbody>
								</table>
			                	
			                	
			                	
			                	
							</div>
                                    </section>
						<br>
			            <form name="frm1" action="${pageContext.request.contextPath}/seller_ordersModif.do?midx=${member_id}&detail_idx=${ordersContent.detail_idx}" method="post"  enctype="multipart/form-data">
							<input type="button"  class="btn btn-light" onclick="history.back(-1)" value="뒤로가기">
<%-- 							<input type="button"  class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/seller_ordersList.do'" value="목록">
 --%>							
							<input type="hidden" name="orders_idx" value="${ordersContent.orders_idx} ">
							<input type="hidden" name="detail_idx" value="${ordersContent.detail_idx} ">
							<c:if test="${ordersContent.detail_status == '0' || ordersContent.detail_status == '1'|| ordersContent.detail_status == '2'}">
							<input type="submit" class="btn btn-light" value="요청사항/배송사항 수정하기">
							</c:if>
						</form>
						<c:if test="${ordersContent.detail_status == '0' || ordersContent.detail_status == '1'|| ordersContent.detail_status == '2'}">
							<input type="button" style="float:right; margin-right:30px;" name="cancle" class="btn btn-light" value="취소신청">
						
						</c:if>
						<c:if test="${ordersContent.detail_status == '3' || ordersContent.detail_status == '4'}">
							<input type="button" style="float:right; margin-right:30px;" name="cancle" class="btn btn-light" value="환불신청">
						
						</c:if>
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