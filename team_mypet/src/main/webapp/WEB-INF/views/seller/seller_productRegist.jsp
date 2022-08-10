<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>판매하기</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- css************************************************ -->
	    <jsp:include page="../../include/head.jsp" />  
	<!-- ************************************************ -->

	 <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/sidebar.css" rel="stylesheet">
    <!-- css************************************************ -->
    <jsp:include page="../../include/membermodi.jsp" />  
      <!-- 서머노트를 위해 추가해야할 부분 여기부터 -->
	  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
	  <!--  -->
	 	<script>
			$(document).ready(function() {
			
				var toolbar = [
					    // 글꼴 설정
					    ['fontname', ['fontname']],
					    // 글자 크기 설정
					    ['fontsize', ['fontsize']],
					    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
					    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
					    // 글자색
					    ['color', ['forecolor','color']],
					    // 표만들기
					    ['table', ['table']],
					    // 글머리 기호, 번호매기기, 문단정렬
					    ['para', ['ul', 'ol', 'paragraph']],
					    // 줄간격
					    ['height', ['height']],
					    // 그림첨부, 링크만들기, 동영상첨부
					    ['insert',['picture','link','video']],
					    // 코드보기, 확대해서보기, 도움말
					    ['view', ['codeview','fullscreen', 'help']]
					  ];
			
				var setting = {
			            height : 300,
			            minHeight : null,
			            maxHeight : null,
			            focus : true,
			            lang : 'ko-KR',
			            toolbar : toolbar,
			            //콜백 함수
			            callbacks : { 
			            	onImageUpload : function(files, editor, welEditable) {
			            // 파일 업로드(다중업로드를 위해 반복문 사용)
			            for (var i = files.length - 1; i >= 0; i--) {
			            uploadSummernoteImageFile(files[i],
			            this);
			            		}
			            	}
			            }
			         };
			        $('#summernote').summernote(setting);
			        });
			        
			        function uploadSummernoteImageFile(file, el) {
						data = new FormData();
						data.append("file", file);
						$.ajax({
							data : data,
							type : "POST",
							url : "uploadSummernoteImageFile",
							contentType : false,
							enctype : 'multipart/form-data',
							processData : false,
							success : function(data) {
								$(el).summernote('editor.insertImage', data.url);
							}
						});
					}
			</script>
	<!-- 서머노트를 위해 추가해야할 부분 여기까지 -->	    
	<script>
		
	
	
		//할인가격 계산
		/* 
		document.getElementById("calPrice").onclick = function() { alert('새로운 함수입니다.');};
		
		$("#calPriceb").click(function(){
		   $("#p_disprice").text("Javascript");
		   $("#p_disprice").val("Javascript");
		   $("#p_disprice").css('color', 'blue');		    $('#p_disprice').val('adf');
		});
		
		*/
		function calPrice2() {
			
			var p_price  = document.getElementById("p_price").value;
			var p_discount  = document.getElementById("p_discount").value;
		 	var result=p_price*(100-p_discount)/100;
		    //p_disprice.innerHTML = result;
		 	document.getElementById("p_disprice").value=result;

		    
		    
		} 
	//-----------
	//카테고리 고르기
	 function categoryChange(e) {
		    var dog = ["-------","개껌", "스낵", "뼈/육포", "스틱", "프리미엄", "통살"];
		    var cat = ["-------","츄르", "스낵", "캣잎", "통살", "프리미엄", "스틱"];
		    var target = document.getElementById("p_category_small");
		 
		    if(e.value == "1") var d = dog;
		    else if(e.value == "2") var d = cat;
		 
		    target.options.length = 0;
		 
		    for (x in d) {
		        var opt = document.createElement("option");
		        opt.value = d[x];
		        opt.innerHTML = d[x];
		        target.appendChild(opt);
		    }    
		}
	//--------------
	
	//상품명 중복 체크
		$(function(){
			
			$("#checkPName").click(function(){
				
				let p_name = $("#p_name").val();
				alert(p_name);
				$.ajax({
					type:'post',
					url:"${pageContext.request.contextPath}/checkPName.do",
					data: {"p_name":p_name},
					success: function(data){
						if(data == "N"){
							result = "사용 가능한 상품명입니다.";
							$("#result_checkPName").html(result).css("color", "green");
							$("#p_category_large").trigger("focus");
						}else{
							result = "이미 사용중인 상품명입니다.";
							$("#result_checkPName").html(result).css("color", "red");
							$("#p_name").val("").trigger("focus");
						}
					},
					error: function(error){alert(error);}
				});
			
			});
			
		});
	//-----------
	
	
	</script>
	<!-- 파일 업로드 추가 시작-->
	<script>
	    var cnt = 1;
	    function fn_addFile(){
	 		
	
	        $("#d_file").append("<br>" + "<input multiple='multiple'  type='file' name='file' required='required'>");
	        cnt++;
	    }
	</script>
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
	<!-- 파일 업로드 추가 끝-->
