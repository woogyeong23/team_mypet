<%@page import="com.jeonju.mypet.vo.P_CategoryVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<!-- css***************************************************** -->
    <jsp:include page="../../include/head.jsp" />  
    <!-- fontAwesome Icon link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- ******************************************************** -->

<style>
.section {
    padding-top: 30px;
}
/*
.CategoryFilter .ProductFilter[data-v-c3969008] {
    border-top: 1px solid #d9d9d9;
}
.DesktopProductFilter__filterGroup[data-v-6d7c9b5f] {
    border-bottom: 1px solid #d9d9d9;
    border-left: 1px solid #d9d9d9;
    border-right: 1px solid #d9d9d9;
}
.DesktopProductFilter__filterColumn[data-v-6d7c9b5f] {
    padding-top: 10px;
    padding-bottom: 10px;
}
.DesktopRadioFilterRow[data-v-17b4f712] {
    display: flex;
    height: 48px;
    overflow: hidden;
    padding-left: 24px;
    font-size: 12px;
    color: #333333;
    border-bottom: 1px solid #f5f5f5;
}
.DesktopCheckboxFilterRow[data-v-238ccfae] {
    display: flex;
    height: 48px;
    overflow: hidden;
    padding-left: 24px;
    font-size: 12px;
    color: #333333;
    border-bottom: 1px solid #f5f5f5;
}
.DesktopCheckboxFilterRow[data-v-238ccfae]:last-child {
    border: none;
}
.DesktopCheckboxFilterRow__head[data-v-238ccfae] {
    display: flex;
    align-items: center;
    color: #999;
    width: 10%;
}
.DesktopCheckboxFilterRow__body[data-v-238ccfae] {
    width: 90%;
    display: flex;
    flex-wrap: wrap;
    flex-direction: start;
    align-items: center;
}
.DesktopProductFilter__sortSelector[data-v-6d7c9b5f] {
    display: inline-block;
    width: 160px;
}
.DesktopRadioFilterRow__body[data-v-17b4f712] {
    width: 90%;
    display: flex;
    flex-wrap: wrap;
    flex-direction: start;
    align-items: center;
}
.DesktopRadioFilterRow[data-v-17b4f712] {
    display: flex;
    height: 48px;
    overflow: hidden;
    padding-left: 24px;
    font-size: 12px;
    color: #333333;
    border-bottom: 1px solid #f5f5f5;
}
.DesktopRadioFilterRow__item[data-v-17b4f712] {
    display: flex;
    align-items: center;
    cursor: pointer;
    width: calc(100% / 6);
    height: 48px;
}
.DesktopRadioFilterRow__head[data-v-17b4f712] {
    display: flex;
    align-items: center;
    color: #999;
    width: 10%;
}
.DesktopCheckboxFilterRow__body[data-v-238ccfae] {
    width: 90%;
    display: flex;
    flex-wrap: wrap;
    flex-direction: start;
    align-items: center;
}
.DesktopCheckboxFilterRow__item[data-v-238ccfae] {
    display: flex;
    align-items: center;
    cursor: pointer;
    width: calc(100% / 6);
    height: 48px;
}
.filter_item[data-v-1a8254c6] {
    display: flex;
}
.DesktopCheckboxFilterRow__item[data-v-238ccfae] .checkbox .checkbox__label {
    margin-left: 4px;
}
.DesktopCheckboxFilterRow__item[data-v-238ccfae] .checkbox .input-checkbox .bp:before {
    width: 12px;
    height: 12px;
    line-height: 14px;
}
.DesktopCheckboxFilterRow__item[data-v-238ccfae] .checkbox .input-checkbox .bp:checked:before {
    font-size: 12px;
}
.checkbox[data-v-5e27c696] {
    display: inline-block;
}
.DesktopProductFilter__sortSelector[data-v-6d7c9b5f] {
    display: inline-block;
    width: 160px;
}
.SingleSelector[data-v-4dfbe33c] {
    width: 100%;
    display: inline-block;
}
.BaseSelector[data-v-4b6162e7] {
    width: 100%;
    color: #333333;
    position: relative;
    display: inline-block;
    transition: opacity 0.2s cubic-bezier(0.075, 0.82, 0.165, 1);
}

.BaseSelector__selector[data-v-4b6162e7] {
    display: none;
}
.BaseSelector__triggerButton[data-v-4b6162e7] {
    padding: 0px 12px;
    line-height: 30px;
    margin: 0;
    position: relative;
    width: 100%;
    border: 1px solid #b4b4b4;
    border-radius: 2px;
    transition: border 0.2s cubic-bezier(0.075, 0.82, 0.165, 1);
    text-align: left;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: white;
}

.BaseSelector__optionItemList[data-v-4b6162e7] {
    z-index: 101;
    position: absolute;
    overflow: hidden;
    width: 100%;
    height: 0;
    max-height: 400px;
    overflow-y: auto;
    background: #ffffff;
    border: 1px solid #ff7b30;
    border-top: 0 none;
    border-bottom: 0 none;
    border-bottom-left-radius: 2px;
    border-bottom-right-radius: 2px;
    cursor: pointer;
}
.DesktopProductFilter__filterBottom[data-v-6d7c9b5f] {
    height: 48px;
    margin-top: 26px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.DesktopCheckboxFilterRow[data-v-238ccfae]:last-child {
    border: none;
}
.input-checkbox {
    display: inline-block;
}
.checkbox__label[data-v-5e27c696] {
    color: #333333;
    font-size: 12px;
    letter-spacing: -0.2px;
}
.DesktopRadioFilterRow__label[data-v-17b4f712] {
    color: #333333;
    font-size: 12px;
    letter-spacing: -0.2px;
    margin-left: 4px;
    margin-top: -5px
}
*/

