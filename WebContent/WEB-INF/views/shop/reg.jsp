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


</head>

<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

    <div id="title">
        <h1>가게 등록</h1>
    </div>
    
     <form:form action="${root }category/write_pro" method='post' modelAttribute="writeShopBean">
           <div class="form-group">
              <form:label path="shop_name" class="col-md-2 control-label">이름 *</form:label>
               <div class="col-md-6">
                <form:input path="shop_name" class='form-control' />
            </div>
            </div>

           <br><br><br>
          
           <div class="form-group">
              <form:label path="shop_content" class="col-md-2 control-label">설명 *</form:label>
              <div class="col-md-6">
              <form:textarea path="shop_content" class="form-control" rows="10" style="resize:none"/>
              </div>
           </div>
           
           <br><br><br><br><br><br><br><br><br><br><br><br>
          
          <div class="form-group">
              <form:label path="shop_map" class="col-md-2 control-label">위치 *</form:label>
              <div class="col-md-6">
              <form:textarea path="shop_map" class="form-control" rows="10" style="resize:none"/>
              </div>
           </div>
           
           <br><br><br><br><br><br><br><br><br><br><br>
           
           <div class="form-group">
              <form:label path="shop_main" class="col-md-2 control-label">메인 이미지 *</form:label>
              <div class="col-md-6">
                  <form:input type='file' path='shop_main' class="form-control" accept="image/*"/>
              </div>
           </div>

           <br><br><br>

           <div class="form-group">
              <form:label path="shop_menu_img" class="col-md-2 control-label">메뉴 이미지 *</form:label>
              <div class="col-md-6">
                  <form:input type='file' path='shop_menu_img' class="form-control" accept="image/*"/>
              </div>
           </div>

           <br><br><br>
           
           <div class="form-group">
              <form:label path="shop_inside_img" class="col-md-2 control-label">내부 이미지 *</form:label>
              <div class="col-md-6">
                  <form:input type='file' path='shop_inside_img' class="form-control" accept="image/*"/>
              </div>
           </div>
           
           <br><br><br>
           
           <div class="form-group">
              <form:label path="shop_total_seat" class="col-md-2 control-label">총 좌석 수 *</form:label>
              <div class="col-md-6">
              <form:input type="number" path="shop_total_seat" class='form-control'/>
              </div>
           </div>
           
           <br><br><br>
           
           <div class="form-group">
              <form:label path="shop_remain_seat" class="col-md-2 control-label">잔여 좌석 수 *</form:label>
              <div class="col-md-6">
              <form:input type="number" path="shop_remain_seat" class='form-control'/>
              </div>
           </div>
           
           <br><br><br><br>

           <div id="btn">
             <form:button class='btn1'>가게 등록</form:button>&emsp;
              <button type="button" class='btn2' onclick="location.href='${root }category/main?category_no=1'">취소</button>  
           </div>
    </form:form>
    
</body>
</html>