<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시글 등록</h2>
	<form action="write.do" method="post">
		<table>
			<tbody>
				<tr>
					<th align="right">
						제목 :
					</th>
					<td>
						<input type="text" name="title">
					</td>
				</tr>
				<tr>
					<th align="right">
						내용 : 
					</th>
					<td>
						<textarea rows="10" cols="50" name="content"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<button>저장</button>
	</form>
</body>
</html>