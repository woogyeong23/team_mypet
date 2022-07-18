<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!doctype html>
<html>
  <head>

    <!-- Bootstrap core CSS -->

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    
    <!-- Custom styles for this template -->
    <jsp:include page="../include/head.jsp" />  
  </head>
  <body>


<main>
<input type="hidden">
  <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">  
  ​<picture>
  <source srcset="/resources/assets/images/profile.jpg" type="image/svg+xml">
  <img src="/resources/assets/images/profile.jpg" class="img-fluid img-thumbnail" alt="프로필" >
</picture>
  <img src="/resources/assets/images/profile.jpg" class="img-thumbnail" alt="프로필" style="width:25px;height:25px;">
<img src="/resources/assets/images/profile.jpg" class="img-fluid" alt="프로필">
    <a href="${pageContext.request.contextPath}/memberInfo.do" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-5 fw-semibold">
			${m_id}님
			
	    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#info-collapse" aria-expanded="true">
          내 정보
        </button>
        <div class="collapse show" id="info-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">회원등급</a></li>
            <li><a href="#" class="link-dark rounded">적립금</a></li>
            <li><a href="#" class="link-dark rounded">회원정보관리</a></li>
            <li><a href="#" class="link-dark rounded">펫정보관리</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#oders-collapse" aria-expanded="false">
          주문정보
        </button>
        <div class="collapse" id="oders-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">배송정보</a></li>
            <li><a href="#" class="link-dark rounded">주문목록</a></li>
            <li><a href="#" class="link-dark rounded">장바구니</a></li>
            <li><a href="#" class="link-dark rounded">환물/교환 목록</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#like-collapse" aria-expanded="false">
          내 관심
        </button>
        <div class="collapse" id="like-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">찜 목록</a></li>
            <li><a href="#" class="link-dark rounded">팔로우 작가</a></li>
          </ul>
        </div>
      </li>
       <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#review-collapse" aria-expanded="false">
          나의 구매 리뷰
        </button>
        <div class="collapse" id="review-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">리뷰 쓰기</a></li>
            <li><a href="#" class="link-dark rounded">내가 쓴 리뷰</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#review-collapse" aria-expanded="false">
          입점 정보
        </button>
        <div class="collapse" id="review-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">입점 신청하기</a></li>
            <li><a href="#" class="link-dark rounded">입점 신청 목록</a></li>
          </ul>
        </div>
      </li>
      
      <li class="border-top my-3"></li>
      
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          나의 구매리뷰
        </button>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded"></a></li>
            <li><a href="#" class="link-dark rounded"></a></li>
            <li><a href="#" class="link-dark rounded">Settings</a></li>
            <li><a href="#" class="link-dark rounded">Sign out</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
  <div class="b-example-divider"></div>

</main>


      <script src="../../resources/assets/js/sidebars.js"></script>
  </body>
</html>
