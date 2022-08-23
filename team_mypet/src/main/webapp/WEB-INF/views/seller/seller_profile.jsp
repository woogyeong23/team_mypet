<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>프로필 관리</title>
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
	<!-- 파일 업로드 추가 시작-->
	<script>
	    var cnt = 1;
	    function fn_addFile(){
	 		
	
	        $("#d_file").append("<br>" + "<input multiple='multiple'  type='file' name='file' required='required'>");
	        cnt++;
	    }
	</script>
	<!-- 파일 업로드 추가 끝-->
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
						<h3 class="pb-1 border-bottom" style="margin-bottom:10px">프로필 관리</h3>
						<form name="frm" action="${pageContext.request.contextPath}/seller_profileModif.do" method="post"  enctype="multipart/form-data">
							<div class="row">
								<div class="col-12">
									<div style="position:relative; top:50%; left:5%">
								     <div style="position:relative; float:left; width:150px; height: 150px; border-radius: 70%; overflow: hidden;">
								   <img class="profile" src="${pageContext.request.contextPath}/resources/seller/${sellerStoryVo.seller_img}">
								     </div>
								   
								     <div class="" style="position:relative; float:left; margin-left:30px;">
								     <span style="font-size: 16px;font-weight: bold; color: #333333;">
								     ${sellerStoryVo.seller_intro}</span>
								     </div>
								     
								   </div>
									
								
								</div>
								<div class="col-12" style="position:relative;">
										<br><br><br><br><br><br>
								    	 <input type="submit" class="btn btn-light" value="수정하기">
								</div>
							</div>
							
							
							
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