<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>웨이팅</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@700&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.10.2/js/all.js"></script>
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gaegu:wght@700&display=swap');
.font{
	font-family: 'Gaegu', cursive;
}

body {
    margin: 0px auto;
    width: 100%;
}
.col-md-6 {
    margin-left: -90px;
}

</style>
</head>
<body>
  <c:import url="/WEB-INF/views/menu/page_top.jsp"/>
<div class="font">
	<h1>웨이팅 정보</h1>
</div>
<hr style="width: 70%">

 <!-- <form:form action="" method='post' modelAttribute="" enctype="multipart/form-data">
       <form:hidden path=""/> -->
            <div class="form-group">
              <form:label path="waiting_no" class="col-md-2 control-label">웨이팅번호</form:label>
              <div class="col-md-6">
                <form:input path="waiting_no" class='form-control' class="form-control" required="required"/> 
              </div>
           </div>
           <br><br>
            <div class="form-group">
              <form:label path="waiting_count" class="col-md-2 control-label">웨이팅인원</form:label>
              <div class="col-md-6">
                <form:input path="waiting_count" class='form-control' class="form-control" required="required"/> 
              </div>
           </div>
           <br><br>
            <div class="form-group">
              <form:label path="waiting_rdate" class="col-md-2 control-label">웨이팅시간</form:label>
              <div class="col-md-6">
                <form:input path="waiting_rdate" class='form-control' class="form-control" required="required"/> 
              </div>
           </div>
           <br><br>
            
           <br><br>      		
           <button type="button" class="reservation_button" id="button2" onclick="location.href='../'" >나가기</button>
         <!--   </form:form> --> 
</body>
</html>