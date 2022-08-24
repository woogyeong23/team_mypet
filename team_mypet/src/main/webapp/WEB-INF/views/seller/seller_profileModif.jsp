<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
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
	
	//파일 삭제
	 $(document).ready(function() {        $("a[name='file-delete']").on("click", function(e) {            e.preventDefault();            deleteFile($(this));        });    })
	function deleteFile(obj) {
		
		obj.parent().remove();
		document.getElementById("previewImage").src = "${pageContext.request.contextPath}/resources/seller/${sellerStoryVo.seller_img}";
		var str="<a href='#this' id='file-add'  onclick ='addFile()'>이미지 수정하기</a>";
		 $("#file-list").append(str);
	}
	//파일 삭제 끝
	//파일 추가
	 function addFile() {
				var str = "<div class='file-group'><span class='glyphicon glyphicon-camera' aria-hidden='true'></span><input style='display: block;' type='file' name='file' accept='.jpg, .png' id='inputImage' onchange='readImage(this);'  required > <a href='#this' name='file-delete'>이미지 수정 안함</a></div>";
		        $("#file-list").append(str);
		        $("a[name='file-delete']").on("click", function(e) {
			            e.preventDefault();
			            deleteFile($(this));
			        });
				$("#file-add").remove();
		    }
	//파일 추가 끝
	
	</script>
	<script>
																	/**
																	 * 단일파일 업로드
																	 */
																	function readImage(input) {
																	    if (input.files && input.files[0]) {
																	        const reader = new FileReader();
																	        
																	        reader.onload = (e) => {
																	            const previewImage = document.getElementById('previewImage');
																	            previewImage.src = e.target.result;
																	        }
																	        reader.readAsDataURL(input.files[0]);
																	    }
																	}
																	// 이벤트 리스너
																	document.getElementById('inputImage').addEventListener('change', (e) => {
																	    readImage(e.target);
																	})
	</script>
	<style>
		.filebox label {
		  display: inline-block;
		  padding: .5em .75em;
		  color: #fff;
		  font-size: inherit;
		  line-height: normal;
		  vertical-align: middle;
		  background-color: #5cb85c;
		  cursor: pointer;
		  border: 1px solid #4cae4c;
		  border-radius: .25em;
		  -webkit-transition: background-color 0.2s;
		  transition: background-color 0.2s;
		}
		
		.filebox label:hover {
		  background-color: #6ed36e;
		}
		
		.filebox label:active {
		  background-color: #367c36;
		}
		
		.filebox input[type="file"] {
		  position: absolute;
		  width: 1px;
		  height: 1px;
		  padding: 0;
		  margin: -1px;
		  overflow: hidden;
		  clip: rect(0, 0, 0, 0);
		  border: 0;
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
						<h3 class="pb-1 border-bottom" style="margin-bottom:10px">프로필 수정</h3>
						<form name="frm" action="${pageContext.request.contextPath}/seller_profileModifProcess.do" method="post"  enctype="multipart/form-data">
							
							
							<div class="row">
							
							
							
							
							
							
							
								<table class="table-style-head-left" style="margin-left:0;">
									<tbody>
										<tr>
											<th>프로필 사진</th>
											<td>
												
												<div style="position:relative; float:left; width:150px; height: 150px; border-radius: 70%; overflow: hidden;">
													<img id="previewImage" src="${pageContext.request.contextPath}/resources/seller/${sellerStoryVo.seller_img}">
												</div>
												<div id="file-list">
													<div class="file-group">
																	
											         	    		<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
											         	    		<input style="display: block;" type="file" name="file" accept='.jpg, .png' id="inputImage" onchange="readImage(this);" required >
											         	    		<a href='#this' name="file-delete">이미지 수정 안함</a>
											        				
											        </div>
											        				
												</div>
												
												
												
											</td>
										</tr>
										<tr>
											<th>소개말</th>
											<td><textarea style="  width: 100%;
								    height: 130px;
								    padding: 9px;
								    border: 1px solid #ddd;
								    font-size: 15px;
								    resize: none;
								    color: #000;" name="seller_intro" cols="30" rows="5" value="">${sellerStoryVo.seller_intro}</textarea></td>
										</tr>
									</tbody>
								</table>
									
							</div>
							
							<br><br>
							<input type="button"  class="btn btn-light" onclick="history.back(-1)" value="취소">
							<input type="submit" class="btn btn-light" value="수정완료">
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