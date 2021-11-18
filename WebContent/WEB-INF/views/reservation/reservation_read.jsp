<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
</style>
</head>
<body>
  <c:import url="/WEB-INF/views/menu/page_top.jsp"/>
<div class="member_login_logo">
  <h1>예약 정보</h1>
</div>
<hr style="width: 70%">

 <div class="container" style="margin-top:100px">
  <div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6">
      <div class="card shadow">
        <div class="card-body">
        <div class="form-group">
            <label for="shop_name">가게명</label>
            <input type="text" id="shop_name" name="shop_name" class="form-control" value="${reservation_read.shop_name }" disabled="disabled"/>
          </div>
          <div class="form-group">
            <label for="map">지도</label>
            <div id="map" style="width: 120%; height: 120%;">${reservation_read.map }</div> 
          </div>
          <div class="form-group">
            <label for="member_name">이름</label>
            <input type="text" id="member_name" name="member_name" class="form-control" value="${reservation_read.member_name }" disabled="disabled"/>
          </div>
          <div class="form-group">
            <label for="member_tel">연락처</label>
            <input type="text" id="member_tel" name="member_tel" class="form-control" value="${reservation_read.member_tel }" disabled="disabled"/>
          </div>
          <div class="form-group">
            <label for="reservation_no">예약번호</label>
            <input type="text" id="reservation_no" name="reservation_no" class="form-control" value="${reservation_read.reservation_no }" disabled="disabled"/>
          </div>
          <div class="form-group">
            <label for="reservation_date">예약일</label>
            <input type="text" id="reservation_date" name="reservation_date" class="form-control" value="${reservation_read.reservation_date }" disabled="disabled"/>
          </div>
          <div class="form-group">
            <label for="reservation_time">예약시간</label>
            <input type="text" id="reservation_time" name="reservation_time" class="form-control" value="${reservation_read.reservation_time }" disabled="disabled"/>
          </div>
          <div class="form-group">
            <label for="reservation_person">예약인원</label>
            <input type="text" id="reservation_person" name="reservation_person" class="form-control" value="${reservation_read.reservation_person }" disabled="disabled"/>
          </div>
          <div class="form-group">
            <label for="reservation_rdate">예약건 시간</label>
            <input type="text" id="reservation_rdate" name="reservation_rdate" class="form-control" value="${reservation_read.reservation_rdate }" disabled="disabled"/>
          </div>
          
          <a href="${root }reservation/reservation_delete?member_no=${loginBean.member_no}&reservation_no=${reservation_read.reservation_no}">X</a>
          
        </div>
      </div>
    </div>
    <div class="col-sm-3"></div>
  </div>
</div>



</body>
</html>