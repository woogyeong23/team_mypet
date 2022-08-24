<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->

    <!-- Start Header Area -->
    <header class="header navbar-area">
        <!-- Start Topbar -->
   

       
        <div class="topbar">
            <div class="container">
                <div class="row align-items-center">
                 <div class="col-lg-4 col-md-4 col-12">
                        <div class="top-left">
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-12">
                        <div class="top-middle">
<!--                             <ul class="useful-links"> -->
<%--                                 <li><a href="${pageContext.request.contextPath}/home.do">지금 바로 가입하고 상품을 구입하면</a></li> --%>
<!--                             </ul> -->
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-12">
                        <div class="top-end">
                            <div class="user">
                                <i class="lni lni-user"></i>
                            
                            </div>
                            <c:choose>
                            <c:when test="${m_id != null}"><!-- 로그인이 이루어진 경우 -->
                            <ul class="user-login">
                            <li>
                            <p><span>${m_nick}</span>님 환영합니다!</p>
                            </li>
                            <li>
                               <a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
                            </li>
                            <li>
                               <a href="${pageContext.request.contextPath}/Error">고객센터</a>
                             
                            </li>
                            </ul>
                            </c:when>
                            
                            <c:otherwise>
                            <ul class="user-login">  <!--로그인 X 상태  -->
                                <li>
                                    <a href="${pageContext.request.contextPath}/login.do">로그인</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/join.do">회원가입</a>
                                </li>
                                 <li >
                                    <a href="${pageContext.request.contextPath}/Error">고객센터</a>
                                </li>
                            </ul>
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!--         End Topbar -->
        <!-- Start Header Middle -->
        <div class="header-middle">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-3 col-7">
                        <!-- Start Header Logo -->
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin.do">
                            <img src="resources/assets/images/logo/adminLogo.png"  style="width:100px; height:100px; margin-left:130px;" alt="Logo">
                        </a>
                        <!-- End Header Logo -->
                    </div>
                    <div class="col-lg-5 col-md-7 d-xs-none">
                        <!-- Start Main Menu Search -->
                        <div class="main-menu-search">
                            <!-- navbar search start -->
                            <form action="${pageContext.request.contextPath}/KeywordSearch" method="post">
                            <div class="navbar-search search-style-5">
<!--                                 <div class="search-select"> -->
<!--                                     <div class="select-position"> -->
<!--                                         <select id="select1"> -->
<!--                                             <option selected>All</option> -->
<!--                                             <option value="1">option 01</option> -->
<!--                                             <option value="2">option 02</option> -->
<!--                                             <option value="3">option 03</option> -->
<!--                                             <option value="4">option 04</option> -->
<!--                                             <option value="5">option 05</option> -->
<!--                                         </select> -->
<!--                                     </div> -->
<!--                                 </div> -->
                                <div class="search-input">
                                    <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력해주세요.">
                                </div>
                                <div class="search-btn">
                                   <button type="submit" class="search"><i class="lni lni-search-alt"></i></button>
<!--                                      <input type="submit" name="submit"> -->
                                </div>
                            </div>
                            </form>
                            <!-- navbar search Ends -->
                        </div>
                        <!-- End Main Menu Search -->
                    </div>
                    <div class="col-lg-4 col-md-2 col-5">
                        <div class="middle-right-area">
                         <div class="nav-hotline">
<!--                                 <i class="lni lni-phone"></i> -->
<!--                                 <h3>Hotline: -->
<!--                                     <span>(+100) 123 456 7890</span> -->
<!--                                 </h3> -->
                            </div>
                            
                            <div class="navbar-cart">
                            
                              <c:choose>
                             <c:when test="${midx != null}">
                             <div class="wishlist">
                                    <a href="${pageContext.request.contextPath}/memberInfo.do">
                                        <i class="lni lni-user"></i>
