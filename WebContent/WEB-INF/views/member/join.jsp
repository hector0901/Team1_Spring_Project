<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>    

<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.title_line {
    text-align: left;
    border-bottom: 1px dashed lightgray;
    width: 1000px;
    margin: 60px auto;
}

.col-md-6 {
    margin-left: -90px;
}

.col-md-2 control-label {
    margin-bottom: 10px;
}

.form-group {
    margin-left: 300px;
}


#btn {
    margin: 0px 0px 0px 450px;
}

#confirm {
    margin-right: 10px;
}

label {
    margin-top: 7px;
    width: 100px;
    margin-right: 70px;
}

aside {
    width: 44%;
    float: right;
}

body {
    margin: 0px auto;
    width: 60%;
}

button {
    font-size: 16px;
}

h1 {
    margin-left: 60px;
}

.btn1, .btn2 {
    width: 130px;
    height: 40px;
    /*border: 1px solid rgb(242,7,76);*/
    border: 1px solid black;
    border-radius: 5px;
    background-color: #fff;
    color: black;
    cursor: pointer;
}
</style>

<script>
function checkMemberIdExist(){
	
	var member_id = $("#member_id").val()
	
	if(member_id.length == 0){
		alert('아이디를 입력해주세요')
		return
	}
	
	$.ajax({
		url : '${root}user/checkMemberIdExist/' + member_id,
		type : 'get',
		dataType : 'text',
		success : function(result){
			if(result.trim() == 'true'){
				alert('사용할 수 있는 아이디입니다')
				$("#idExist").val('true')
			} else {
				alert('사용할 수 없는 아이디 입니다')
				$("#idExist").val('false')
			}
		}
	})
}  
  
function resetUserIdExist(){
	$("#idExist").val('false')
}  
</script>
</head>
<body>

    <!-- 회원가입 타이틀-->
    <div class="title_line">
        <h1>회원 가입</h1>
    </div>

    <!-- aside 주의사항-->
    <aside>
        * 표시는 필수 입력사항 입니다.
    </aside>

    <br><br><br><br>
    
    <form:form action="${root }member/join_pro" method='post' modelAttribute="joinMemberBean">
   		 <form:hidden path="idExist"/>
		   		 <div class="form-group">
		   		 		<form:label path="member_id" class="col-md-2 control-label">이름 *</form:label>
							<div class="col-md-6">
								<form:input path="member_id" class='form-control'/>
							</div>
							<div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%"  >
								<form:errors path="member_id" style='color:red' />
							</div>
		   		 </div>
		   		 
		   		 <br><br><br><br>
		   		
		   		 <div class="form-group">
		   		 		<form:label path="member_pw" class="col-md-2 control-label">비밀번호 *</form:label>
							<div class="col-md-6">
								<form:input path="member_pw" class='form-control'/>
							</div>
							<div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%"  >
								<form:errors path="member_pw" style='color:red' />
							</div>
		   		 </div>
		   		 
		   		 <br><br><br><br>
					
					<div class="form-group">
		   		 		<form:label path="member_pw2" class="col-md-2 control-label">비밀번호 확인*</form:label>
							<div class="col-md-6">
								<form:input path="member_pw2" class='form-control'/>
							</div>
							<div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%"  >
								<form:errors path="member_pw2" style='color:red' />
							</div>
		   		 </div>
		   		 
		   		 <div class="text-right">
								<form:button class='btn btn-primary'>회원가입</form:button>
							</div>
		   		 
		</form:form>
		
		
    <div class="form-group">
        <label class="col-md-2 control-label">아이디 *</label>
        <div class="col-md-6">
            <input type='text' class="form-control" id='join_id' value='' required="required"
                style='width: 100%;' placeholder="아이디를 입력하세요." autofocus="autofocus">
        </div>
    </div>

    <br><br>

    <div class="form-group">
        <label class="col-md-2 control-label">비밀번호 *</label>
        <div class="col-md-6">
            <input type='password' class="form-control" id='join_pw' value='' required="required"
                style='width: 100%;' placeholder="비밀번호를 입력하세요." autofocus="autofocus">
        </div>
    </div>

    <br><br>


    <div class="form-group">
        <label class="col-md-2 control-label">비밀번호 확인 *</label>
        <div class="col-md-6">
            <input type='password' class="form-control" id='join_pw_check' value='' required="required"
                style='width: 100%;' placeholder="비밀번호를 확인하세요." autofocus="autofocus">
        </div>
    </div>

    <br><br>

    <div class="form-group">
        <label class="col-md-2 control-label">이름 *</label>
        <div class="col-md-6">
            <input type='text' class="form-control" id='join_name' value='' required="required"
                   style='width: 100%;' placeholder="이름을 입력하세요." autofocus="autofocus">
        </div>
    </div>

    <br><br>

    <div class="form-group">
        <label class="col-md-2 control-label">닉네임 *</label>
        <div class="col-md-6">
            <input type='text' class="form-control" id='join_nickname' value='' required="required"
                   style='width: 100%;' placeholder="닉네임을 입력하세요." autofocus="autofocus">
        </div>
    </div>

    <br><br>

    <div class="form-group">
        <label class="col-md-2 control-label">주민등록번호 *</label>
        <div class="col-md-6">
            <input type='text' class="form-control" id='join_social_number' value='' required="required"
                   style='width: 100%;' placeholder="주민등록번호를 입력하세요." autofocus="autofocus">
        </div>
    </div>

    <br><br>

    <div class="form-group">
        <label class="col-md-2 control-label">연락처 *</label>
        <div class="col-md-6">
            <input type='text' class="form-control" id='join_tel' value='' required="required"
                   style='width: 100%;' placeholder="연락처를 입력하세요." autofocus="autofocus">
        </div>
    </div>

    <br><br>

    <div class="form-group">
        <label class="col-md-2 control-label">e-mail *</label>
        <div class="col-md-6">
            <input type='email' class="form-control" id='join_email' value='' required="required"
                style='width: 100%;' placeholder="e-mail을 입력하세요." autofocus="autofocus">
        </div>
    </div>

    <br><br>

    <div class="form-group">
        <label class="col-md-2 control-label">주소 *</label>
        <div class="col-md-6">
            <input type='text' class="form-control" id='join_address' value='' required="required"
                style='width: 100%;' placeholder="주소를 입력하세요." autofocus="autofocus">
        </div>
    </div>

    <br><br><br><br>

    <div id="btn">
        <button class="btn1" type="submit" id="confirm" onclick="join()">가입</button>
        <button class="btn2" type="button" id="cancel" onclick="location.href='C:/Users/ayngi/OneDrive/바탕 화면/프로잭트2/project/login.html'">취소</button>
    </div>

</body>

</html>