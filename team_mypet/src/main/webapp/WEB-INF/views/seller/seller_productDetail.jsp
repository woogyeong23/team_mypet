<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
	<style>
	.layout-split[data-layout-split=orderlist]>*:first-child{
		margin-left:0;
			width:180px;
	
	}
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
		<section class="my-dashboard">
            <div class="title-style-bar">
                <h1 class="txt">내 정보</h1>
                <span class="subtxt"></span>
            </div>

            <ul class="dashboard-list">
                                <li>
                    <strong class="label">적립금</strong>
                    <a href="/w/me/point" class="value">0P</a>
                </li>
                <li>
                    <strong class="label">할인 쿠폰 수</strong>
                    <a href="/w/me/coupon" class="value">0</a>
                </li>
                <li>
                    <div class="title">
                        <strong class="label">작가 발송 완료</strong>
                        <div class="ui-dropdown right">
                            <button type="button" class="btn-dropdown" aria-label="?">
                                <i class="idus-icon-info"></i>
                            </button>
                            <div class="menu-dropdown">
                                <p class="para">최근 1개월 기준</p>
                            </div>
                        </div>
                    </div>
                    <a href="/w/me/order/payment" class="value">0</a>
                </li>
                <li>
                    <div class="title">
                        <strong class="label">취소/환불 완료</strong>
                        <div class="ui-dropdown right">
                            <button type="button" class="btn-dropdown" aria-label="?">
                                <i class="idus-icon-info"></i>
                            </button>
                            <div class="menu-dropdown">
                                <p class="para">최근 1개월 기준</p>
                            </div>
                        </div>
                    </div>
                    <a href="/w/me/order/cancel" class="value">0</a>
                </li>
            </ul>

                        <div data-vue="frequency-event-desktop"></div>
            
            <div class="title-style-sub">
                <h2 class="txt">최근 주문내역</h2>
                <a href="/w/me/order/payment" class="to-right link">더보기<i class="idus-icon-arrow-right"></i></a>
            </div>

            <div class="tab_group--3">
                <span class="tab_group__tab--borderless" data-state="active">작품</span>
                <a href="/oc/orders/payment" class="tab_group__tab">온라인 클래스</a>
                <a href="/c/order" class="tab_group__tab">오프라인 클래스</a>
            </div>

                            <p class="empty-msg">최근 1개월 이내에 주문한 작품이 없습니다.</p>
            
            <div class="btn-container">
                <a href="/w/me/order/payment" class="ui_btn--large"><strong>최근 주문내역 더보기</strong></a>
            </div>

            <div class="ui_grid board-split">
                <div class="ui_grid__cols--2">
                    <div class="ui_grid__item">
                        <div class="title-style-sub">
                            <h2 class="txt">안 읽은 메시지</h2>
                            <a href="/w/message" class="to-right link">더보기<i class="idus-icon-arrow-right"></i></a>
                        </div>
                                                    <ul class="msg-item-list">

                                                                    <li class="msg-item " data-endpoint="/w/message/2cb33e56-d68a-426e-af3a-82e4336c5ecc" data-uuid="2cb33e56-d68a-426e-af3a-82e4336c5ecc">
            <label class="ui_field" data-ui="leaveChat">
                <input class="bp" type="checkbox"
                data-uuid="2cb33e56-d68a-426e-af3a-82e4336c5ecc"
                data-endpoint="/w/message/leave"
                />
            </label>
            <a href="/w/message/2cb33e56-d68a-426e-af3a-82e4336c5ecc">
                <input name="paging_param" type="hidden" value="1658732013339">
                <div class="split">
                    <div class="img-bg" style="background-image: url('https://image.idus.com/image/files/e5cecc67a0c3487ea9684f06b092a24b_320.jpg');"></div>
                    <div class="area-txt">
                        <span>말짜사롱</span>
                        <p class="txt">7월 초대박 할인
