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
		
	
	</style>

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
						<h3 class="pb-1 border-bottom" style="margin-bottom:10px">주문 상세내역</h3>
						<section>
            <div class="title-style no-mt clf">
                <div class="txt fl">주문 상세보기</div>
            </div>

            <div>
                        <table class="table-style disable-ui type2 th-bd" data-active="">
            <colgroup>
                <col>
                <col style="width:120px">
                <col style="width:120px">
            </colgroup>
            <thead>
                                    <tr class="m-hide">
                        <th class="ta-c">작품</th>
                        <th class="ta-c">판매 작가</th>
                        <th class="ta-c"></th>
                    </tr>
                            </thead>
            <tbody>
                                    <tr>
            <td>
                <div class="list-item">
                    <div class="area-img">
                        <input class="bp" data-ui="list-checker" name="prd-name" type="checkbox" value="some-prd" checked="">
                        <div class="img-bg" style="background-image: url(https://image.idus.com/image/files/3dfb8d4bf34c4ae6b5aa816dd1179270_320.jpg)"></div>
                    </div>
                    <div class="area-txt">
                        <div class="list-head">
                                                        <div class="row">
                                <div class="col">
                                    <a href="/w/product/8f2deda2-e9cb-42fc-85cc-ef529b760f93" class="title-txt" for="prd-name"> [9월할인] 리얼 전신 3d 도베르만 석고방향제</a>
                                </div>
                                <div class="col icon">
                                    <span class="ico outline positive">작가 발송 완료</span>
                                </div>
                            </div>
                        </div>
                        <ul class="list-options">
                                                            <li>
                                    <span class="option-txt">
                                                                                색상 : 블랙탄                                             /                                                                                     향 : 가든파티                                             /                                                                                     받침석고 : 추가안함                                             /                                                                                     향추가 : 5ml(+ 2000 원)                                             /                                                                                     선물포장 : 포장상자(+ 1500 원)                                                                                                                        </span>
                                    <em class="option-count">1개</em>
                                </li>
                                                            <li>
                                    <span class="option-txt">
                                                                                색상 : 블랙                                             /                                                                                     향 : 미드섬머나잇                                             /                                                                                     받침석고 : 추가안함                                             /                                                                                     향추가 : 안함                                             /                                                                                     선물포장 : 포장상자(+ 1500 원)                                                                                                                        </span>
                                    <em class="option-count">1개</em>
                                </li>
                                                                                        <div class="order-memo">
                                    <div class="textarea">
                                        <div class="textarea-div">예쁘게 해주세영~~</div>
                                    </div>
                                </div>
                                                    </ul>
                    </div>
                </div>
            </td>
            <td class="td-controller wow-b row fixed">
                <div class="col">
                    <span class="txt">말짜사롱</span>
                </div>
                <div class="col">
                    <a href="/w/message/2cb33e56-d68a-426e-af3a-82e4336c5ecc" class="btn btn-s btn-white" type="button">메시지로 문의</a>
                </div>

            </td>
            <td class="td-controller row">
                                                                                        <div class="col">
                                <a class="btn btn-s btn-point" type="button" href="/w/me/order/review/0392cc9c-abcc-464b-b26b-c2796d05d274" data-modal-id="modal-review" data-modal-trigger="modal-link">구매후기 작성</a>
                            </div>

                            
                                                                                                            <div class="col">
                        <a href="https://m.search.daum.net/search?q=CJ%EB%8C%80%ED%95%9C%ED%86%B5%EC%9A%B4+633998494850" target="_blank" class="btn btn-s btn-white" data-tracking="">발송 정보 조회</a>
                    </div>
                                                    </td>

        </tr>
                                </tbody>
        </table>
                    </div>

                
            <div class="">
                <h2 class="title2-style mt30">배송 정보</h2>
                                <table class="table-style-head-left">
                    <tbody>
                        <tr>
                            <th>받는분</th>
                            <td>썸머킴</td>
                        </tr>
                        <tr>
                            <th>전화</th>
                            <td>010-6586-8819</td>
                        </tr>
                                                <tr>
                            <th>주소</th>
                            <td>54945
