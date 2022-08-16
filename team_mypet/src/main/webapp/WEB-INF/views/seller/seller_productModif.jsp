<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>판매상품수정</title>
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
	 function addFile() {
		        var str = "<div class='form-group' id='file-list'><div class='file-group'><input type='file' name='file'><a href='#this' name='file-delete'>삭제</a></div></div>";
		        $("#file-list").append(str);
		        $("a[name='file-delete']").on("click", function(e) {
			            e.preventDefault();
			            deleteFile($(this));
			        });
		    }
	     function deleteFile(obj) {
		        obj.parent().remove();
		    }
	function deleteFile(obj) {        obj.parent().remove();    }
	</script>
	
	<script>
	//유효성검사
	function check(){

		var fm = document.frm;   
		  if (fm.p_name.value==""){
		  		alert("상품이름을 입력해주세요");
		  		fm.p_name.focus();
		  		return;
		  }else if (fm.p_category_large.value=="yet"){
		  		alert("큰 카테고리를 입력해주세요");
		  		fm.p_category_large.focus();
		  		return;
		  }else if (fm.p_category_small.value=="yet" || fm.p_category_small.value=="-------"){
		  		alert("작은 카테고리를 입력해주세요");
		  		fm.p_category_small.focus();
		  		return;
		  }else if (fm.p_size.value ==""){
		  		alert("사이즈를 입력해주세요");
		  		fm.p_size.focus();
		  		return;
		  }else if (fm.p_content.value ==""){
		  		alert("작품상세정보를 입력해주세요");
		  		fm.p_content.focus();
		  		return;
		  }else if (fm.p_stock.value==""){
		  		alert("재고를 입력해주세요");
		  		fm.p_stock.focus();
		  		return;
		  }else if (fm.p_limit_cnt.value==""){
		  		alert("한정수량란을 입력해주세요");
		  		fm.p_limit_cnt.focus();
		  		return;
		  }else if (fm.p_price.value==""){
		  		alert("원가격을 입력해주세요");
		  		fm.p_price.focus();
		  		return;
		  }else if (fm.p_discount.value==""){
		  		alert("할인률을 입력해주세요");
		  		fm.p_discount.focus();
		  		return;
		  }else if (fm.p_disprice.value=="" || fm.p_disprice.value != fm.p_price.value*(100-fm.p_discount.value)/100){
		  		alert("할인가격 적용버튼을 눌러주세요");
		  		fm.p_disprice.focus();
		  		return;
		  }else if (fm.p_dvprice.value==""){
		  		alert("배송비 입력해주세요");
		  		fm.p_dvprice.focus();
		  		return;
		  }else if (fm.p_add_dvprice.value==""){
		  		alert("추가배송비 입력해주세요");
		  		fm.p_add_dvprice.focus();
		  		return;
		  }else if (fm.p_free_dvprice.value==""){
		  		alert("무료배송비란을 입력해주세요");
		  		fm.p_free_dvprice.focus();
		  		return;
		  }else if (fm.p_dvcompany.value==""){
		  		alert("택배사 입력해주세요");
		  		fm.p_dvcompany.focus();
		  		return;
		  }else if (fm.p_ingerdient.value==""){
		  		alert("성분을 입력해주세요");
		  		fm.p_ingerdient.focus();
		  		return;
		  }else if (fm.p_cancle_info.value==""){
		  		alert("환불취소정보를 입력해주세요");
		  		fm.p_cancle_info.focus();
		  		return;
		  }
		  
		  		alert("전송합니다..");
		  		//fm.action = "./memberJoinOk.jsp";
		  		//가상경로 사용 ${pageContext.request.contextPath}/registProcess.do
		  		fm.enctype="multipart/form-data"
		  		fm.action = "<%=request.getContextPath()%>/seller_productList.do";
		  		fm.method = "post";
		  		fm.submit();  
		  
		    return;
	}
	
	//유효성검사 끝
	
	
	
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
		    var cat = ["-------","츄르", "스낵", "캣잎", "스틱", "프리미엄", "통살"];
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
	//파일 추가
	 function addFile() {
		        var str = "<div class='form-group' id='file-list'><div class='file-group'><input type='file' name='file' accept='.jpg, .png'><a href='#this' name='file-delete'>삭제</a></div></div>";
		        $("#file-list").append(str);
		        $("a[name='file-delete']").on("click", function(e) {
			            e.preventDefault();
			            deleteFile($(this));
			        });
		    }
	//파일 추가 끝
	
	//파일 삭제
		 $(document).ready(function() {        $("a[name='file-delete']").on("click", function(e) {            e.preventDefault();            deleteFile($(this));        });    })

	function deleteFile(obj) {
		      obj.parent().remove();
	}
	//파일 삭제 끝
	
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
						<h3 class="pb-1 border-bottom" style="margin-bottom:10px">판매상품 수정하기</h3>
						<form name="frm">
							
							<table class="table-style-head-left" style="margin-left:0;">
								<tbody>
									<tr>
								 		<th style="width:120px">상품명</th>
										<td>
								 			<input type="text" name="p_name" id="p_name" maxlength="40" value="${productVo.p_name }" placeholder="입력하세요">
								 			<input type="button" id="checkPName" value="중복검사"/><br/>
											<div style="height:20px"><span id="result_checkPName" style="font-size:12px;"></span><input type="hidden" id="result_p_name" value=""></div>
								 		</td>
								 	</tr>
								 	<tr>
								 		<th>분류</th>
								 		<td>
								 			<select class="form-select" name = "p_category_large" id="p_category_large" onchange="categoryChange(this)" style="margin-bottom:10px;">
												<option value="yet" >------</option>
												<option value="1" <c:if test="${productVo.p_category_idx /7 < 1}">selected</c:if> >강아지</option>
												<option value="2" <c:if test="${productVo.p_category_idx /7 >= 1}">selected</c:if> >고양이</option>
											</select>

								 			<select class="form-select" name = "p_category_small" id="p_category_small" ">
												
												<option value="1" <c:if test="${productVo.p_category_idx %6 == 1}">selected</c:if> ><c:if test="${productVo.p_category_idx  /7 < 1}">개껌</c:if><c:if test="${productVo.p_category_idx  /7 >= 1}">츄르</c:if></option>
												<option value="2" <c:if test="${productVo.p_category_idx %6 == 2}">selected</c:if> >스낵</option>
												<option value="3" <c:if test="${productVo.p_category_idx %6 == 3}">selected</c:if> ><c:if test="${productVo.p_category_idx  /7 < 1}">뼈/육포</c:if><c:if test="${productVo.p_category_idx  /7 >= 1}">캣잎</c:if></option>
												<option value="4" <c:if test="${productVo.p_category_idx %6 == 4}">selected</c:if> >스틱</option>
												<option value="5" <c:if test="${productVo.p_category_idx %6 == 5}">selected</c:if> >프리미엄</option>
												<option value="6" <c:if test="${productVo.p_category_idx %6 == 6}">selected</c:if> >통살</option>
												
											</select>
												
								 		</td>
								 	</tr>			
									<tr>
								 		<th>상품 이미지들</th>
								 		<td>
								 				<!-- <input multiple="multiple"  type="file" name="file" required="required">
								 				<input type="button" value="파일 추가" onClick="fn_addFile()"><br>
								          		<div id="d_file">
								            
								         	    </div> -->
								         	    <div class="form-group file-group" id="file-list">
								         	    	<div class="file-add">
								         	    		<a href="#this" onclick="addFile()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>파일추가</a>
								         	    	</div>
								         	    	<div class='form-group' id='file-list'><div class='file-group'><input type='file' name='file' accept='.jpg, .png'><a href='#this' name='file-delete'>삭제</a></div></div>
								         	    	<div class="form-group" id="file-list">
								         	    		<c:forEach var="Product_ImgVo" items="${productImgList}">
										         	    	<div class="file-group">
										         	    		<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
										         	    		${Product_ImgVo.p_sys_filename}
										         	    		<a href='#this' name="file-delete">삭제</a>
										         	    	</div>
								         	    		</c:forEach>
								         	    	</div>
								         	    	
								         	    </div>
								         	   
								         	   
								         	   
		
								         	    
									         
								 		</td>
								 	</tr>						
								 	<tr>
								 		<th>크기</th>
								 		<td>
								 			<input type="radio" name="p_size" value="all" style="display:none;">
								 			<input type="radio" name="p_size" value="0" <c:if test="${productVo.p_size  == 0}">checked</c:if>> 소형
								 			<input type="radio" name="p_size" value="1" <c:if test="${productVo.p_size  == 1}">checked</c:if>> 중형
								 			<input type="radio" name="p_size" value="2" <c:if test="${productVo.p_size  == 2}">checked</c:if>> 대형
								 		</td>
								 	</tr>
								 	<tr>
								 		<th>제품상세정보</th>
								 		<td>
								 			<textarea id="summernote" name="p_content" value="${productVo.p_content}">${productVo.p_content}</textarea>
								 			<!-- <input type="text" name="p_content" maxlength="40" value="" placeholder="입력하세요"> -->
								 		</td>
								 	</tr>
								 	<tr>
								 		<th>재고-주문제작</th>
								 		<td><input type="text" name="p_stock" maxlength="40" value="${productVo.p_stock}" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>재고-제한수량</th><td><input type="text" name="p_limit_cnt" maxlength="40" value="${productVo.p_limit_cnt}" placeholder="입력하세요"></td>
								 	</tr>
								 	
								 	<tr>
								 		<th>원가격</th><td><input type="text" name="p_price" id="p_price" maxlength="40" value="${productVo.p_price}" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>할인률</th><td><input type="text" name="p_discount" id="p_discount" maxlength="40" value="${productVo.p_discount}" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>할인 적용 가격</th>
								 		<td>
								 			<input type="text" name="p_disprice" id="p_disprice" maxlength="100" value="${productVo.p_disprice}" placeholder="적용버튼을 누르세요" >
								 			<input type="button" value="적용"  onClick="calPrice2()" />
								 		</td>
								 	</tr>
								 	<tr>
								 		<th>일반 배송비</th><td><input type="text" name="p_dvprice" maxlength="40" value="${productVo.p_dvprice}" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>추가배송비</th><td><input type="text" name="p_add_dvprice" maxlength="40" value="${productVo.p_add_dvprice}" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>무료배송</th><td><input type="text" name="p_free_dvprice" maxlength="40" value="${productVo.p_free_dvprice}" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>택배사</th><td><input type="text" name="p_dvcompany" maxlength="40" value="${productVo.p_dvcompany}" placeholder="입력하세요"></td>
								 	</tr>
								 	<tr>
								 		<th>성분표시</th><td><textarea  name="p_ingerdient" maxlength="40" value="" >${productVo.p_ingerdient}</textarea></td>
								 	</tr>
								 	<tr>
								 		<th>배송/환불정보</th><td><textarea  name="p_cancle_info" maxlength="40" value="" >${productVo.p_cancle_info}</textarea></td>
								 	</tr>
								 	
								
								</tbody>
								
									
							</table>
							<input type="button"  class="btn btn-light" onclick="history.back(-1)" value="취소">
							<input type="button" class="btn btn-light" value="등록" onclick="check();"> 
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
	
</body>
</html>        