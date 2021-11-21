<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/shop_Style.css">
<style type="text/css">

#daumRoughmapContainer1636946545932 {
  style=suser-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 45px; top: 40px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 1000px; height: 1000px;
}
.map{
<img src="http://map2.daumcdn.net/map_2d/2106wof/L4/1000/446.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 45px; top: 40px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 300px; height: 300px;">
}


</style>
  <script type="text/javascript">

    function reserveclick(){
      window.open("${root }reservation/reservation?member_no=${loginBean.member_no}&shop_no=${shop_no}","예매하기","width=500,height=600,left=300");
    }
    function waitingclick(){
      window.open("${root }waiting/waiting?member_no=${loginBean.member_no}&shop_no=${shop_no}","웨이팅","width=500,height=500,left=300");
    }
    function shopreplyclick() {
      window.open("${root}shopreply/shopreply?member_no=${loginBean.member_no}&shop_no=${shop_no}", "댓글");
    }
    function shopreplylistclick() {
      window.open("${root}shopreply/shopreply_list?member_no=${loginBean.member_no}&shop_no=${shop_no}", "댓글리스트");
    }
  </script>
  <script>
  function resizeMap() {
      var mapContainer = document.getElementById('map');
      mapContainer.style.width = '650px';
      mapContainer.style.height = '650px'; 
  }

  function relayout() {    
      
      // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
      // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
      // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
      map.relayout();
  }
  </script>
  
</head>

<body>
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <c:import url="/WEB-INF/views/menu/page_top.jsp"/>


  <!--가게설명-->

    <div id="shop_main">
      <ul id="shop_detail_page">
      	
        <li id="shop_main_img">
        
        <!-- 메인이미지  -->
        <c:choose>
      	  <c:when test="${readShopBean.shop_main != null}"> <!-- 파일이 존재하면 -->
          	<img src="${root }upload/${readShopBean.shop_main }" style="width: 550px; height: 550px;  ">
      	  </c:when>
          <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
            <img src='${root }image/alt_image.png' style='width:550px; height: 550px;'>
       	  </c:otherwise>
        </c:choose>
          
        </li> 
        <li>
        	<div id="shop_main_explanation">
          <p id="shop_main_name">${readShopBean.shop_name }</p>
          <p>${readShopBean.shop_simple }</p>
          <div id="explanation">
          <img src="image/pin.png" width="15" height="15">${readShopBean.shop_address1 }<br>
          ${readShopBean.shop_address2 }<br>
          <img src="image/clock.png" width="15" height="15"> ${readShopBean.shop_time }
         <br>
          <img src="image/clipboard.png" width="15" height="15"> ${readShopBean.shop_content }<br>
          </div><br><br>
         <c:choose> 
         <c:when test="${loginBean.memberLogin == true }">
          <input id="shop_reserve_button" type="submit" value="예약하기" onclick="reserveclick()">
          <input id="shop_waiting_button" type="submit" value="waiting" onclick="waitingclick()">
         </c:when>
			<c:when test="${loginBean2.adminLogin == true }">
         		<button id="shop_reserve_button"><a href="${root }shop/shop_update?shop_no=${shop_no}" class="nav-link">가게 수정</a></button>
         		<button id="shop_waiting_button"><a href="${root }shop/shop_delete?shop_no=${shop_no}" class="nav-link">가게 삭제</a></button>
         	</c:when>
         <c:otherwise>
         	<input id="shop_reserve_button" type="submit" value="예약하기">
          	<input id="shop_waiting_button" type="submit" value="waiting">
         </c:otherwise>
         </c:choose>
        </li>
        <li>
        	<span style="font-size: 12px; margin-left: 45%;">* 예약 및 웨이팅은 회원 전용 서비스입니다.</span>
        </li></div>
      </ul>
      
    </div>
    <br><br>


