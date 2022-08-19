<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>

 <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->

    <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/sidebar.css" rel="stylesheet">
    <!-- css************************************************ -->
    <jsp:include page="../../include/membermodi.jsp" />  
<!-- ************************************************ -->
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
   
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <!-- 주소 Api -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               console.log(data.zonecode);
               console.log(fullRoadAddr);
               
               
               $("[name=m_addr1]").val(data.zonecode);
               $("[name=m_addr2]").val(fullRoadAddr);
               
               /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
           }
        }).open();
    }

	</script>
	<!-- /주소 Api -->
<script>

	$(function(){
		//수정하기 버튼 클릭시 이벤트 처리
		$(".updatemember").click(function(){
			let midx = $(this).attr("name");
			//회원번호
			let id_input = "#member_grade"+member_idx;
			//회원등급 + 회원번호
			let member_grade = $(id_input).val();
			//회원등급 + 회원번호 = 회원등급
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/membermodiProc.do",
				data:{
					"member_idx":member_idx,
					,
				},
				success:function(data){
					if(data =="N"){
						alert("회원등급 수정 실패!");
					}else{
						alert("회원등급 수정 성공!");
						$(id_input).attr("disabled",true);
					}
				},
				error: function(error){alert("회원등급 수정 중 에러 발생!");}
				
			});
			
			
		}); //end of 수정하기 버튼 클릭 시 이벤트 처리
		//삭제하기 버튼 클릭시 이벤트 처리
		$("#adminDeleteInfo").click(function(){
			
			let member_idx_arr = new Array();
			
			//삭제 체크박스를 체크한 jQuery객체들로부터 member_idx 값을 배열에 저장
			$("input:checked").each(function(index,item){
				member_idx_arr[index] = $(item).val();	
			});
			
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/adminDeleteInfo.do",
				data:{"member_idx_arr": member_idx_arr
			},
				success:function(data){
					
					if(data =="N"){
						alert("회원등급 삭제 실패!");
					}else{
						$("tr:has(input:checked)").remove();
					}
				},
				error: function(error){alert("회원삭제 중 에러 발생!");}
				
			});
			
			
		});//end of 삭제하기 버튼 클릭 시 이벤트 처리

	});

</script>
   
</head>
<body>
  


    <!-- 헤더와 js************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->



<div id="wrap">
<main class="container">

	
		<!-- 사이더************************************************ -->
	    <jsp:include page="../../include/sidebar.jsp" />  
	    <!-- 사이더************************************************ -->
	    
	
	
	
	<section>
	<div class="title-style no-mt clf">
	<a href="#" class="txt fl">회원 정보 관리</a>
	</div>
	<form name="membermodiForm" action="${pageContext.request.contextPath}/membermodiProcess.do" method="post">
		<table class="table-style-head-left">
			<tbody>
				<tr>
					<th>
					프로필사진
					</th>
					<td>
					<div class="input-text size-m">
					<input type="file" name="m_file" value="${membersVo.m_profile}" class="profileUpload.do" required>
					</div>
					</td>
				</tr>
				<tr>
					<th>
					이름
					</th>
					<td>	
					<div class="input-text size-m">
					<input type="text" name="m_name" value="${membersVo.m_name}" required>
					</div>
					</td>
				</tr>
				<tr>
					<th>
					닉네임	
					</th>
					<td>
					<div class="input-text size-m">
					<input type="text" name="m_nick" value="${membersVo.m_nick}" required>
					</div>
					</td>
				</tr>
				<tr>
					<th>
					이메일
					</th>
					<td>
					<span id="m_id">${membersVo.m_id}</span>
					</td>
				</tr>
				<tr>
					<th>
					전화번호
					</th>
					<td>
					<div>	
						<span id="m_phone" data-phone="m_phone">${membersVo.m_phone}</span>
							<div class="button">
	                    		<a class="btn">변경하기</a>
                    		</div>
					</div>
					</td>
				</tr>
				<tr>
					<th>
					생년월일
					</th>
					<td>
					<div class="input-text size-s">
					<input type="text" name="m_birth" value="${membersVo.m_birth}" placeholder="1997-01-01" required>
					</div>
					</td>
				</tr>
				<tr>
					<th>
					주소
					</th>
					<td>
					<div class="input-text size-m">
						<div class="form-group">                   
						<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="m_addr1" id="m_addr1" type="text" value="${membersVo.m_addr1}" readonly="readonly" >
						    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
						</div>
						<div class="form-group">
						    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="m_addr2" id="m_addr2" type="text" value="${membersVo.m_addr2}" readonly="readonly" />
						</div>
						<div class="form-group">
						    <input class="form-control" placeholder="상세주소" name="m_addr3" id="m_addr3" value="${membersVo.m_addr3}" type="text"  />
						</div>
					</div>
					</td>
				</tr>
				<tr>
					<th>
					계좌번호
					</th>
					<td>
					<div class="input-text size-m">
					<input type="text" name="m_account" value="${membersVo.m_account}" required>
					</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="ta-r mt10"> 
		<a href="${pageContext.request.contextPath}/memberdel.do" class="btn btn-s btn-white">회원탈퇴</a>
		</div>
		<div class="form-submit ta-c" id="button">
		<input type="hidden" name="midx" value="${membersVo.midx}"> 
		    <button class="w-100 btn btn-lg btn-primary" id="memberupdate"type="submit" name="">회원 정보 수정하기</button>
		</div>
	</form>
	</section>
</main>
</div>




<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
     
  </body>
</html>