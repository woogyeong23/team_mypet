<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
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
		
		
	
	
			

		
		//비밀번호 확인
		$(document).ready(function(){
			$('#m_pwd').blur(function(){
				$('#successPwChk2').text('');
				
			}); 
			
			$('#m_pwd2').blur(function(){ //keyup은 중복이 안되는 듯함;
				if($('#m_pwd').val()!= $('#m_pwd2').val()){
					result = "비밀번호가 일치하지 않습니다.";
			  		$(".successPwChk2").html(result).css("color","red");
			  		$("#m_pwd").val("").trigger("focus");
			  		$(".pwChk").val(false);

			 	}else{
					result = "비밀번호가 일치 합니다.";
				  	$('.successPwChk2').html(result).css("color","green");
			  		$(".pwChk").val(true);
			 	}return;
			});
		 }); 
		
	
		$(document).ready(function(){
			$('#m_pwd').blur(function(){ 
				let password = $("#m_pwd").val();
				let gd2 = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+~])[a-zA-Z\d!@#$%^&*()_+~]{8,}$/;

				if(password.match(gd2) != null ){
					result = "good";
			  		$(".successPwChk").text(result).css("color","blue");
			  		$(".pwChk").val(true);
			 	}else{
			 		result = "비밀번호는 8자 이상, 하나 이상의 문자,숫자,특수문자를 넣어주세요";
					$(".successPwChk").text(result).css("color","red");
			  		$(".pwChk").val(false);
			 	}
			});
		 }); 
		 


		$(document).ready(function(){
			$('#m_id').blur(function(){ 
				let emailval = $("#m_id").val();
				let gd = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

				$('.successEmChk').text('');

				if(emailval.match(gd) != null){
					result = "유효성 확인.";
			  		$(".successEmChk").text(result).css("color","green");
			  		$(".emChk2").val(true);
			 	}else{
					result = "유효성 미확인.";
					$(".successEmChk").text(result).css("color","red");
			  		$(".emChk2").val(false);
			 	}
			});
		 }); 
		
		
		if($(".emChk2") == true){
			$(".doubleChk").attr("disabled",false);
			
		}else{
			result = "이메일 주소를 입력해 주세요";
			$(".successEmChk").text(result).css("color", "red");
		}
		
		let code = '';
		$("#emailChk").click(function(){
			
			let member_id = $("#m_id").val();
			
			$.ajax({
				type:'POST',
				url:"${pageContext.request.contextPath}/checkemail.do",
				data : {"member_id":member_id},
				success: function(data){
					if(data == true){
						alert("삐-삐-");
						$("#m_email").attr("autofocus",true);
						result = "이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해 주세요";
						$(".successEmChk").text(result).css("color", "red");
					}else{
						alert("뿌-뿌-");
						result = "인증번호 발송이 완료되었습니다. \n 입력한 이메일에서 인증번호 확인을 해주세요"+member_email;
						$(".successEmChk").text(result).css("color", "green");
						$("#m_email2").attr("disabled",false);
						$("#emailChk2").css("display","inline-block");
						code = data;
					}
				}
			});
		});


		 $("#button").click(function(){
			if($(".idChk").val() == "true" || $(".pwChk").val() == "true"){
				alert($("#m_name").val() +"님 환영합니다. 선택해주셔서 감사합니다 :)");
			 }else{
				alert("회원가입을 완료할 수 없습니다. 다시 한번 확인해 주십시오");
				if($(".idChk").val() != "true"){
					$(".successIdChk").text("이름을 입력해주세요").css("color","red");
				}
				if($(".pwChk").val() != "true"){
					$(".successPwChk").text("비밀번호를 입력해주세요").css("color","red");
				}
				return ;	
			} 
			
		 });
	
		
		
		
		
	}); 
		 
	</script>
    
    <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
        <jsp:include page="../../include/login.jsp" />
    
<!-- ************************************************ -->
</head>

 <body class="text-center">
<main class="form-signin">
<form name="joinForm" action="${pageContext.request.contextPath}/joinProcess.do" method="post">
  	<a href="${pageContext.request.contextPath}/home.do">
    <img class="mb-4" src="resources/assets/images/logo/mypetLogo.png" alt="" width="300" height="200" >
    </a>
    <h1 class="h3 mb-3 fw-normal" style="text-align:center">회원가입</h1>
<div>
    <div class="form-floating">
      <input type="email" name="m_id" value="" maxlength="80" class="form-control" id="m_id">
      <label for="m_id">Email address</label>
      
      <span id="emailChk" class="doubleChk">인증번호 보내기</span><p/>
	  	<span class="point successEmChk"></span><p/>
	  	<input type="hidden" class="emChk2" /> <p/>
	  	<input type="text" name="member_email2" id="member_email2" value="" maxlength="20" placeholder="인증번호 입력" disabled/>
	  	<span id="emailChk2" class="doubleChk2" >확인</span> <p/>
	  	<input type="hidden" class="emChk" /> <p/>
	    <p class="tip">
			*아이디,비밀번호 분실 시 필요한 정보이므로, 정확하게 기입해 주세요 	    
	    </p>
    </div>
    <div class="form-floating">
      <input type="password"  name="m_pwd"  value="" maxlength="20" class="form-control" id="m_pwd">
      <label for="m_pwd">Password</label>
      <span class="point successPwChk"></span> <p/>
    </div>
    <div class="form-floating">
      <input type="password"  name="m_pwd2"  value="" maxlength="20" class="form-control" id="m_pwd2">
      <label for="m_pwd2">Password check</label>
      <span class="point successPwChk2"></span>
		<input type="hidden" class="pwChk"/><p/>
    </div>
    <div class="form-floating">
      <input type="text" name="m_name" value="" maxlength="80" class="form-control" id="m_name">
      <label for="m_name">name</label>
    </div>
    <div class="form-floating">
      <input type="text"  name="m_nick"  value="" maxlength="20" class="form-control" id="m_nick">
      	<label for="m_nick">m_nick</label>
       <span class="point successNickChk">닉네임은 2자 이상 8자로 해주시길 바랍니다.</span>
		<input type="hidden" class="nickChk" /> <p/>
    </div>
    <div class="form-floating">
      <input type="text" name="m_birth" value="" maxlength="6" class="form-control" id="m_birth">
      <label for="m_birth">birth</label>
    </div>
    <div class="form-group">                   
	<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="m_addr1" id="m_addr1" type="text" readonly="readonly" >
	    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
	</div>
	<div class="form-group">
	    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="m_addr2" id="m_addr2" type="text" readonly="readonly" />
	</div>
	<div class="form-group">
	    <input class="form-control" placeholder="상세주소" name="m_addr3" id="m_addr3" type="text"  />
	</div>
    <div class="form-floating">
      <input type="text"  name="m_phone"  value="" maxlength="20" class="form-control" id="m_phone">
      <label for="m_phone">phone</label>
    </div>
</div>
    <button class="w-100 btn btn-lg btn-primary" id="login_member"type="submit">회원가입</button>
  </form>
</main>         

</body></html>        