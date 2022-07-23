<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
	<style>
	.my-info {
		margin-left : 0; 
		width:180px;
	}
	.profile-area{
		padding: 25px 0 28px;
    	width: 100%;
    	border: 1px solid #ffc107;
	}
	.outline {
		width: 90px;
	    height: 90px;
	    -webkit-border-radius: 50%;
	    -moz-border-radius: 50%;
	    border-radius: 50%;
	    background: #fff;
	    padding: 5px;
	    margin: 0 auto;
	}
	.link-style {
		bottom: -16px;
	    display: inline-block;
	    width: 100%;
	    text-align: center;
	    height: 16px;
	    line-height: 16px;
	    background: #000000b3;
	    font-size: 10px;
	    color: #fff;
	    padding: 0;
        border: 0;font: inherit;
    	vertical-align: baseline;
    	box-sizing: border-box;
	}
	.area-txt {
		padding: 22px 0 0;
	
	}
	.area-txt > a{
		display: block;
   		text-align: center;
   		margin-bottom: 10px;
    	font-size: 12px;
	}
	.area-txt > strong{
		display: block;
    	text-align: center;
	}
	.my-menu {
		margin: 0;
	    padding: 0;
	    border: 0;
	    font: inherit;
	    vertical-align: baseline;
	    color: inherit;
	    box-sizing: border-box;
	    .display: block
	}
	em {
		display: block;
	    background: #ffc107;
	    padding: 9px 16px;
	    color: #fff;
	    font-size: 13pxmargin: 0;
	    border: 0;
	    font: inherit;
	    vertical-align: baseline;
	}
	nav {
		background: #fbfafa;
    	padding-bottom: 11px;
	}
	nav > b{
		border: 0 none;
	    margin-top: 0;    
	    width: 100%;
	    padding: 11px 16px 3px 16px;
	    margin-top: 8px;
	    border-top: 1px solid #efe8e6;
	    color: #333;
	    font-weight: bold;
	    font-size: 13px;
	    display: inline-block;
	}
	nav > a {
		padding-left: 16px;
	    color: #666;
	    display: block;
	    margin-top: 8px;
	}
	
	
	</style>
<meta charset="UTF-8">
<title>판매상세내역</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- css************************************************ -->
	    <jsp:include page="../../include/head.jsp" />  
	<!-- ************************************************ -->
</head>

<body>
	<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->
	    
	<section class = "container">
		<aside class="my-info">
    		<div class="profile-area">
       			<div class="outline">
           			<label
                data-profile="image"
                class="img-bg profile-img"
                style="background-image: url(http://image.idus.com/image/files/b5b721bcb181484797e726ba90503777.jpg)"
            >
		                <input
		                    data-change-profile="image"
		                    type="file"
		                    name="image"
		                    id="profile-image"
		                    class="profile-image-input"
		                    accept=".png, .jpg, .jpeg"
		                    style = "display: none;"
		                >
	                	<span class="link-style" >수정</span>
	
		                <a
		                    href="/w/me/profile/image"
		                    data-modal-trigger="modal-link"
		                    data-modal-id="modal-profile"
		                    class="profile-modal-open"
		                    style="visibility: hidden"
		                >이미지 변경 모달</a>
            		</label>
        		</div>
		        <div class="area-txt" >
		            <a href="/w/me/membership" >
		                <span class="sp-icon grade-01-s"></span>
		                <span>아기손 &gt;</span>
		            </a>
		            <strong data-profile="name" >최우경</strong>
                </div>
    		</div>

    
        	<div class="my-menu">
	        	<em >MY MENU</em>
	        
	            <nav >
                    <b><span>판매</span></b>
                    	<a 
	                    href="${pageContext.request.contextPath}/seller_productList.do"
	                    class="s1">판매상품</a>
                    	<a
	                    href="${pageContext.request.contextPath}/seller_productRegist.do"
	                    class="s2">판매하기</a>
                    <b><span>주문배송</span></b>
                    	<a
	                    href="${pageContext.request.contextPath}/seller_ordersList.do"
	                    class="s3">주문내역</a>
                    	<a
	                    href="${pageContext.request.contextPath}/seller_refundRegist.do"
	                    class="s4">환불내역</a>
                    	<a
	                    href="${pageContext.request.contextPath}/seller_cancleRegist.do"
	                    class="s5">취소내역</a>
                    <b><span>판매자스토어 관리</span></b>
                    	<a
	                    href="${pageContext.request.contextPath}/seller_profile.do"
	                    class="s6">프로필 관리</a>
                    	<a
	                    href="${pageContext.request.contextPath}/seller_reviewList.do"
	                    class="s7">구매후기 보기</a>
                    <b><span>계좌관리</span></b>
                    	<a
	                    href="${pageContext.request.contextPath}/seller_account.do"
	                    class="s8">계좌 등록/수정</a>
                                
            	</nav>
    		</div>
		</aside>
	
	
	hello 
	</section>
	
	
	
	
	
	<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
	<!-- ************************************************ -->
	
</body>

</html>        