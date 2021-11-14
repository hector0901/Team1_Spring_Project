<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
</style>
  <script type="text/javascript">
    var num=1;
    function previous(idx){
      
      if(idx){
        if(num==2)
         return;
        num++;
      }
      else{
        if(num==1)
        return;
        num--;
      }
      var imgTag=document.getElementById("shop_menupan_img");
      imgTag.setAttribute("src","image/가게내부"+num+".png");
    }

    function reserveclick(){
      window.open("${root }reservation/reservation?reservation_no=1&member_no=1&shop_no=1","예매하기","width=500,height=600,left=300");
    }
    function waitingclick(){
      window.open("${root }waiting/waiting?waiting_no=1&member_no=1&shop_no=1","웨이팅","width=400,height=500,left=300");
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
          <img src="image/갓잇메인.png" alt="사진없음" width="600" height="500" ></li>
        <li id="shop_main_explanation">
          <p id="shop_main_name">르블란서<span id="group_name">양식</span></p>
          <p>궁금했던 익선동 분위기 좋은 프랑스 가정식 레스토랑</p>
          <img src="image/telephone.png" width="15" height="15"> 0507-1339-9951<br>
          <img src="image/pin.png" width="15" height="15"> 서울 종로구 익선동 170-1<br>
          종로3가역 4번 출구에서<span style="color:tomato">114m</span><br>
          <img src="image/clock.png" width="15" height="15"> 매일 12:00 - 22:00
           <span style="color:red">월요일 휴무</span>
         <br>
          <img src="image/clipboard.png" width="15" height="15"> 주차는 매장으로 전화 주시면 설명드리겠습니다<br>
           break time 16:00-17:00<br>
          last oder: 21:0<br>
          &nbsp;&nbsp;&nbsp; 맛있는녀석들 334회, 21.07.16 방영<br>
          &nbsp;&nbsp;&nbsp; 단체석, 포장, 배달, 예약<br>&nbsp;&nbsp;&nbsp; 무선인터넷, 지역화폐(카드형), 제로페이가능<br><br>
          <input id="shop_reserve_button" type="submit" value="예약하기" onclick="reserveclick()">
          <input id="shop_waiting_button" type="submit" value="waiting" onclick="waitingclick()"><br><br><br>
        </li>
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
              <div id="shop_mainmenu_img">
                <img src="image/갓잇.png" width="950"height="500">
              </div>
                </div>
        

        <div id="shop_menu_pan_content" class="cont">
             <div id="shop_menu_pan">
                    <div id="shop_menu_pan_back_button">
                    <button id="back_button" onclick="previous(0)">
                     <
                    </button><br><br>
                    </div>
                    <img src="image/가게내부1.png" id="shop_menupan_img" alt="사진없음" width="700" height="500">
                    <div id="shop_menu_pan_after_button">
                    <button id="after_button" onclick="previous(1)">
                      >
                    </button><br><br>
                  </div>
            </div>   
        </div>

        <div id="shop_review" class="cont">
        	<div id="review_view">
        	<!-- 닉네임 올린 리뷰들어가야함 -->
            	<div id="shop_review_img"> 
            		<img id="profile" src="image/고양이.png" width="100px" height="90px">
            	</div>
            	<div id="review_user">
            		<input type="text" class="review_nickname" value="응갬" readonly="readonly"/>
            		<textarea class="add" cols="70" rows="4" readonly="readonly">음식이 맛있고 좋다</textarea> 
            	</div>
            </div>	
                	<div class="form-group" style="width: 70%; margin-left: 10%; margin-top: 5%;">
    					<div class="col-sm-12">
    						<textarea class="form-control"id="add" rows="4" style="resize: none;"></textarea>  
  						</div>
  						
  						</div>
  						<button type="submit" id="review_button">등록</button>
        </div>

        <div id="shop_map_contact" class="cont">
            <div id="map_content">
            <p style="font:30px bold">오시는길</p>
            

            </div>
        </div>
        </div>
  </div>
<script>
    const tabList = document.querySelectorAll('.shop_tab_menu .list li');
    const contents = document.querySelectorAll('.cont')
    let activeCont =""; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)
  
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
      });
    }
  </script> 
</body>
</html>