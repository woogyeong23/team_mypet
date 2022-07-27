<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

</style>
<script>
	$(function(){
		
		
	
	
		$(function(){
			
			$("#member_id").blur(function(){
				
				let member_id = $("#member_id").val();
				
				if(member_id == "" || member_id.length < 2){
					$(".successIdChk").text("이름은 2자 이상 12자 이하로 설정해주세요 :)");
						$(".successIdChk").css("color","red");
						$(".IdChk").val(false);
						return;

				}else{
				
				$.ajax({
					type:'post',
					url:"${pageContext.request.contextPath}/checkId.do",
					data: {"member_id":member_id},
					success: function(data){
						if(data == "N"){
							result = "사용 가능한 아이디입니다.";
							$(".successIdChk").text(result).css("color", "green");
							$(".idChk").val(true);
							$("#member_phone").trigger("focus");
						}else{
							result = "이미 사용중인 아이디입니다.";
							$(".successIdChk").html(result).css("color", "red");
							$(".idChk").val(false);
							$("#member_id").val("").trigger("focus");
						}
					},
					error: function(error){alert(error);}
				});
				}
			});
			
		});
		
		//비밀번호 확인
		$(document).ready(function(){
			$('#member_pw').blur(function(){
				$('#successPwChk2').text('');
				
			}); 
			
			$('#member_pw2').blur(function(){ //keyup은 중복이 안되는 듯함;
				if($('#member_pw').val()!= $('#member_pw2').val()){
					result = "비밀번호가 일치하지 않습니다.";
			  		$(".successPwChk2").html(result).css("color","red");
			  		$("#member_pw").val("").trigger("focus");
			  		$(".pwChk").val(false);

			 	}else{
					result = "비밀번호가 일치 합니다.";
				  	$('.successPwChk2').html(result).css("color","green");
			  		$("#member_id").val("").trigger("focus");
			  		$(".pwChk").val(true);
			 	}return;
			});
		 }); 
		
	
		$(document).ready(function(){
			$('#member_pw').blur(function(){ 
				let password = $("#member_pw").val();
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
			$('#member_email').blur(function(){ 
				let emailval = $("#member_email").val();
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
			
			let member_email = $("#member_email").val();
			
			$.ajax({
				type:'POST',
				url:"${pageContext.request.contextPath}/checkemail.do",
				data : {"member_email":member_email},
				success: function(data){
					if(data == true){
						alert("삐-삐-");
						$("#member_email").attr("autofocus",true);
						result = "이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해 주세요";
						$(".successEmChk").text(result).css("color", "red");
					}else{
						alert("뿌-뿌-");
						result = "인증번호 발송이 완료되었습니다. \n 입력한 이메일에서 인증번호 확인을 해주세요"+member_email;
						$(".successEmChk").text(result).css("color", "green");
						$("#member_email2").attr("disabled",false);
						$("#emailChk2").css("display","inline-block");
						code = data;
					}
				}
			});
		});


		 $("#button").click(function(){
			if($(".idChk").val() == "true" || $(".pwChk").val() == "true"){
				alert($("#member_name").val() +"님 환영합니다. 선택해주셔서 감사합니다 :)");
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
    <img class="mb-4" src="resources/assets/images/DC.png" alt="" width="300" height="200" >
    </a>
    <h1 class="h3 mb-3 fw-normal" style="text-align:center">회원가입</h1>
<div>
    <div class="form-floating">
      <input type="email" name="m_id" value="" maxlength="80" class="form-control" id="floatingInput">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password"  name="m_pwd"  value="" maxlength="20" class="form-control" id="floatingPwd">
      <label for="floatingPassword">Password</label>
    </div>
    <div class="form-floating">
      <input type="password"  name="m_pwd2"  value="" maxlength="20" class="form-control" id="floatingPwd2">
      <label for="floatingPassword2">Password check</label>
    </div>
    <div class="form-floating">
      <input type="text" name="m_name" value="" maxlength="80" class="form-control" id="floatingName">
      <label for="floatingName">name</label>
    </div>
    <div class="form-floating">
      <input type="text"  name="m_nick"  value="" maxlength="20" class="form-control" id="floatingNick">
      <label for="floatingNick">nickname</label>
    </div>
    <div class="form-floating">
      <input type="text" name="m_birth" value="" maxlength="6" class="form-control" id="floatingBirth">
      <label for="floatingInput">birth</label>
    </div>
    <div class="form-floating">
      <input type="text"  name="m_addr"  value="" maxlength="20" class="form-control" id="floatingArrd">
      <label for="floatingtext">addr</label>
    </div>
    <div class="form-floating">
      <input type="text"  name="m_phone"  value="" maxlength="20" class="form-control" id="floatingPhone">
      <label for="floatingtext">phone</label>
    </div>
</div>
    <button class="w-100 btn btn-lg btn-primary" id="login_member"type="submit">회원가입</button>
  </form>
</main>         

</body></html>        