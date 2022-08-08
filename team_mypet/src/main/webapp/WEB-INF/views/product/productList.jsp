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
	
	<!-- 소현 -->
	<section class="trending-product section" style="margin-top: 12px;">
    <div class="container">
    <!-- 홈 > 강아지 링크  -->
    		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  				<ol class="breadcrumb" style="font-size: 15px">
  					 <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home.do">홈</a></li>
  					 <c:choose>
  					 <c:when test="${CodeName.categoryName eq null}">
   					 <li class="breadcrumb-item active" aria-current="page">전체</li>	 	 
  					 </c:when>
  					 <c:otherwise>
  					 <li class="breadcrumb-item active" aria-current="page">${CodeName.categoryLargeName}</li>
   					 <li class="breadcrumb-item active" aria-current="page">${CodeName.categoryName}</li>	 
  					 </c:otherwise>
  					 </c:choose>
   				</ol>
			</nav>
	<!-- 홈 > 강아지 링크 끝 -->
	
	<!-- 배송비/가격/크기 검색 -->
	<!-- 배송비/가격/크기 검색 끝 -->
	
	
	<div class="row">
                <c:forEach var="productVo" items="${productList}">
				<!-- Start Single Product -->
                <div class="col-lg-3">
                    <div class="single-product">
                    	<div class="product-image" style="position: relative;">
                    	<a href="productView.do?p_idx=${productVo.p_idx}">
                    			<img src="${pageContext.request.contextPath}/resources/product/${productVo.p_sys_filename}" width="300px" height="300px">
						</a>
						                          
						<div class="button">
                        <a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
                        </div> 
                        
                        <div style="position: absolute; left: 4px; top: 4px;"> </div> <!-- 찜하기버튼 -->
                        </div>
                        
                        <div class="product-info">
                            <span class="seller">${productVo.m_nick}</span>
                            <h4 class="p_name">${productVo.p_name}</h4>
                            <div class="price">
                                <span>${productVo.p_price}</span>
                            </div>
                            <ul class="review">
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star"></i></li>
                            </ul>
                        </div>
                    </div> 
                </div>
				</c:forEach>
    </div>
    
    
    <!-- 페이징 -->
<div>
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