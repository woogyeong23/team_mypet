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
  
    <a href="${pageContext.request.contextPath}/memberInfo.do" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-5 fw-semibold">
			${midx}님
	    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#info-collapse" aria-expanded="true">
          내 정보
        </button>
        <div class="collapse show" id="info-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
            <li><a href="${pageContext.request.contextPath}/membergrade.do" class="link-dark rounded">회원등급</a></li>
            <li><a href="${pageContext.request.contextPath}/memberpoint.do" class="link-dark rounded">적립금</a></li>
            <li><a href="${pageContext.request.contextPath}/membermodi.do" class="link-dark rounded">회원정보관리</a></li>
            <li><a href="${pageContext.request.contextPath}/petmodi.do" class="link-dark rounded">펫정보입력</a></li>
            <li><a href="${pageContext.request.contextPath}/petList.do" class="link-dark rounded">펫정보수정</a></li>

          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#oders-collapse" aria-expanded="false">
          주문정보
        </button>
        <div class="collapse" id="oders-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
            <li><a href="${pageContext.request.contextPath}/memberorder.do" class="link-dark rounded">배송정보</a></li>
            <li><a href="${pageContext.request.contextPath}/memberorders.do" class="link-dark rounded">주문목록</a></li>
            <li><a href="${pageContext.request.contextPath}/membercart.do" class="link-dark rounded">장바구니</a></li>
            <li><a href="${pageContext.request.contextPath}/memberrefund.do" class="link-dark rounded">환물/교환 목록</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#like-collapse" aria-expanded="false">
          내 관심
        </button>
        <div class="collapse" id="like-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
            <li><a href="${pageContext.request.contextPath}/memberLike.do" class="link-dark rounded">찜 목록</a></li>
            <li><a href="${pageContext.request.contextPath}/memberFollow.do" class="link-dark rounded">팔로우 작가</a></li>
          </ul>
        </div>
      </li>
       <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#review-collapse" aria-expanded="false">
          나의 구매 리뷰
        </button>
        <div class="collapse" id="review-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
            <li><a href="${pageContext.request.contextPath}/memberreview.do" class="link-dark rounded">리뷰 쓰기</a></li>
            <li><a href="${pageContext.request.contextPath}/membermyreview.do" class="link-dark rounded">내가 쓴 리뷰</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#launch-collapse" aria-expanded="false">
          입점 정보
        </button>
        <div class="collapse" id="launch-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
            <li><a href="${pageContext.request.contextPath}/petmodi.do" class="link-dark rounded">입점 신청하기</a></li>
            <li><a href="${pageContext.request.contextPath}/petmodi.do" class="link-dark rounded">입점 신청 목록</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#commu-collapse" aria-expanded="false">
          커뮤니티
        </button>
        <div class="collapse" id="commu-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
            <li><a href="${pageContext.request.contextPath}/petmodi.do" class="link-dark rounded">커뮤니티 글 작성</a></li>
            <li><a href="${pageContext.request.contextPath}/petmodi.do" class="link-dark rounded">커뮤니티 글 목록</a></li>
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
    </ul>
  </div>


      <script src="../../resources/assets/js/sidebars.js"></script>
  </body>
</html>
