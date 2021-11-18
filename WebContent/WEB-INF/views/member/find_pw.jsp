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
<title>비밀번호 찾기</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!-- 폰트 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+P+One&display=swap" rel="stylesheet">
<style>
/* 폰트 링크 */
@import url('https://fonts.googleapis.com/css2?family=Mochiy+Pop+P+One&display=swap');
  .member_login_logo{
    font-family: 'Mochiy Pop P One', sans-serif;
    margin-left:35%;
    margin-top: 36px;
    position: absolute;
    z-index : 1;
  }
  .login_btn{
    padding: 1% 3%;
      background-color: white;
      border-radius: 5px;
      font-family:"맑은고딕";
      border:1px solid;
      color: rgba(112, 109, 109, 0.925);
      font-size: 20px;
      cursor: pointer;
      margin-right: 10px;
  }
  .login_btn:hover{
      background-color: rgb(219, 218, 204);
    }
  .join_btn{
    padding: 1% 3%;
      background-color: lemonchiffon;
      border-radius: 5px;
      font-family:"맑은고딕";
      border:none;
      color: rgba(112, 109, 109, 0.925);
      font-size: 20px;
      cursor: pointer;
  }
  a:link { 
   color: rgba(112, 109, 109, 0.925);
   text-decoration: none;
   }
  .join_btn:hover{
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
<div class="member_login_logo">
  <h1>FindPW</h1>
</div>

<div class="container" style="margin-top:80px">
  <div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6">
      <div class="card shadow">
        <div class="card-body">
        <c:if test="${fail == true }">
          <div class="alert alert-danger">
            <h3>비밀번호 찾기 실패</h3>
            <p>아이디 혹은 이메일을 확인해주세요</p>
          </div>
          </c:if>
          <form:form action="${root }member/find_pw_pro" method='post' modelAttribute="tempPWBean">
            <div class="form-group">
              <form:label path="member_id">아이디</form:label>
              <form:input path="member_id" class='form-control'/>
              <form:errors path='member_id' style='color:red'/>
            </div>
            <div class="form-group">
              <form:label path="member_email">이메일</form:label>
              <form:input path="member_email" class='form-control'/>
              <form:errors path='member_email' style='color:red'/>
            </div>
            <div class="form-group text-right">
              <form:button class='login_btn'>비밀번호 찾기</form:button>
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