<!--탭버튼부분-->  
    <div class="shop_tab_menu">
        <ul class="list">
            <li class="tab_Button">
                <a href="#shop_main_menu_content" class="btn" id="shop_main_menu_tab">메인메뉴</a>
            </li>
            <li>
                <a href="#shop_menu_pan_content" class="btn" id="shop_menu_pan_tab">상세사진</a>
            </li> 
            <li>
                <a href="#shop_review" class="btn" id="shop_review_tab">리뷰</a>
            </li> 
            <li>
                <a href="#shop_map_contact" class="btn" id="shop_contact_tab">오시는길</a>
            </li>     
        </ul>

        <div class="shop_tab_content">
          <div id="shop_main_menu_content" class="cont">
            <!-- 메뉴 이미지 -->
            <div id="shop_mainmenu_img">
            
            <c:choose>
      	      <c:when test="${readShopBean.shop_menu_img != null}"> <!-- 파일이 존재하면 -->
            	<img src="${root }upload/${readShopBean.shop_menu_img }" style="width: 950px; height: 500px;">
      	      </c:when>
              <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
                <img src='${root }image/alt_image.png' style='width:1500px; height: 600px;'>
       	      </c:otherwise>
            </c:choose>
               
            </div>
          </div>
        

        <div id="shop_menu_pan_content" class="cont">
             <div id="shop_menu_pan">
                    <div id="shop_menu_pan_back_button">      
                    <!-- 내부이미지  -->
                    
                    <c:choose>
	      	          <c:when test="${readShopBean.shop_inside_img != null}"> <!-- 파일이 존재하면 -->
	                    <img src="${root }upload/${readShopBean.shop_inside_img }" style="width: 960px; height: 550px;">
	      	          </c:when>
	                  <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
	                    <img src='${root }image/alt_image.png' style='width: 960px; height: 550px;'>
	       	          </c:otherwise>
	                </c:choose>
                         
                   <br><br>
                  </div>
            </div>   
        </div>

   <div id="shop_review" class="cont">
   <div id="review_view">
   <!-- 닉네임 올린 리뷰들어가야함 -->
   <div class="container" style="margin-top: 100px">
   <div class="card shadow">
       <form:form action="${root }shop/reply_pro" method='post' modelAttribute="joinShopreplyBean">
	   <form:hidden path="member_no" />
	   <form:hidden path="shop_no" />
					댓글내용
					<form:textarea path="shop_reply_content" />
			        <button type="submit" id="review_button">등록</button>
      </form:form>
   </div>
      <div class="card-body">
           <table class="table table-hover" id=shopreply_list>
           <thead>
            <tr>
              <th class="text-center d-none d-md-table-cell">회원닉네임</th>
              <th class="text-center d-none d-md-table-cell">프로필사진</th>
              <th class="text-center d-none d-md-table-cell">댓글내용</th>
              <th class="text-center d-none d-md-table-cell">댓글등록일</th>
              <th class="text-center d-none d-md-table-cell">삭제</th>
            </tr>
          </thead>
                 <tbody>
                   <c:forEach var='obj' items="${shopreply_list }" varStatus="status">
                   <tr>
                   

                   <td>
                   <c:choose>
                        <c:when test="${obj.member_no == loginBean.member_no}">
                          <a href="${root }shop/reply_delete?member_no=${loginBean.member_no}&shop_reply_no=${obj.shop_reply_no}&shop_no=${shop_no}"><img alt="" src="${root }image/x.png"></a>
                        </c:when>
                        <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>

                        </c:otherwise>
                   </c:choose>
                   </td>
                   
                   <td class="text-center d-none d-md-table-cell" id="id">${obj.member_nickname }</td>
                   <td>
						 <c:choose>
						    <c:when test="${obj.member_profile != null}"> <!-- 파일이 존재하면 -->
						    <img src="${root }upload/${obj.member_profile}" style="width: 120px; height: 120px;"> <!--  -->
				            </c:when>
			              <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
			                 <img src='${root }image/none1.png' style='width: 150px; height: 150px;'>
                          </c:otherwise>
                         </c:choose>       
				   </td>			
                   <td class="text-center d-none d-md-table-cell" id="id">${obj.shop_reply_content }</td>
                   <td class="text-center d-none d-md-table-cell" id="id">${obj.shop_reply_rdate }</td>
                   </tr>
                   </c:forEach>
                 </tbody>
            </table>
       </div>
     </div>
    </div>
   </div>
   </div>
   
        <div id="shop_map_contact" class="cont">
            <div id="map_content">
            <div id="map" oninput=resizeMap() style="width: 120%; height: 120%;">${readShopBean.map }</div> 
            </div>
        </div>
        </div>
  </div>
<script>
    const tabList = document.querySelectorAll('.shop_tab_menu .list li');
    const contents = document.querySelectorAll('.cont')
    let activeCont =""; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)
     /* var map=document.getElementById("map"); */
    for(var i = 0; i < tabList.length; i++){
      tabList[i].querySelector('.btn').addEventListener('click', function(e){
        e.preventDefault();
        for(var j = 0; j < tabList.length; j++){
          // 나머지 버튼 클래스 제거
          tabList[j].classList.remove('tab_Button');
  
          // 나머지 컨텐츠 display:none 처리
          contents[j].style.display ='none';
        }
  
        // 버튼 관련 이벤트
        this.parentNode.classList.add('tab_Button');
  
        // 버튼 클릭시 컨텐츠 전환
        activeCont = this.getAttribute('href');
        document.querySelector(activeCont).style.display = 'block';
        // display: block 이 된 직 후,
        window.setTimeout(function() {
         /* map.relayout(); */
     }, 0);
      });
    }
  </script> 
</body>
</html>