<!--                                 <span class="total-items">0</span> -->
                                    </a>
                                </div>
                                </c:when>
                                <c:otherwise>
                                
                                </c:otherwise>
                                </c:choose>
                            
                                <div class="wishlist">
                                    <a href="${pageContext.request.contextPath}/Error">
                                        <i class="lni lni-heart"></i>
<!--                                         <span class="total-items">0</span> -->
                                    </a>
                                </div>
                                
                                <!-- 판매자 전용 버튼 -->
                                <c:choose>
                                <c:when test="${m_grade == 1}">
                                 <div class="wishlist">
                                    <a href="${pageContext.request.contextPath}/seller_productList.do">
                                        <i class="lni lni-investment"></i>
<!--                                         <span class="total-items">0</span> -->
                                    </a>
                                </div>
                                </c:when>
                                <c:otherwise>
                                
                                </c:otherwise>
                                </c:choose>
                                <!-- /판매자 전용 버튼 -->
                                
                                <!-- 장바구니 login X시 인터셉터에 막힘 -->
                                  <div class="cart-items">
                                    <a href="${pageContext.request.contextPath}/membercart.do" class="main-btn">
                                        <i class="lni lni-cart"></i>
                                
                                    </a>
                                </div>

                          
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Header Middle -->
        <!-- Start Header Bottom -->
        <div id="naver">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12 col-md-6 col-12">
                    <div class="nav-inner">
                        <!-- Start Mega Category Menu -->
                        <div class="mega-category-menu">
                         관리자 페이지
                            
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- End Mega Category Menu -->
                        <!-- Start Navbar -->
                        <nav class="navbar navbar-expand-lg">
                            <button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                                <ul id="nav" class="navbar-nav ms-auto">
                                    <li class="nav-item">
                                    <a href="#" aria-label="Toggle navigation">구매자 관리</a> 
<%--                        <a href="${pageContext.request.contextPath}/home.do" class="active" aria-label="Toggle navigation">Home</a> --%>



                                 
                                    <ul class="sub-menu collapse" id="submenu-1-2">
              			                    <li class="nav-item"><a href="admin_memberList.do">구매자 리스트</a></li>
                                         	<li class="nav-item"><a href="admin_com.do">커뮤니티 글</a></li>
                                        
                                         <li class="nav-item"><a href="admin_launch.do">입점신청</a></li>
                                           
                                        </ul>
                                    </li>
                                     <li class="nav-item">
                                     <a href="#" aria-label="Toggle navigation">판매자 관리</a>
                                   
                                
                                    
                                    
                                     
                                    </li>
                                  <li class="nav-item">
                                        <a href="admin_panme.do" aria-label="Toggle navigation">판매량차트</a>
                                   
                                    </li>
                                    <li class="nav-item">
                                     
                                         <a href="admin_board.do" aria-label="Toggle navigation">공지사항 관리</a>
                                       
                           
                        
                                    </li>
                                    <li class="nav-item">
                                    
                                           <a href="admin_board2.do" aria-label="Toggle navigation">이벤트 관리</a>
                                     
                                    </li>
                                    <li class="nav-item">
                                        <a href="admin_mune.do" aria-label="Toggle navigation">1:1문의 사항 관리</a>
                                    </li>
                                    
                                  
                             
                            </div> <!-- navbar collapse -->
                        </nav>
                        <!-- End Navbar -->
                    </div>
                </div>
<!--                 <div class="col-lg-4 col-md-6 col-12"> -->
<!--                     Start Nav Social -->
<!--                     <div class="nav-social"> -->
<!--                         <h5 class="title">Follow Us:</h5> -->
<!--                         <ul> -->
<!--                             <li> -->
<!--                                 <a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <a href="javascript:void(0)"><i class="lni lni-instagram"></i></a> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <a href="javascript:void(0)"><i class="lni lni-skype"></i></a> -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                     End Nav Social -->
<!--                 </div> -->
            </div>
        </div>
        </div>
        <!-- End Header Bottom -->
    </header>
    <!-- End Header Area -->