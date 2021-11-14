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
      imgTag.setAttribute("src","image/���Գ���"+num+".png");
    }

    function reserveclick(){
      window.open("${root }reservation/reservation?reservation_no=1&member_no=1&shop_no=1","�����ϱ�","width=500,height=600,left=300");
    }
    function waitingclick(){
      window.open("${root }waiting/waiting?waiting_no=1&member_no=1&shop_no=1","������","width=400,height=500,left=300");
    }
  </script>
</head>

<body>
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <c:import url="/WEB-INF/views/menu/page_top.jsp"/>


  <!--���Լ���-->

    <div id="shop_main">
      <ul id="shop_detail_page">
      	
        <li id="shop_main_img">
          <img src="image/���ո���.png" alt="��������" width="600" height="500" ></li>
        <li id="shop_main_explanation">
          <p id="shop_main_name">�������<span id="group_name">���</span></p>
          <p>�ñ��ߴ� �ͼ��� ������ ���� ������ ������ �������</p>
          <img src="image/telephone.png" width="15" height="15"> 0507-1339-9951<br>
          <img src="image/pin.png" width="15" height="15"> ���� ���α� �ͼ��� 170-1<br>
          ����3���� 4�� �ⱸ����<span style="color:tomato">114m</span><br>
          <img src="image/clock.png" width="15" height="15"> ���� 12:00 - 22:00
           <span style="color:red">������ �޹�</span>
         <br>
          <img src="image/clipboard.png" width="15" height="15"> ������ �������� ��ȭ �ֽø� ����帮�ڽ��ϴ�<br>
           break time 16:00-17:00<br>
          last oder: 21:0<br>
          &nbsp;&nbsp;&nbsp; ���ִ³༮�� 334ȸ, 21.07.16 �濵<br>
          &nbsp;&nbsp;&nbsp; ��ü��, ����, ���, ����<br>&nbsp;&nbsp;&nbsp; �������ͳ�, ����ȭ��(ī����), �������̰���<br><br>
          <input id="shop_reserve_button" type="submit" value="�����ϱ�" onclick="reserveclick()">
          <input id="shop_waiting_button" type="submit" value="waiting" onclick="waitingclick()"><br><br><br>
        </li>
      </ul>
      
    </div>
    <br><br>


<!--�ǹ�ư�κ�-->  
    <div class="shop_tab_menu">
        <ul class="list">
            <li class="tab_Button">
                <a href="#shop_main_menu_content" class="btn" id="shop_main_menu_tab">���θ޴�</a>
            </li>
            <li>
                <a href="#shop_menu_pan_content" class="btn" id="shop_menu_pan_tab">�󼼻���</a>
            </li> 
            <li>
                <a href="#shop_review" class="btn" id="shop_review_tab">����</a>
            </li> 
            <li>
                <a href="#shop_map_contact" class="btn" id="shop_contact_tab">���ô±�</a>
            </li>     
        </ul>

        <div class="shop_tab_content">
            <div id="shop_main_menu_content" class="cont">
              <div id="shop_mainmenu_img">
                <img src="image/����.png" width="950"height="500">
              </div>
                </div>
        

        <div id="shop_menu_pan_content" class="cont">
             <div id="shop_menu_pan">
                    <div id="shop_menu_pan_back_button">
                    <button id="back_button" onclick="previous(0)">
                     <
                    </button><br><br>
                    </div>
                    <img src="image/���Գ���1.png" id="shop_menupan_img" alt="��������" width="700" height="500">
                    <div id="shop_menu_pan_after_button">
                    <button id="after_button" onclick="previous(1)">
                      >
                    </button><br><br>
                  </div>
            </div>   
        </div>

        <div id="shop_review" class="cont">
        	<div id="review_view">
        	<!-- �г��� �ø� ��������� -->
            	<div id="shop_review_img"> 
            		<img id="profile" src="image/�����.png" width="100px" height="90px">
            	</div>
            	<div id="review_user">
            		<input type="text" class="review_nickname" value="����" readonly="readonly"/>
            		<textarea class="add" cols="70" rows="4" readonly="readonly">������ ���ְ� ����</textarea> 
            	</div>
            </div>	
                	<div class="form-group" style="width: 70%; margin-left: 10%; margin-top: 5%;">
    					<div class="col-sm-12">
    						<textarea class="form-control"id="add" rows="4" style="resize: none;"></textarea>  
  						</div>
  						
  						</div>
  						<button type="submit" id="review_button">���</button>
        </div>

        <div id="shop_map_contact" class="cont">
            <div id="map_content">
            <p style="font:30px bold">���ô±�</p>
            

            </div>
        </div>
        </div>
  </div>
<script>
    const tabList = document.querySelectorAll('.shop_tab_menu .list li');
    const contents = document.querySelectorAll('.cont')
    let activeCont =""; // ���� Ȱ��ȭ �� ������ (�⺻:#tab1 Ȱ��ȭ)
  
    for(var i = 0; i < tabList.length; i++){
      tabList[i].querySelector('.btn').addEventListener('click', function(e){
        e.preventDefault();
        for(var j = 0; j < tabList.length; j++){
          // ������ ��ư Ŭ���� ����
          tabList[j].classList.remove('tab_Button');
  
          // ������ ������ display:none ó��
          contents[j].style.display ='none';
        }
  
        // ��ư ���� �̺�Ʈ
        this.parentNode.classList.add('tab_Button');
  
        // ��ư Ŭ���� ������ ��ȯ
        activeCont = this.getAttribute('href');
        document.querySelector(activeCont).style.display = 'block';
      });
    }
  </script> 
</body>
</html>