전라북도 전주시 완산구 새터로 95 (서신동, 동아한일아파트)
115-103</td>
                        </tr>
                    </tbody>
                </table>
            </div>

                            <div class="">
                    <h2 class="title2-style mt30">결제 정보</h2>
                    <div class="order-result root">
                        <div class="row">
                            <div class="col order-result artist-list">
                                                                    <div class="artist-item">
                                        <div class="artist-name">
                                            말짜사롱 작가님
                                        </div>
                                        <div class="value-list">
                                                                                            <div class="value-item">
                                                    <div class="value-name">
                                                        리얼 전신 3d 도베르만 석고방향제                                                    </div>
                                                    <div class="value-price">
                                                        21,000원                                                    </div>
                                                </div>
                                                                                        <div class="value-item">
                                                <div class="value-name">
                                                    배송비
                                                </div>
                                                <div class="value-price">
                                                    3,000원                                                </div>
                                            </div>
                                            <div class="value-item">
                                                <div class="value-name">
                                                    제주 / 도서산간 추가비용
                                                </div>
                                                <div class="value-price">
                                                    0원                                                </div>
                                            </div>
                                            <div class="value-item">
                                                <div class="value-name">
                                                    할인쿠폰
                                                </div>
                                                <div class="value-price">
                                                    0원                                                </div>
                                            </div>
                                            <div class="value-item">
                                                <div class="value-name">
                                                    배송비 할인쿠폰
                                                </div>
                                                <div class="value-price">
                                                    0원                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                                            </div>
                            <div class="col no-spacing bg">
                                <div class="row order-result result-list">
                                    <div class="result-item">
                                        <div class="result-name">
                                            작품금액
                                        </div>
                                        <div class="result-value">
                                            21,000원                                        </div>
                                    </div>
                                    <div class="order-result result-item">
                                        <div class="result-name">
                                            배송비
                                        </div>
                                        <div class="result-value">
                                            3,000원                                        </div>
                                    </div>
                                    <div class="order-result result-item">
                                        <div class="result-name">
                                            제주 / 도서산간 추가비용
                                        </div>
                                        <div class="result-value">
                                            0원                                        </div>
                                    </div>
                                    <div class="order-result result-item">
                                        <div class="result-name">
                                            작가쿠폰할인
                                        </div>
                                        <div class="result-value">
                                            0원                                        </div>
                                    </div>
                                    <div class="order-result result-item">
                                        <div class="result-name">
                                            아이디어스 VIP 클럽
                                        </div>
                                        <div class="result-value">
                                            0원                                        </div>
                                    </div>
                                    

                                    <div class="order-result result-item">
                                        <div class="result-name">
                                            아이디어스 쿠폰
                                        </div>
                                        <div class="result-value">
                                            -2,000원                                        </div>
                                    </div>
                                    <div class="order-result result-item">
                                        <div class="result-name">
                                            작가 후원하기
                                        </div>
                                        <div class="result-value">
                                            0원                                        </div>
                                    </div>
                                </div>
                                                                <div class="row point">
                                    <dl class="clf">
                                        <dt class="fl pb"><b>적립금 적립</b></dt>
                                        <dd class="fr pb"><b class="hilight blue">380P</b></dd>
                                        <dt class="fl">적립기준</dt>
                                        <dd class="fr">결제 완료시 적립 예정 상태로 바로 적립</dd>
                                        <dt class="fl">가용시점</dt>
                                        <dd class="fr">작품 발송일로부터 7일 후 적립금 사용 가능</dd>
                                        <dt class="fl">유효기간</dt>
                                        <dd class="fr">적립일로부터 6개월</dd>
                                    </dl>
                                </div>
                                                            </div>

                        </div>
                        <div class="row">
                            <div class="col order-result account">
                                <div class="account-name">결제방법</div>
                                <div class="account-value">
                                    <span class="account-bank">
                                        토스                                    </span>
                                </div>
                            </div>
                            <div class="col order-result order-total">
                                <span class="order-name">
                                    총 결제 금액
                                </span>
                                <span class="order-price">
                                        22,000원                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                                    </section>
						
						<input type="button" value="수정">
						
						
						
						
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