곧 마감되옵니다 ,.! 서두르세용용
할인쿠폰 중복 발급 가능하오니 필요하신분들은 메세지주세요!
7월 마무리도 잘하시구 건강하세요~^_^!!!!! 
(이메세지는 작품을 하나라도 찜한 분께는 전송되는 단체메세지입니다 제가 임의로 제외가 불가합니다:) )</p>
                    </div>
                </div>
                <div class="split fixed">
                    <time class="timestamp">07월 25일</time>
                                            <em class="alert">1</em>
                                    </div>
            </a>
        </li>
                                                                            <li class="msg-item " data-endpoint="/w/message/b84cfaeb-03b0-43f5-8757-0387c05d03e9" data-uuid="b84cfaeb-03b0-43f5-8757-0387c05d03e9">
            <label class="ui_field" data-ui="leaveChat">
                <input class="bp" type="checkbox"
                data-uuid="b84cfaeb-03b0-43f5-8757-0387c05d03e9"
                data-endpoint="/w/message/leave"
                />
            </label>
            <a href="/w/message/b84cfaeb-03b0-43f5-8757-0387c05d03e9">
                <input name="paging_param" type="hidden" value="1656409896187">
                <div class="split">
                    <div class="img-bg" style="background-image: url('https://image.idus.com/image/files/4838f0c9d2ac4f4b8805df712717d264_320.jpg');"></div>
                    <div class="area-txt">
                        <span>아로마티코</span>
                        <p class="txt"></p>
                    </div>
                </div>
                <div class="split fixed">
                    <time class="timestamp">06월 28일</time>
                                            <em class="alert">1</em>
                                    </div>
            </a>
        </li>
                                                                            <li class="msg-item " data-endpoint="/w/message/31be12c4-c498-11e3-8b03-06fd000000c2" data-uuid="31be12c4-c498-11e3-8b03-06fd000000c2">
            <label class="ui_field" data-ui="leaveChat">
                <input class="bp" type="checkbox"
                data-uuid="31be12c4-c498-11e3-8b03-06fd000000c2"
                data-endpoint="/w/message/leave"
                />
            </label>
            <a href="/w/message/31be12c4-c498-11e3-8b03-06fd000000c2">
                <input name="paging_param" type="hidden" value="1599580869401">
                <div class="split">
                    <div class="img-bg" style="background-image: url('https://image.idus.com/image/files/1b943d7e4df14e029705d57b9c2e55ed_320.jpg');"></div>
                    <div class="area-txt">
                        <span>아이디어스</span>
                        <p class="txt">안녕하세요.
아이디어스에 오신것을 환영합니다!

제가 신규 가입 뇌물로 아이디어스 최고 회원등급인 금손 등급으로 올려드렸어요.
금손 등급은 구매 금액의 무려 2%가 적립되는 혜택을 누릴 수 있답니다.
딱! 한달간만 최고등급으로 유지되니 마음껏 누려 보세요.