</head>

<body>


	<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->
	
	<div id="wrap">
	
	
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
						<h3 class="pb-1 border-bottom" style="margin-bottom:10px">판매상품 등록하기</h3>
						<form name="frm" action="${pageContext.request.contextPath}/registProcess.do" method="post"  enctype="multipart/form-data">
							
							<table class="table-style-head-left" style="margin-left:0;">
								<tbody>
									<tr>
								 		<th style="width:120px">상품명</th>
										<td>
								 			<input type="text" name="p_name" id="p_name" maxlength="40" value="" placeholder="입력하세요">
								 			<input type="button" id="checkPName" value="중복검사"/><br/>
											<div style="height:20px"><span id="result_checkPName" style="font-size:12px;"></span></div>
								 		</td>
								 	</tr>
								 	<tr>
								 		<th>분류</th>
								 		<td>
								 			<select class="form-select" name = "p_category_large" id="p_category_large" onchange="categoryChange(this)" style="margin-bottom:10px;">
												<option value="yet" >------</option>
												<option value="1" >강아지</option>
												<option value="2"  >고양이</option>
											</select>

								 			<select class="form-select" name = "p_category_small" id="p_category_small" >
												<option value="yet" >------</option>
											</select>
												
								 		</td>
								 	</tr>			
									<tr>
								 		<th>상품 이미지들</th>
								 		<td>
								 		<input multiple="multiple"  type="file" name="file" required="required">
								 				<input type="button" value="파일 추가" onClick="fn_addFile()"><br>
								          		<div id="d_file">
								            
								         	   </div>
								 		</td>
								 	</tr>						
								 	<tr>
								 		<th>크기</th>
								 		<td>
								 			<input type="radio" name="p_size" value="all" style="display:none;">
								 			<input type="radio" name="p_size" value="0"> 소형
								 			<input type="radio" name="p_size" value="1"> 중형
								 			<input type="radio" name="p_size" value="2"> 대형
								 		</td>
								 	</tr>
								 	<tr>
								 		<th>제품상세정보</th>
								 		<td>
								 			<textarea id="summernote" name="p_content"></textarea>
								 			<!-- <input type="text" name="p_content" maxlength="40" value="" placeholder="입력하세요"> -->
								 		</td>
								 	</tr>
								 	<tr>
								 		<th>재고-주문제작</th>
								 		<td><input type="text" name="p_stock" maxlength="40" value="" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>재고-제한수량</th><td><input type="text" name="p_limit_cnt" maxlength="40" value="" placeholder="입력하세요"></td>
								 	</tr>
								 	
								 	<tr>
								 		<th>원가격</th><td><input type="text" name="p_price" id="p_price" maxlength="40" value="" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>할인률</th><td><input type="text" name="p_discount" id="p_discount" maxlength="40" value="" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>할인 적용 가격</th>
								 		<td>
								 			<input type="text" name="p_disprice" id="p_disprice" maxlength="100" value="" placeholder="적용버튼을 누르세요">
								 			<input type="button" value="적용"  onClick="calPrice2()" />
								 		</td>
								 	</tr>
								 	<tr>
								 		<th>일반 배송비</th><td><input type="text" name="p_dvprice" maxlength="40" value="" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>추가배송비</th><td><input type="text" name="p_add_dvprice" maxlength="40" value="" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>무료배송</th><td><input type="text" name="p_free_dvprice" maxlength="40" value="" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>택배사</th><td><input type="text" name="p_dvcompany" maxlength="40" value="" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>성분표시</th><td><input type="text" name="p_ingerdient" maxlength="40" value="" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>배송/환불정보</th><td><input type="text" name="p_cancle_info" maxlength="40" value="" placeholder="입력하세요"></td>
								 	</tr>
								 	
								
								</tbody>
								
									
							</table>
							
							<input type="submit" value="등록">
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