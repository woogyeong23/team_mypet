<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!doctype html>
<html>
  <head>

  </head>
  <body>


<input type="hidden">
  <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
  <div style="width:150px;height:150px;text-align:center;" >
  <img src="resources/assets/images/profile.jpg" class="img-thumbnail" alt="프로필">
</div>  
  
    <a href="${pageContext.request.contextPath}/seller_productList.do" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-5 fw-semibold">
			${m_nick}님
	    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#info-collapse" aria-expanded="true">
          판매
        </button>
        <div class="collapse show" id="info-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
            <li><a href="${pageContext.request.contextPath}/seller_productList.do"class="s1">판매상품</a></li>
            <li><a href="${pageContext.request.contextPath}/seller_productRegist.do"class="s2">판매하기</a></li>
            
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#oders-collapse" aria-expanded="false">
          주문배송
        </button>
        <div class="collapse" id="oders-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
            <li><a  href="${pageContext.request.contextPath}/seller_ordersList.do"
	                    class="s3">주문내역</a></li>
            <li><a href="${pageContext.request.contextPath}/Error.do"
	                    class="s4">환불내역</a></li>
            <li><a href="${pageContext.request.contextPath}/Error.do"class="s5">취소내역</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#like-collapse" aria-expanded="false">
          판매자스토어 관리
        </button>
        <div class="collapse" id="like-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
            <li><a
	                    href="${pageContext.request.contextPath}/seller_profile.do"
	                    class="s6">프로필 관리</a></li>
            <li><a
	                    href="${pageContext.request.contextPath}/Error.do"
	                    class="s7">구매후기 보기</a></li>
          </ul>
        </div>
      </li>
       <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#review-collapse" aria-expanded="false">
          계좌관리
        </button>
        <div class="collapse" id="review-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
            <li><a
	                    href="${pageContext.request.contextPath}/seller_account.do"
	                    class="s8">계좌 수정</a></li>
          </ul>
        </div>
      </li>
     
      <li class="border-top my-3"></li>
      
      
    </ul>
  </div>


      <script src="../../resources/assets/js/sidebars.js"></script>
  </body>
</html>
