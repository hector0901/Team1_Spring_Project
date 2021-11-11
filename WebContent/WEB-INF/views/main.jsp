<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="css/main_Style.css">
<style type="text/css">

</style>
</head>
<body>

 <!-- 죄상단 로고 -->
 <img src="${root }image/logo_1.png" alt="" width="15%" height="15%">




<c:import url="/WEB-INF/views/menu/top.jsp"/>

    
<br>
<hr style="width: 30%; float: left;margin-left: 5%;" >
<span style="font-size: 2em; color: gainsboro;" >  SHOP LIST</span>
<br>
<br>
<br>
<div style="display: inline-block;">
  <a href="${root }shop/main?category_no=1" class="shop"><img src="${root }image/bar_1.png" alt="" width="20%" height="20%"></a>
  <a href="${root }shop/main?category_no=2" class="shop"><img src="${root }image/restaurant_1.png" alt=""width="20%" height="20%"></a>
 <a href=""class="category"><img src="${root }image/cafe_1.png" alt=""width="20%" height="20%"></a>
<br>
<br>
<span style="font-size: 2em; color: gainsboro; padding: 5%;"> SHOP LIST</span><br>
 <hr style="width: 50%;float: left ; margin-left: 18%;" >
</div>


     <!-- 배경 이미지 슬라이드 효과 -->
     <ul class="bg-slide">

      <li></li>
      <li></li>
      <li></li>
      <li></li>
      
      
      </ul>
    


</body>
</html>