<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 작성 페이지</title>
<%-- <script src = "${path}/ckeditor/ckeditor.js"></script> --%>
<script src = "${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>

</head>
<body>
<h3 style="text-align:center">커뮤니티 글 작성</h3>
<form action="${pageContext.request.contextPath}/CBInsertProcess.do" method="post" enctype="multipart/form-data">
	<table border="1px" align="center">
			<tr>
				<td>제목</td>
				<td><textarea rows="1" cols="50" name="cm_subject"></textarea></td>
			</tr>
			<tr>
			    <td>대표사진 설정</td>
				<td><input type="file" name="uploadImg" multiple/></td>
			</tr>
			<tr>
			<td>내용</td>
			<td><textarea  rows="20" name="cm_content" id="description"></textarea>
			<script type="text/javascript">
			//이미지 업로드 안됨
			CKEDITOR.replace("description",{
			    filebrowserUploadUrl : "${pageContext.request.contextPath}/imageUpload.do"
			}); //이미지 업로드 기능을 추가하기위한 코드
			</script>
                <input type="hidden" name="midx" value="${midx}">
                <input type="hidden" name="cm_writer" value="111"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="메인페이지" onclick="document.location.href='${pageContext.request.contextPath}/home.do'"/>&nbsp;|&nbsp;
					<input type="submit" value="등록하기 "/>
				</td>
			</tr>
		</table>

</form>

</body>
</html>