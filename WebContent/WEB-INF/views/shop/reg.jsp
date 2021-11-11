<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  
 <style>
 #title{
    text-align: left;
    border-bottom: 1px dashed lightgray;
    width: 1000px;
    margin: 60px auto;
}

.col-md-6 {
    margin-left: -90px;
}

.col-md-2 control-label {
    margin-bottom: 10xp;
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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

<script type="text/javascript">
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
           
           
           $("[name=shop_zipcode]").val(data.zonecode);
           $("[name=shop_address1]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
</script>

</head>

<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

    <div id="title">
        <h1>가게 등록</h1>
    </div>

     <form:form action="${root }shop/reg_pro" method='post' modelAttribute="RegShopBean">
      <form:hidden path="admin_no"/>
      <form:hidden path="category_no"/>
      
      <div class="form-group">
        <form:label path="shop_name" class="col-md-2 control-label">가게명 *</form:label>
          <div class="col-md-6">
            <form:input path="shop_name" class='form-control' required="required"/>
          </div>
      </div>

      <br><br><br>
      
      <div class="form-group">
        <form:label path="shop_content" class="col-md-2 control-label">설명 *</form:label>
          <div class="col-md-6">
            <form:textarea path="shop_content" class="form-control" rows="10" style="resize:none" required="required"/>
          </div>
      </div>
      
      <br><br><br><br><br><br><br><br><br><br><br>
      
      <div class="form-group">
        <form:label path="shop_zipcode" class="col-md-2 control-label">우편번호 *</form:label>
          <div class="col-md-6">
            <form:input path="shop_zipcode" class='form-control' readonly="true" required="required"/>
              <button type="button" class="btn btn-default" onclick="execPostCode();" style="margin-top: 2%"><i class="fa fa-search"></i> 우편번호 찾기
            </button>
          </div>
      </div>
           
      <br><br><br><br><br>
           
      <div class="form-group">
        <form:label path="shop_address1" class="col-md-2 control-label">주소 *</form:label>
          <div class="col-md-6">
            <form:input path="shop_address1" class='form-control' readonly="true" required="required"/>
          </div>
      </div>
           
      <br><br><br>
      
      <div class="form-group">
        <form:label path="shop_address2" class="col-md-2 control-label">상세주소 *</form:label>
          <div class="col-md-6">
            <form:input path="shop_address2" class='form-control' />
          </div>
      </div>
      
      <br><br><br>
          
      <div class="form-group">
        <form:label path="map" class="col-md-2 control-label">지도 *</form:label>
          <div class="col-md-6">
            <form:textarea path="map" class="form-control" rows="10" style="resize:none" required="required"/>
          </div>
      </div>
           
      <br><br><br><br><br><br><br><br><br><br><br>
           
      <div class="form-group">
        <form:label path="shop_main" class="col-md-2 control-label">메인 이미지 *</form:label>
          <div class="col-md-6">
            <form:input type='file' path='shop_main' class="form-control" accept="image/*" required="required"/>
          </div>
      </div>

      <br><br><br>

      <div class="form-group">
        <form:label path="shop_menu_img" class="col-md-2 control-label">메뉴 이미지 *</form:label>
          <div class="col-md-6">
            <form:input type='file' path='shop_menu_img' class="form-control" accept="image/*" required="required"/>
          </div>
      </div>

      <br><br><br>
           
       <div class="form-group">
        <form:label path="shop_inside_img" class="col-md-2 control-label">내부 이미지 *</form:label>
          <div class="col-md-6">
            <form:input type='file' path='shop_inside_img' class="form-control" accept="image/*" required="required"/>
          </div>
       </div>
           
       <br><br><br>
           
       <div class="form-group">
        <form:label path="shop_total_seat" class="col-md-2 control-label">총 좌석 수 *</form:label>
          <div class="col-md-6">
            <form:input type="number" path="shop_total_seat" class='form-control' required="required"/>
          </div>
       </div>
           
       <br><br><br>
           
       <div class="form-group">
        <form:label path="shop_remain_seat" class="col-md-2 control-label">잔여 좌석 수 *</form:label>
          <div class="col-md-6">
            <form:input type="number" path="shop_remain_seat" class='form-control' required="required"/>
          </div>
       </div>
           
       <br><br><br>

       <div id="btn">
        <form:button class='btn1'>가게 등록</form:button>&emsp;
        <button type="button" class='btn2' onclick="location.href='${root }shop/main?category_no=1'">취소</button>  
       </div>
    </form:form>
    
    <br><br><br>
    
</body>
</html>