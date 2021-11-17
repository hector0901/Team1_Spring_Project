<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>

<html lang="en">

<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../menu/css/ShopList.css">

<style>
a:focus, a:hover {
    color:rgba(163, 156, 156, 0.925);
    text-decoration: none;
}

.option li{
    list-style-type: none;
    margin-top: 3%;
}

.option{
    display: inline-block;
    text-align: center;
    margin-left: 27%;
    margin-top: 1%;
}

body{
    padding: 0;
    margin: 0;
}

h3{margin-left: 10px;}


.reg-button {
   display: inline-block;
   width: 130px;
   height: 50px;
   text-align: center;
   text-decoration: none;
   line-height: 54px;
   outline: none;
    background-color: lemonchiffon;
   border: 2px solid lightgray;
   color: black;
   line-height: 50px;
    font-size: 18px;
    font-weight: bold;
    margin-left: 110%;
    margin-top: 20%;
    display: block;
}

.reg-button:hover {
   border-style: dashed;
}

.reg-button::before,
.reg-button::after {
   position: absolute;
   z-index: -1;
   display: block;
   content: '';
}
.reg-button,
.reg-button::before,
.reg-button::after {
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
   -webkit-transition: all .3s;
   transition: all .3s;
}

:-ms-input-placeholder {color:rgba(163, 156, 156, 0.925)}
::-webkit-input-placeholder {color:rgba(163, 156, 156, 0.925)}
input::-moz-placeholder {color:rgba(163, 156, 156, 0.925)}

#search {
    height:40px;
    width:400px;
    border: 1px solid lightgrey;
    background: #ffffff;
}

input[type=text] {
    font-size: 16px;
    width:325px;
    padding: 7px;
    border: 0px;
    outline: none;
    float: left;
}

input[type=submit] {
    font-size: 16px;
    width:325px;
    padding: 7px;
    border: 0px;
    outline: none;
    float: left;
}

#submit {
    width:50px;
    height: 100%;
    border: 0px;
    background-color: lemonchiffon;
    outline: none;
    float: right;
    color: gray;
}

#submit:hover {
    font-size: 18px;
}
a{
   text-decoration: none;
       color:rgba(163, 156, 156, 0.925);
}
</style>

</head>

<body>

  <c:import url="/WEB-INF/views/menu/page_top.jsp"/>
  
	<div id="search" style="margin-left: 50%; margin-bottom: 5%;">
	    <input type="text" name="keyword" placeholder="검색어 입력">
	    <input type="submit" id="submit" value="검색">
	    <c:choose>
      	<c:when test="${loginBean2.adminLogin == true }">
              <button class="reg-button"onclick="location.href='${root }shop/reg?admin_no=${admin_no }&category_no=${category_no }'">가게 등록</button>
        </c:when>
        <c:otherwise></c:otherwise>
    </c:choose>        
	</div>

    <c:forEach var='obj' items="${shop_list_search_paging }"  varStatus="status" >
     <a href="${root }shop/shop_detail?category_no=${obj.category_no }&shop_no=${obj.shop_no}&member_no=${loginBean.member_no}">
     <div class="option">
            <div id="area">
               <div id="image">
               <c:choose>
               <c:when test="${obj.shop_main != null}"> <!-- 파일이 존재하면 -->
                    <img src="${root }upload/${obj.shop_main }" style="width: 250px; height: 250px;">
               </c:when>
               <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
                      <img src='${root }image/alt_image.png' style='width: 250px; height: 250px;'>
               </c:otherwise>
               </c:choose>
               </div>
 
               <div id="shop-name">${obj.shop_name }</div>
               <div id="shop-address">${obj.shop_address1 }</div>
               
               <c:choose>
	               <c:when test="${obj.shop_remain_seat  >  shop_total_seat * 0.5 }">
                    <div id="face-image"><img src="${root }shop/image/smile.png" style="width: 100px; height: 100px;"></div>
	               </c:when>
	               <c:otherwise>
	                  <div id="face-image"><img src="${root }shop/image/angry.png" style="width: 100px; height: 100px;"></div>
	               </c:otherwise>
               </c:choose>

               <div id="time-title">영업 시간</div>
               <div id="shop-time">${obj.shop_time }</div>
            </div>
       </div>
       </a>
      </c:forEach>
      
      <div class="d-none d-md-block">
          <ul class="pagination justify-content-center">
            <c:choose>
          <c:when test="${pageBean.prevPage <= 0 }">
          <li class="page-item active">
            <a href="${root }shop/shop_list_search_paging?page=${pageBean.prevPage}&category_no=${category_no}" class="page-link">이전</a>
          </li>
          </c:when>
          <c:otherwise>
          <li class="page-item">
            <a href="${root }shop/shop_list_search_paging?page=${pageBean.prevPage}&category_no=${category_no}" class="page-link">이전</a>
          </li>
          </c:otherwise>
          </c:choose>
          
          
          <c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
          <c:choose>
          <c:when test="${idx == pageBean.currentPage }">
          <li class="page-item active">
            <a href="${root }shop/shop_list_search_paging?page=${idx}&category_no=${category_no}" class="page-link">${idx }</a>
          </li>
          </c:when>
          <c:otherwise>
          <li class="page-item">
            <a href="${root }shop/shop_list_search_paging?page=${idx}&category_no=${category_no}" class="page-link">${idx }</a>
          </li>
          </c:otherwise>
          </c:choose>
          
          </c:forEach>
          
          <c:choose>
          <c:when test="${pageBean.max >= pageBean.pageCnt }">
          <li class="page-item active">
            <a href="${root }shop/shop_list_search_paging?page=${pageBean.nextPage}&category_no=${category_no}" class="page-link">다음</a>
          </li>
          </c:when>
          <c:otherwise>
          <li class="page-item">
            <a href="${root }shop/shop_list_search_paging?page=${pageBean.nextPage}&category_no=${category_no}" class="page-link">다음</a>
          </li>
          </c:otherwise>
          </c:choose>

          </ul>
        </div>
      
</body>
</html>