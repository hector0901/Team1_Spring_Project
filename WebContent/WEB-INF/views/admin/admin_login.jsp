<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 로그인</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!-- 폰트 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+P+One&display=swap" rel="stylesheet">
<style type="text/css">
/* 폰트 링크 */
@import url('https://fonts.googleapis.com/css2?family=Mochiy+Pop+P+One&display=swap');
	.admin_login_logo{
	  font-family: 'Mochiy Pop P One', sans-serif;
	  margin-left:35%;
	  margin-top: 36px;
	  position: absolute;
	  z-index : 1;
	}
	.container{
	  margin-top:70px;
	}
	.login_btn{
      padding: 1% 3%;
      background-color: lemonchiffon;
      border-radius: 5px;
      font-family:"맑은고딕";
      border:none;
      color: rgba(112, 109, 109, 0.925);
      font-size: 20px;
      cursor: pointer;
	}
	.login_btn:hover{
	  background-color: rgb(228, 223, 184);
	}
	 #main_logo{
	    margin-left: 8%;
	  }
</style>
</head>
<body>
<div id="main_logo">
<a href="../" class="nav-link">
<img src="${root }image/logo_1.png" alt="" width="20%" height="20%"></a>
</div>
<div class="admin_login_logo">
	<h2>Admin Login</h2>
</div>

<div class="container" style="margin-top:70px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
				<c:if test="${fail == true }">
					<div class="alert alert-danger">
						<h3>로그인 실패</h3>
						<p>아이디 비밀번호를 확인해주세요</p>
					</div>
					</c:if>
					<form:form action="${root }admin/login_pro2" method='post' modelAttribute="tempLoginAdminBean">
						<div class="form-group">
							<form:label path="admin_id">아이디</form:label>
							<form:input path="admin_id" class='form-control'/>
							<form:errors path='admin_id' style='color:red'/>
						</div>
						<div class="form-group">
							<form:label path="admin_pw">비밀번호</form:label>
							<form:password path="admin_pw" class='form-control'/>
							<form:errors path='admin_pw' style='color:red'/>
						</div>
						<div class="form-group text-right">
							<form:button class='login_btn'>로그인</form:button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

</body>
</html>