앞으로 핸드메이드의 매력으로 풍덩~ 빠질 수 있게 좋은 작품들 많이 소개해 드릴게요!
감사합니다.</p>
                    </div>
                </div>
                <div class="split fixed">
                    <time class="timestamp">09월 09일</time>
                                            <em class="alert">2</em>
                                    </div>
            </a>
        </li>
                                                                </ul>
                                            </div>
                    <div class="ui_grid__item">
                        <div class="title-style-sub">
                            <h2 class="txt">알림</h2>
                            <a data-log-object="see_all" href="/w/notification" class="to-right link">더보기<i class="idus-icon-arrow-right"></i></a>
                        </div>
                                                    <p class="empty-msg">받은 알림이 없습니다.</p>
                                            </div>
                </div>
            </div>

            <div class="title-style-sub">
                <h2 class="txt">찜한 작품</h2>
                <a href="/w/me/favoriteproduct" class="to-right link">더보기<i class="idus-icon-arrow-right"></i></a>
            </div>
                        <div class="ui_grid">
                <ul class="ui_grid__cols--4">
                                            <li class="ui_grid__item">
                                    <div class="ui_card ">
                        <button
                type="button"
                class="ui_card__overlay btn-ico sp-icon icon-favorite"
                aria-label="찜하기"
                data-name="starred-toolbar"
                data-starred-type="product"
                data-init=""
                data-starred=""
                data-target-id="8f2deda2-e9cb-42fc-85cc-ef529b760f93"
            >
            </button>
            
            <div class="ui_card__imgcover">
                <a
                    href="/w/product/8f2deda2-e9cb-42fc-85cc-ef529b760f93"
                    target="_blank"
                    aria-label="리얼 전신 3d 도베르만 석고방향제"
                    class="ui_card__img lazy "
                    data-product-id="8f2deda2-e9cb-42fc-85cc-ef529b760f93"
                    style="background-image: url('https://image.idus.com/image/files/3dfb8d4bf34c4ae6b5aa816dd1179270_512.jpg')"
                ></a>
            </div>

            <div class="ui_card__info">
                                    <a
                        href="/malzzasalon"
                        class="ui_card__label"
                        target="_blank"
                    >말짜사롱</a>
                                <a
                    href="/w/product/8f2deda2-e9cb-42fc-85cc-ef529b760f93"
                    class="ui_card__title"
                    target="_blank"
                >리얼 전신 3d 도베르만 석고방향제</a>
                            </div>

                    </div>
                                </li>
                                            <li class="ui_grid__item">
                                    <div class="ui_card ">
                        <button
                type="button"
                class="ui_card__overlay btn-ico sp-icon icon-favorite"
                aria-label="찜하기"
                data-name="starred-toolbar"
                data-starred-type="product"
                data-init=""
                data-starred=""
                data-target-id="fe3281f5-49e4-40d5-9b3b-a341aca916e0"
            >
            </button>
            
            <div class="ui_card__imgcover">
                <a
                    href="/w/product/fe3281f5-49e4-40d5-9b3b-a341aca916e0"
                    target="_blank"
                    aria-label="🍀차량용액자 방향제🌸석고/커플/생일선물/기념일/디퓨저"
                    class="ui_card__img lazy "
                    data-product-id="fe3281f5-49e4-40d5-9b3b-a341aca916e0"
                    style="background-image: url('https://image.idus.com/image/files/e4e2ddf005ab48578701aea4ff68a693_512.jpg')"
                ></a>
            </div>

            <div class="ui_card__info">
                                    <a
                        href="/photowoops"
                        class="ui_card__label"
                        target="_blank"
                    >포토웁스</a>
                                <a
                    href="/w/product/fe3281f5-49e4-40d5-9b3b-a341aca916e0"
                    class="ui_card__title"
                    target="_blank"
                >🍀차량용액자 방향제🌸석고/커플/생일선물/기념일/디퓨저</a>
                            </div>

                    </div>
                                </li>
                                            <li class="ui_grid__item">
                                    <div class="ui_card ">
                        <button
                type="button"
                class="ui_card__overlay btn-ico sp-icon icon-favorite"
                aria-label="찜하기"
                data-name="starred-toolbar"
                data-starred-type="product"
                data-init=""
                data-starred=""
                data-target-id="4090e1d1-d4be-4cfe-a749-032e9185d4e8"
            >
            </button>
            
            <div class="ui_card__imgcover">
                <a
                    href="/w/product/4090e1d1-d4be-4cfe-a749-032e9185d4e8"
                    target="_blank"
                    aria-label="흰냥이 오드아이 (선물포장)"
                    class="ui_card__img lazy "
                    data-product-id="4090e1d1-d4be-4cfe-a749-032e9185d4e8"
                    style="background-image: url('https://image.idus.com/image/files/ed576a070a6f4f00833603225093e8e1_512.jpg')"
                ></a>
            </div>

            <div class="ui_card__info">
                                    <a
                        href="/hellocraft"
                        class="ui_card__label"
                        target="_blank"
                    >헬로크래프트</a>
                                <a
                    href="/w/product/4090e1d1-d4be-4cfe-a749-032e9185d4e8"
                    class="ui_card__title"
                    target="_blank"
                >흰냥이 오드아이 (선물포장)</a>
                            </div>

                    </div>
                                </li>
                                            <li class="ui_grid__item">
                                    <div class="ui_card ">
                        <button
                type="button"
                class="ui_card__overlay btn-ico sp-icon icon-favorite"
                aria-label="찜하기"
                data-name="starred-toolbar"
                data-starred-type="product"
                data-init=""
                data-starred=""
                data-target-id="c800fdc0-a937-4b93-874c-bb5f6ff27628"
            >
            </button>
            
            <div class="ui_card__imgcover">
                <a
                    href="/w/product/c800fdc0-a937-4b93-874c-bb5f6ff27628"
                    target="_blank"
                    aria-label="🐾심쿵 곰탱이 석고방향제,차량용,장식용"
                    class="ui_card__img lazy "
                    data-product-id="c800fdc0-a937-4b93-874c-bb5f6ff27628"
                    style="background-image: url('https://image.idus.com/image/files/c5a0418d0129431c96c9b50cfb9fb93d_512.jpg')"
                ></a>
            </div>

            <div class="ui_card__info">
                                    <a
                        href="/w/artist/57956392-03a7-4d06-8ed8-24b69b8adf97"
                        class="ui_card__label"
                        target="_blank"
                    >코코스멜</a>
                                <a
                    href="/w/product/c800fdc0-a937-4b93-874c-bb5f6ff27628"
                    class="ui_card__title"
                    target="_blank"
                >🐾심쿵 곰탱이 석고방향제,차량용,장식용</a>
                            </div>

                    </div>
                                </li>
                                    </ul>
            </div>
            
            <div class="title-style-sub">
                <h2 class="txt">팔로우하는 작가</h2>
                <a href="/w/me/followingartist" class="to-right link">더보기<i class="idus-icon-arrow-right"></i></a>
            </div>
                            <p class="empty-msg">팔로우하는 작가가 없습니다.</p>
            
            <div class="title-style-sub">
                <h2 class="txt">최근 본 작품</h2>
                <a href="/w/me/recentproduct" class="to-right link">더보기<i class="idus-icon-arrow-right"></i></a>
            </div>
                            <div class="ui_grid">
                    <ul class="ui_grid__cols--4">
                                                    <li class="ui_grid__item">
                                        <div class="ui_card ">
                        <button
                type="button"
                class="ui_card__overlay btn-ico sp-icon icon-favorite"
                aria-label="찜하기"
                data-name="starred-toolbar"
                data-starred-type="product"
                data-init=""
                data-starred=""
                data-target-id="8d161f86-ba43-417f-822e-593f154be397"
            >
            </button>
            
            <div class="ui_card__imgcover">
                <a
                    href="/w/product/8d161f86-ba43-417f-822e-593f154be397"
                    target="_blank"
                    aria-label="[마음이가] 인기떡 4종세트"
                    class="ui_card__img lazy "
                    data-product-id="8d161f86-ba43-417f-822e-593f154be397"
                    style="background-image: url('https://image.idus.com/image/files/e445bdf09e9e4d7882f3d34b6665f9bd_512.jpg')"
                ></a>
            </div>

            <div class="ui_card__info">
                                    <a
                        href="/maumiga"
                        class="ui_card__label"
                        target="_blank"
                    >착한마을 마음이가</a>
                                <a
                    href="/w/product/8d161f86-ba43-417f-822e-593f154be397"
                    class="ui_card__title"
                    target="_blank"
                >[마음이가] 인기떡 4종세트</a>
                            </div>

                    </div>
                                    </li>
                                                    <li class="ui_grid__item">
                                        <div class="ui_card ">
                        <button
                type="button"
                class="ui_card__overlay btn-ico sp-icon icon-favorite"
                aria-label="찜하기"
                data-name="starred-toolbar"
                data-starred-type="product"
                data-init=""
                data-starred=""
                data-target-id="31acecb2-5a36-49ef-bd64-89aa06a037f5"
            >
            </button>
            
            <div class="ui_card__imgcover">
                <a
                    href="/w/product/31acecb2-5a36-49ef-bd64-89aa06a037f5"
                    target="_blank"
                    aria-label="[마음이가] 쑥영양떡"
                    class="ui_card__img lazy "
                    data-product-id="31acecb2-5a36-49ef-bd64-89aa06a037f5"
                    style="background-image: url('https://image.idus.com/image/files/cda7d2a39e69426b8ab1c9a095d11b37_512.png')"
                ></a>
            </div>

            <div class="ui_card__info">
                                    <a
                        href="/maumiga"
                        class="ui_card__label"
                        target="_blank"
                    >착한마을 마음이가</a>
                                <a
                    href="/w/product/31acecb2-5a36-49ef-bd64-89aa06a037f5"
                    class="ui_card__title"
                    target="_blank"
                >[마음이가] 쑥영양떡</a>
                            </div>

                    </div>
                                    </li>
                                                    <li class="ui_grid__item">
                                        <div class="ui_card ">
                        <button
                type="button"
                class="ui_card__overlay btn-ico sp-icon icon-favorite"
                aria-label="찜하기"
                data-name="starred-toolbar"
                data-starred-type="product"
                data-init=""
                data-starred=""
                data-target-id="be1d5b7b-8eee-4d50-843e-22a9463ea211"
            >
            </button>
            
            <div class="ui_card__imgcover">
                <a
                    href="/w/product/be1d5b7b-8eee-4d50-843e-22a9463ea211"
                    target="_blank"
                    aria-label="달콤한 밀크닙스"
                    class="ui_card__img lazy "
                    data-product-id="be1d5b7b-8eee-4d50-843e-22a9463ea211"
                    style="background-image: url('https://image.idus.com/image/files/407c362296a14d658b60772c27db0f46_512.jpg')"
                ></a>
            </div>

            <div class="ui_card__info">
                                    <a
                        href="/cacaofamily"
                        class="ui_card__label"
                        target="_blank"
                    >콩장 (제주 카카오패밀리)</a>
                                <a
                    href="/w/product/be1d5b7b-8eee-4d50-843e-22a9463ea211"
                    class="ui_card__title"
                    target="_blank"
                >달콤한 밀크닙스</a>
                            </div>

                    </div>
                                    </li>
                                                    <li class="ui_grid__item">
                                        <div class="ui_card ">
                        <button
                type="button"
                class="ui_card__overlay btn-ico sp-icon icon-favorite"
                aria-label="찜하기"
                data-name="starred-toolbar"
                data-starred-type="product"
                data-init=""
                data-starred=""
                data-target-id="07169e26-4f53-4aa8-8dbe-96e78e4f2c5f"
            >
            </button>
            
            <div class="ui_card__imgcover">
                <a
                    href="/w/product/07169e26-4f53-4aa8-8dbe-96e78e4f2c5f"
                    target="_blank"
                    aria-label="재구매율1위❤️고농축&quot;에스프레소&quot;커피원액"
                    class="ui_card__img lazy "
                    data-product-id="07169e26-4f53-4aa8-8dbe-96e78e4f2c5f"
                    style="background-image: url('https://image.idus.com/image/files/8683d6a32343498b89079552d8e7cc2e_512.jpg')"
                ></a>
            </div>

            <div class="ui_card__info">
                                    <a
                        href="/sobling"
                        class="ui_card__label"
                        target="_blank"
                    >소블링커피</a>
                                <a
                    href="/w/product/07169e26-4f53-4aa8-8dbe-96e78e4f2c5f"
                    class="ui_card__title"
                    target="_blank"
                >재구매율1위❤️고농축&quot;에스프레소&quot;커피원액</a>
                            </div>

                    </div>
                                    </li>
                                            </ul>
                </div>
                    </section>
	 <table border="1">
	 	<tr>
	 		<td style="width:100px">상태</td><td>${productVo.p_status }</td>
	 	</tr>
	 	<tr>
	 		<td>분류1</td><td>${productVo.p_category_idx }</td>
	 	</tr>
	 	<tr>
	 		<td>상품명</td><td>${productVo.p_name }</td>
	 	</tr>
	 	<tr>
	 		<td>상품번호</td><td>${productVo.p_idx }</td>
	 	</tr>
	 	<c:forEach var="product_imgVo" items="${productVo.product_imgs}">
	
		 <tr>
	 		<td>상품 이미지들</td>
	 		<td><img src="${pageContext.request.contextPath}/resources/assets/images/product-details/${product_imgVo.p_sys_filename }"/></td>
	 	</tr>
	</c:forEach>
	 	
	 	<tr>
	 		<td>크기</td><td>${productVo.p_size }</td>
	 	</tr>
	 	<tr>
	 		<td>재고-주문제작</td><td>${productVo.p_stock }</td>
	 	</tr>
	 	<tr>
	 		<td>재고-제한수량</td><td>${productVo.p_limit_cnt }</td>
	 	</tr>
	 	<tr>
	 		<td>제품상세정보</td><td>${productVo.p_content }</td>
	 	</tr>
	 	<tr>
	 		<td>원가격</td><td>${productVo.p_price }</td>
	 	</tr>
	 	<tr>
	 		<td>할인률</td><td>${productVo.p_discount }</td>
	 	</tr>
	 	<tr>
	 		<td>할인 적용 가격</td><td>${productVo.p_disprice }</td>
	 	</tr>
	 	<tr>
	 		<td>적립금</td><td>${productVo.p_point }</td>
	 	</tr>
	 	<tr>
	 		<td>일반 배송비</td><td>${productVo.p_dvprice }</td>
	 	</tr>
	 	<tr>
	 		<td>추가배송비</td><td>${productVo.p_add_dvprice }</td>
	 	</tr>
	 	<tr>
	 		<td>무료배송</td><td>${productVo.p_free_dvprice }</td>
	 	</tr>
	 	<tr>
	 		<td>택배사</td><td>${productVo.p_dvcompany }</td>
	 	</tr>
	 	<tr>
	 		<td>성분표시</td><td>${productVo.p_ingerdient }</td>
	 	</tr>
	 	<tr>
	 		<td>배송/환불정보</td><td>${productVo.p_cancle_info }</td>
	 	</tr>
	 	<tr>
	 		<td>등록일</td><td>${productVo.p_wday }</td>
	 	</tr>
	 	<tr>
	 		<td>마지막 수정일</td><td>${productVo.p_modifyday }</td>
	 	</tr>
	 </table>
			
	
	
		
	
	</section>
	
	
	
	
	
	<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
	<!-- ************************************************ -->
	
</body>

</html>        