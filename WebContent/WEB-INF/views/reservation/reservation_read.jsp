<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
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
  @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
.font{
  font-family: 'Jua', sans-serif;
}
.col-md-4 {
    margin-left: -75px;
}
body {
    margin: 0px auto;
    width: 100%;
}
.container{
	margin-left: 30%;
}
</style>
</head>
<body>
  <c:import url="/WEB-INF/views/menu/page_top.jsp"/>
<div class="font">
  <h1>예약 정보</h1>
</div>
<hr style="width: 70%">

 <div class="container" style="margin-top:100px">
 
        <div class="form-group">
            <label for="shop_name" class="col-md-2 control-label">가게명</label>
            <div class="col-md-4">
            <input type="text" id="shop_name" name="shop_name" class="form-control" value="${reservation_read.shop_name }" disabled="disabled"/>
          </div>
          <br><br>
          <div class="form-group">
            <label for="map" class="col-md-2 control-label">지도</label>
            <div class="col-md-4">
            <div id="map" style="width: 120%; height: 120%;">${reservation_read.map }</div> 
            </div>
          </div>
          <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
          <div class="form-group">
            <label for="member_name" class="col-md-2 control-label">이름</label>
            <div class="col-md-4">
            <input type="text" id="member_name" name="member_name" class="form-control" value="${reservation_read.member_name }" disabled="disabled"/>
            </div> 
          </div>
          <br><br>
          <div class="form-group">
            <label for="member_tel" class="col-md-2 control-label">연락처</label>
            <div class="col-md-4">
            <input type="text" id="member_tel" name="member_tel" class="form-control" value="${reservation_read.member_tel }" disabled="disabled"/>
            </div>
          </div>
          <br><br>
          <div class="form-group">
            <label for="reservation_no" class="col-md-2 control-label">예약번호</label>
            <div class="col-md-4">
            <input type="text" id="reservation_no" name="reservation_no" class="form-control" value="${reservation_read.reservation_no }" disabled="disabled"/>
            </div>
          </div>
          <br><br>
          <div class="form-group">
            <label for="reservation_date"class="col-md-2 control-label">예약일</label>
            <div class="col-md-4">
            <input type="text" id="reservation_date" name="reservation_date" class="form-control" value="${reservation_read.reservation_date }" disabled="disabled"/>
            </div>
          </div>
          <br><br>
          <div class="form-group">
            <label for="reservation_time" class="col-md-2 control-label">예약시간</label>
            <div class="col-md-4">
            <input type="text" id="reservation_time" name="reservation_time" class="form-control" value="${reservation_read.reservation_time }" disabled="disabled"/>
            </div>
          </div>
          <br><br>
          <div class="form-group">
            <label for="reservation_person" class="col-md-2 control-label">예약인원</label>
            <div class="col-md-4">
            <input type="text" id="reservation_person" name="reservation_person" class="form-control" value="${reservation_read.reservation_person }" disabled="disabled"/>
            </div>
          </div>
          <br><br>
          <div class="form-group">
            <label for="reservation_rdate" class="col-md-2 control-label">예약건 시간</label>
            <div class="col-md-4">
            <input type="text" id="reservation_rdate" name="reservation_rdate" class="form-control" value="${reservation_read.reservation_rdate }" disabled="disabled"/>
            </div>
          </div>
          <br><br>
          <div class="form-group">
            <label for="reservation_rdate" class="col-md-2 control-label">추가사항</label>
            <div class="col-md-4">
            <textarea id="reservation_add" name="reservation_add" class="form-control" disabled="disabled">${reservation_read.reservation_add }</textarea>
            </div>
          </div>
          <br><br>
          
        </div>
      </div>

    <div class="col-sm-3"></div>




</body>
</html>