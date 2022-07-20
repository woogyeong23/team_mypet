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
                            <ul class="menu-top-link">
                                <li>
                                    <div class="select-position">
                                        <select id="select4">
                                            <option value="0" selected>￦ won</option>
                                            <option value="1">$ USD</option>
                                            <option value="2">€ EURO</option>
                                            <option value="3">$ CAD</option>
                                            <option value="4">₹ INR</option>
                                            <option value="5">¥ CNY</option>
                                            <option value="6">৳ BDT</option>
                                        </select>
                                    </div>
                                </li>
                                <li>
                                    <div class="select-position">
                                        <select id="select5">
                                            <option value="0" selected>한국어</option>
                                            <option value="1">English</option>
                                            <option value="2">Español</option>
                                            <option value="3">Filipino</option>
                                            <option value="4">Français</option>
                                            <option value="5">العربية</option>
                                            <option value="6">हिन्दी</option>
                                            <option value="7">বাংলা</option>
                                        </select>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-12">
                        <div class="top-middle">
                            <ul class="useful-links">
                                <li><a href="${pageContext.request.contextPath}/home.do">Home</a></li>
                                <li><a href="about-us.html">About Us</a></li>
                                <li><a href="contact.html">Contact Us</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-12">
                        <div class="top-end">
                            <div class="user">
                                <i class="lni lni-user"></i>
                                Hello <!-- 사용자 이름 or 닉네임 추가하면 될듯 -->
                            </div>
                            <c:choose>
                            <c:when test="${m_id != null}"><!-- 로그인이 이루어진 경우 -->
                            <ul class="user-login">
                            <li>
                               <a href="${pageContext.request.contextPath}/memberInfo.do">내정보</a> 
                            </li>
                            <li>
                               <a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
                            </li>
                            </ul>
                            </c:when>
                            
                            <c:otherwise>
                            <ul class="user-login"><!-- 로그인 X 상태 -->
                                <li>
                                    <a href="${pageContext.request.contextPath}/login.do">로그인</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/join.do">회원가입</a>
                                </li>
                            </ul>
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Topbar -->
        <!-- Start Header Middle -->
        <div class="header-middle">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-3 col-7">
                        <!-- Start Header Logo -->
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do">
                            <img src="resources/assets/images/logo/logo.svg" alt="Logo">
                        </a>
                        <!-- End Header Logo -->
                    </div>
                    <div class="col-lg-5 col-md-7 d-xs-none">
                        <!-- Start Main Menu Search -->
                        <div class="main-menu-search">
                            <!-- navbar search start -->
                            <div class="navbar-search search-style-5">
                                <div class="search-select">
                                    <div class="select-position">
                                        <select id="select1">
                                            <option selected>All</option>
                                            <option value="1">option 01</option>
                                            <option value="2">option 02</option>
                                            <option value="3">option 03</option>
                                            <option value="4">option 04</option>
                                            <option value="5">option 05</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="search-input">
                                    <input type="text" placeholder="Search">
                                </div>
                                <div class="search-btn">
                                    <button><i class="lni lni-search-alt"></i></button>
                                </div>
                            </div>
                            <!-- navbar search Ends -->
                        </div>
                        <!-- End Main Menu Search -->
                    </div>
                    <div class="col-lg-4 col-md-2 col-5">
                        <div class="middle-right-area">
                            <div class="navbar-cart">
                                <div class="wishlist">
                                    <a href="javascript:void(0)">
                                        <i class="lni lni-heart"></i>
                                        <span class="total-items">0</span>
                                    </a>
                                </div>
                                <div class="cart-items">
                                    <a href="javascript:void(0)" class="main-btn">
                                        <i class="lni lni-cart"></i>
                                        <span class="total-items">2</span>
                                    </a>
                                    <!-- Shopping Item -->
                                    <div class="shopping-item">
                                        <div class="dropdown-cart-header">
                                            <span>2 Items</span>
                                            <a href="cart.html">View Cart</a>
                                        </div>
                                        <ul class="shopping-list">
                                            <li>
                                                <a href="javascript:void(0)" class="remove" title="Remove this item"><i
                                                        class="lni lni-close"></i></a>
                                                <div class="cart-img-head">
                                                    <a class="cart-img" href="product-details.html"><img
                                                            src="resources/assets/images/header/cart-items/item1.jpg" alt="#"></a>
                                                </div>

                                                <div class="content">
                                                    <h4><a href="product-details.html">
                                                            Apple Watch Series 6</a></h4>
                                                    <p class="quantity">1x - <span class="amount">$99.00</span></p>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0)" class="remove" title="Remove this item"><i
                                                        class="lni lni-close"></i></a>
                                                <div class="cart-img-head">
                                                    <a class="cart-img" href="product-details.html"><img
                                                            src="resources/assets/images/header/cart-items/item2.jpg" alt="#"></a>
                                                </div>
                                                <div class="content">
                                                    <h4><a href="product-details.html">Wi-Fi Smart Camera</a></h4>
                                                    <p class="quantity">1x - <span class="amount">$35.00</span></p>
                                                </div>
                                            </li>
                                        </ul>
                                        <div class="bottom">
                                            <div class="total">
                                                <span>Total</span>
                                                <span class="total-amount">$134.00</span>
                                            </div>
                                            <div class="button">
                                                <a href="checkout.html" class="btn animate">Checkout</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ End Shopping Item -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Header Middle -->
        <!-- Start Header Bottom -->
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 col-md-6 col-12">
                    <div class="nav-inner">
                        <!-- Start Mega Category Menu -->
                        <div class="mega-category-menu">
                            <span class="cat-button"><i class="lni lni-menu"></i>전체 카테고리</span>
                            <ul class="sub-category">
                                <li><a href="product-grids.html">더보기 <i class="lni lni-chevron-right"></i></a>
                                    <ul class="inner-sub-category">
                                        <li><a href="product-grids.html">강아지</a></li>
                                        <li><a href="product-grids.html">ㅇㅇㅇㅇ</a></li>
                                        <li><a href="product-grids.html">고양이</a></li>
                                        <li><a href="product-grids.html">ㅂㅂㅂㅂ</a></li>
                                        <li><a href="product-grids.html">이벤트</a></li>
                                        <li><a href="product-grids.html">컴퓨터</a></li>
                                        <li><a href="product-grids.html">핸드폰</a></li>
                                        <li><a href="product-grids.html">웨이브</a></li>
                                        <li><a href="product-grids.html">책상</a></li>
                                        <li><a href="product-grids.html">마우스</a></li>
                                    </ul>
                                </li>
                                <li><a href="product-grids.html">키보드</a></li>
                                <li><a href="product-grids.html">모르겠다</a></li>
                                <li><a href="product-grids.html">7월8일</a></li>
                                <li><a href="product-grids.html">모니터</a></li>
                                <li><a href="product-grids.html">줄</a></li>
                                <li><a href="product-grids.html">시계</a></li>
                                <li><a href="product-grids.html">제품</a></li>
                                <li><a href="product-grids.html">알람</a></li>
                                <li><a href="product-grids.html">슬슬 </a></li>
                                <li><a href="product-grids.html">마무리 </a></li>
                                <li><a href="product-grids.html">끝 </a></li>
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
                                        <a href="${pageContext.request.contextPath}/home.do" class="active" aria-label="Toggle navigation">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse"
                                            data-bs-target="#submenu-1-2" aria-controls="navbarSupportedContent"
                                            aria-expanded="false" aria-label="Toggle navigation">강아지</a>
                                        <ul class="sub-menu collapse" id="submenu-1-2">
                                            <li class="nav-item"><a href="about-us.html">New</a></li>
                                            <li class="nav-item"><a href="faq.html">Best</a></li>
                                            <li class="nav-item"><a href="login.html">최신순</a></li>
                                            <li class="nav-item"><a href="register.html">좋은거</a></li>
                                            <li class="nav-item"><a href="mail-success.html">빠른 구매</a></li>
                                            <li class="nav-item"><a href="404.html">ㄱㅇㅈ</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse"
                                            data-bs-target="#submenu-1-3" aria-controls="navbarSupportedContent"
                                            aria-expanded="false" aria-label="Toggle navigation">고양이</a>
                                        <ul class="sub-menu collapse" id="submenu-1-3">
                                            <li class="nav-item"><a href="product-grids.html">New </a></li>
                                            <li class="nav-item"><a href="product-list.html">Best</a></li>
                                            <li class="nav-item"><a href="product-details.html">ㅇㅇㅇ</a></li>
                                            <li class="nav-item"><a href="cart.html">3시 01분</a></li>
                                            <li class="nav-item"><a href="checkout.html">ㄱㅇㅇ</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse"
                                            data-bs-target="#submenu-1-4" aria-controls="navbarSupportedContent"
                                            aria-expanded="false" aria-label="Toggle navigation">EVENT</a>
                                        <ul class="sub-menu collapse" id="submenu-1-4">
                                            <li class="nav-item"><a href="blog-grid-sidebar.html">진행중인 이벤트</a>
                                            </li>
                                            <li class="nav-item"><a href="blog-single.html">종료임박 이벤트</a></li>
                                            <li class="nav-item"><a href="blog-single-sidebar.html">이벤트 종료</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/CBList.do" aria-label="Toggle navigation">커뮤니티</a>
                                    </li>
                                     <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/BSellerList.do" aria-label="Toggle navigation">인기 작가</a>
                                    </li>
                                </ul>
                            </div> <!-- navbar collapse -->
                        </nav>
                        <!-- End Navbar -->
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Start Nav Social -->
                    <div class="nav-social">
                        <h5 class="title">Follow Us:</h5>
                        <ul>
                            <li>
                                <a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a>
                            </li>
                            <li>
                                <a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a>
                            </li>
                            <li>
                                <a href="javascript:void(0)"><i class="lni lni-instagram"></i></a>
                            </li>
                            <li>
                                <a href="javascript:void(0)"><i class="lni lni-skype"></i></a>
                            </li>
                        </ul>
                    </div>
                    <!-- End Nav Social -->
                </div>
            </div>
        </div>
        <!-- End Header Bottom -->
    </header>
    <!-- End Header Area -->