.search-btn .btn {
  display: inline-block;
  text-transform: capitalize;
  font-size: 14px;
  font-weight: 600;
  padding: 0px;
  background-color: #99CCFF;
  color: #fff;
  border: none;
  -webkit-transition: 0.2s;
  transition: 0.2s;
  border-radius: 3px;
  position: relative;
  z-index: 1;
  margin-right: 7px;
  overflow: hidden;
  height: 35px; 
  width:80px;
  text-align: center;
}

.search-btn .btn:hover {
  color: #fff;
  background-color: #081828;
  -webkit-box-shadow: 0px 4px 4px #0000000f;
  box-shadow: 0px 4px 4px #0000000f;
}

.pagination {
list-style: none;
	width : 30%;
	display: inline-block;
}

.pagination li {
	float: left;
	margin-left : 5px;
}
		
</style>
</head>

<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ******************************************************** -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                    	<c:if test="${CodeName.categoryLargeName !=null}">
                        <h1 class="page-title">${CodeName.categoryLargeName}</h1>
                    	</c:if>
                    	<c:if test="${CodeName.categoryLargeName ==null}">
                    		<c:if test="${productList.get(0).getP_category_idx() < 7}">
 	                        <h1 class="page-title">강아지</h1>
                    		</c:if>
                    		<c:if test="${productList.get(0).getP_category_idx() > 6}">
                    		<h1 class="page-title">고양이</h1>	
                    		</c:if>
	                     </c:if>            	
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
							<li><a href="${pageContext.request.contextPath}/home.do"><i class="lni lni-home"></i> Home</a></li>
  							<c:if test="${CodeName.categoryLargeName ==null}">
  							<c:if test="${productList.get(0).getP_category_idx() < 7}">
 	                        <li>강아지</li>
                    		</c:if>
                    		<c:if test="${productList.get(0).getP_category_idx() > 6}">
                    		<li>고양이</li>	
                    		</c:if>
                    		</c:if>
  							<c:choose>
  					 		<c:when test="${CodeName.categoryName eq null}">
   					 		<li>전체</li>	 	 
  					 		</c:when>
  					 		<c:otherwise>
  					 		<li>${CodeName.categoryLargeName}</li>
   					 		<li>${CodeName.categoryName}</li>	 
  					 		</c:otherwise>
  					 		</c:choose>	
                    </ul>
                </div>
            </div>
        </div>
    </div>
	
	
	<!-- 소현 -->
	<section class="trending-product section" style="margin-top: 12px;">
    <div class="container">
	<!-- 배송비/가격/크기 검색 -->
	<!-- 배송비/가격/크기 검색 끝 -->
	
	
	<div class="row">
               <c:forEach var="productVo" items="${productList}">
             <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product" style="border:none;">
                    <a href="${pageContext.request.contextPath}/productView.do?p_idx=${productVo.p_idx}&seller_idx=${productVo.seller_idx}">
                    <div class="product-image" style="height: 320px;">
                            <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${productVo.p_sys_filename}" alt="${productVo.p_name}">
                                <c:if test="${productVo.p_discount != 0}"><!-- member_grade: 0(일반회원), 1(관리자), 2(슈퍼관리자) -->
									<span class="sale-tag">-${productVo.p_discount}%</span>
								</c:if>
                    </div>
                    </a>
                        
                        <div class="product-info">
                          <span>
								<c:choose>
								   <c:when test="${productVo.p_category_idx == 1}">강아지 > 개껌</c:when>
								   <c:when test="${productVo.p_category_idx == 2}">강아지 > 스낵</c:when>
								   <c:when test="${productVo.p_category_idx == 3}">강아지 > 뼈/육포</c:when>
								   <c:when test="${productVo.p_category_idx == 4}">강아지 > 스틱</c:when>
								   <c:when test="${productVo.p_category_idx == 5}">강아지 > 프리미엄</c:when>
								   <c:when test="${productVo.p_category_idx == 6}">강아지 > 통살</c:when>
							       
							       <c:when test="${productVo.p_category_idx == 7}">고양이 > 츄르</c:when>
								   <c:when test="${productVo.p_category_idx == 8}">고양이 > 스낵</c:when>
								   <c:when test="${productVo.p_category_idx == 9}">고양이 > 캣잎</c:when>
								   <c:when test="${productVo.p_category_idx == 10}">고양이 > 통살</c:when>
								   <c:when test="${productVo.p_category_idx == 11}">고양이 > 프리미엄</c:when>
								   <c:when test="${productVo.p_category_idx == 12}">고양이 > 스틱</c:when>
								</c:choose>
							</span>
    
                            
                            <h4 class="title">
                                <a href="${pageContext.request.contextPath}/productView.do?p_idx=${productVo.p_idx}&seller_idx=${productVo.seller_idx}">
                                ${productVo.p_name}</a>
                            </h4>
                            <ul class="review">
                               <c:forEach begin="1" end="${productVo.avg_reviews_stars}" step="1">
									<li><i class="lni lni-star-filled"></i></li>
								</c:forEach>
								<c:if test="${productVo.avg_reviews_stars%5 > 0}">
								   <li><i class="lni lni-star-half"></i></li>
								</c:if>
							   <c:forEach begin="1" end="${5-productVo.avg_reviews_stars}" step="1">
							      <li><i class="lni lni-star-empty"></i></li>
							   </c:forEach>	
								
							</ul>
                           <div class="price">
							  <span><fmt:formatNumber value="${productVo.p_disprice}" pattern="#,###"/>원</span>
								<c:if test="${productVo.p_discount != 0}">
									<span class="discount-price"><fmt:formatNumber value="${productVo.p_price}" pattern="#,###" />원</span>
							   </c:if>
							</div>
                            
                            <br>
                       </div>
                        
                    </div>
                </div>
                </c:forEach>              
       </div>
    
    
    
    <!-- 페이징 -->
<%-- <div>
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li class="pagination_button">
						<a href="${pageMaker.startPage - 1 }">Previous</a>
					</li>
				</c:if>
				
				<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
					<li class="pagination_button">
						<a href="${num }">${num }</a>
					</li>
				</c:forEach>
				
				<c:if test="${pageMaker.next }">
					<li class="pagination_button">
						<a href="${pageMaker.endPage + 1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
     --%>
    
	</div>
	</section>
	
	<script>
		$(document).ready(function() {
			var listForm = $("#listForm");
			
			$(".pagination_button a").on("click", function(e) {
				e.preventDefault();
				
				listForm.find("input[name='pageNum']").val($(this).attr("href"));
				listForm.submit();
			});
		});
	</script>
		<!-- 소현 -->
	
<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
		
</body>
</html>