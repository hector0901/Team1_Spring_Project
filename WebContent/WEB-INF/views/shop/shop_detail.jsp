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

#daumRoughmapContainer1636946545932 {
  style=suser-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 45px; top: 40px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 1000px; height: 1000px;
}
.map{
<img src="http://map2.daumcdn.net/map_2d/2106wof/L4/1000/446.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 45px; top: 40px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 300px; height: 300px;">
}


</style>
  <script type="text/javascript">

    function reserveclick(){
      window.open("${root }reservation/reservation?reservation_no=1&member_no=1&shop_no=1","�����ϱ�","width=500,height=600,left=300");
    }
    function waitingclick(){
      window.open("${root }waiting/waiting?member_no=${loginBean.member_no}&shop_no=${shop_no}","������","width=500,height=500,left=300");
    }
    function shopreplyclick() {
    	window.open("${root}shopreply/shopreply?member_no=${loginBean.member_no}&shop_no=${shop_no}", "���");
    }
    function shopreplylistclick() {
    	window.open("${root}shopreply/shopreply_list?member_no=${loginBean.member_no}&shop_no=${shop_no}", "��۸���Ʈ");
    }
  </script>
  <script>
  function resizeMap() {
	    var mapContainer = document.getElementById('map');
	    mapContainer.style.width = '650px';
	    mapContainer.style.height = '650px'; 
	}

	function relayout() {    
	    
	    // ������ ǥ���ϴ� div ũ�⸦ ������ ���� ������ ���������� ǥ����� ���� ���� �ֽ��ϴ�
	    // ũ�⸦ ������ ���Ŀ��� �ݵ��  map.relayout �Լ��� ȣ���ؾ� �մϴ� 
	    // window�� resize �̺�Ʈ�� ���� ũ�⺯���� map.relayout �Լ��� �ڵ����� ȣ��˴ϴ�
	    map.relayout();
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
        
        <!-- �����̹���  -->
        <c:choose>
      	  <c:when test="${readShopBean.shop_main != null}"> <!-- ������ �����ϸ� -->
          	<img src="${root }upload/${readShopBean.shop_main }" style="width: 250px; height: 250px;">
      	  </c:when>
          <c:otherwise> <%-- ������ ���� ��� �⺻ �̹��� ��� --%>
            <img src='${root }image/alt_image.png' style='width: 250px; height: 250px;'>
       	  </c:otherwise>
        </c:choose>
          
        </li> 
        <li id="shop_main_explanation">
          <p id="shop_main_name">${readShopBean.shop_name }</p>
          <p>${readShopBean.shop_simple }</p>
          <img src="image/telephone.png" width="15" height="15"> 0507-1339-9951<br>
          <img src="image/pin.png" width="15" height="15">${readShopBean.shop_address1 }<br>
          ${readShopBean.shop_address2 }<br>
          <img src="image/clock.png" width="15" height="15"> ${readShopBean.shop_time }
         <br>
          <img src="image/clipboard.png" width="15" height="15"> ${readShopBean.shop_content }<br>
          <input id="shop_reserve_button" type="submit" value="�����ϱ�" onclick="reserveclick()">
          <input id="shop_waiting_button" type="submit" value="waiting" onclick="waitingclick()"><br><br><br>
          <a href="${root }shop/shop_update?shop_no=${shop_no}" class="nav-link">���� ����</a>
          <a href="${root }shop/shop_delete?shop_no=${shop_no}" class="nav-link">���� ����</a>
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
                <input id="shop_reply_button" type="submit" value="��۵��" onclick="shopreplyclick()">
                <input id="shop_reply_list_button" type="submit" value="��۸��" onclick="shopreplylistclick()">
            </li> 
            <li>
                <a href="#shop_map_contact" class="btn" id="shop_contact_tab">���ô±�</a>
            </li>     
        </ul>

        <div class="shop_tab_content">
          <div id="shop_main_menu_content" class="cont">
            <!-- �޴� �̹��� -->
            <div id="shop_mainmenu_img">
            
            <c:choose>
      	      <c:when test="${readShopBean.shop_menu_img != null}"> <!-- ������ �����ϸ� -->
            	<img src="${root }upload/${readShopBean.shop_menu_img }" style="width: 250px; height: 250px;">
      	      </c:when>
              <c:otherwise> <%-- ������ ���� ��� �⺻ �̹��� ��� --%>
                <img src='${root }image/alt_image.png' style='width: 250px; height: 250px;'>
       	      </c:otherwise>
            </c:choose>
               
            </div>
          </div>
        

        <div id="shop_menu_pan_content" class="cont">
             <div id="shop_menu_pan">
                    <div id="shop_menu_pan_back_button">      
                    <!-- �����̹���  -->
                    
                    <c:choose>
	      	          <c:when test="${readShopBean.shop_inside_img != null}"> <!-- ������ �����ϸ� -->
	                    <img src="${root }upload/${readShopBean.shop_inside_img }" style="width: 250px; height: 250px;">
	      	          </c:when>
	                  <c:otherwise> <%-- ������ ���� ��� �⺻ �̹��� ��� --%>
	                    <img src='${root }image/alt_image.png' style='width: 250px; height: 250px;'>
	       	          </c:otherwise>
	                </c:choose>
                         
                   <br><br>
                  </div>
            </div>   
        </div>

        <div id="shop_review" class="cont">
        	<div id="review_view">
        	<!-- �г��� �ø� ��������� -->
        	<div class="container" style="margin-top: 100px">
		<div class="card shadow">
			<div class="card-body">
				<table class="table table-hover" id=shopreply_list>
					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">ȸ���г���</th>
							<th class="text-center d-none d-md-table-cell">ȸ��������</th>
							<th class="text-center d-none d-md-table-cell">��۳���</th>
							<th class="text-center d-none d-md-table-cell">��۵����</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var='obj' items="${shopreply_list }" varStatus="status">
							<tr>
								<td class="text-center d-none d-md-table-cell" id="id">${obj.member_nickname }</td>
								<td class="text-center d-none d-md-table-cell" id="id">${obj.member_profile }</td>
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

        <div id="shop_map_contact" class="cont">
            <div id="map_content">
            <p style="font:30px bold">���ô±�</p> 
            <div id="map" oninput=resizeMap() style="width: 120%; height: 120%;">${readShopBean.map }</div> 
            
            </div>
        </div>
        </div>
  </div>
<script>
    const tabList = document.querySelectorAll('.shop_tab_menu .list li');
    const contents = document.querySelectorAll('.cont')
    let activeCont =""; // ���� Ȱ��ȭ �� ������ (�⺻:#tab1 Ȱ��ȭ)
     /* var map=document.getElementById("map"); */
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
        // display: block �� �� �� ��,
        window.setTimeout(function() {
         /* map.relayout(); */
     }, 0);
      });
    }
  </script> 
</body>
</html>