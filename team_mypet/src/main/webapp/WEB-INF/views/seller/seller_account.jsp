<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>계좌등록 수정</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- css************************************************ -->
	    <jsp:include page="../../include/head.jsp" />  
	<!-- ************************************************ -->

	 <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/sidebar.css" rel="stylesheet">
    <!-- css************************************************ -->
    <jsp:include page="../../include/membermodi.jsp" />  
       
	<script>
	
	
	
	</script>
	
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
						<h3 class="pb-1 border-bottom" style="margin-bottom:10px">계좌관리</h3>
						<form name="frm" action="${pageContext.request.contextPath}/seller_accountModif.do" method="post">
							<table class="table-style-head-left">
								<tbody>
									
										<th>
										은행
										</th>
										<td>	
										<div class="input-text size-m">
										<input type="text" name="bank" value="${sellerStoryVo.seller_bank}" disabled>
										</div>
										</td>
									</tr>
									<tr>
										<th>
										계좌번호	
										</th>
										<td>
										<div class="input-text size-m">
										<input type="text" name="account" value="${sellerStoryVo.seller_account_number}" disabled>
										</div>
										</td>
									</tr>
									<tr>
										<td colspan=2>
											<button type="submit"class="btn btn-light" style="">수정하기</button>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
						
						
						
						
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
<script>
$('.summernote').summernote({
	  height: 150,
	  lang: "ko-KR"
	});
</script>	
</body>
</html>        