<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CDN -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>

<style>
td {
   text-align: center;
		}

#id {
   padding-top: 5.5%;
}

.page-item.active .page-link {
    z-index: 1;
    color: gray;
    background-color: lemonchiffon;
    border-color: lemonchiffon;
}
</style>
<body>
   <c:import url="/WEB-INF/views/menu/page_top.jsp" />

   <!-- 게시글 리스트 -->
   <div class="container" style="margin-top: 100px">
      <div class="card shadow">
         <div class="card-body">
            <table class="table table-hover" id='waiting_list'>
               <thead>
                  <tr>
                     <th class="text-center d-none d-md-table-cell">가게명</th>
                     <th class="text-center d-none d-md-table-cell">예약날짜</th>
                     <th class="text-center d-none d-md-table-cell">예약시간</th>
                     <th class="text-center d-none d-md-table-cell">예약인원</th>
                     <th class="text-center d-none d-md-table-cell">예약등록일</th>                
                     <th class="text-center d-none d-md-table-cell">삭제</th>        
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var='obj' items="${reservation_list }" varStatus="status">
                     <tr>
                        <td class="text-center d-none d-md-table-cell" id="id"><a href="${root }reservation/reservation_read?member_no=${loginBean.member_no}&reservation_no=${obj.reservation_no}">${obj.shop_name }</a></td>
                        <td class="text-center d-none d-md-table-cell" id="id">${obj.reservation_date }</td>
                        <td class="text-center d-none d-md-table-cell" id="id">${obj.reservation_time }</td>
                        <td class="text-center d-none d-md-table-cell" id="id">${obj.reservation_person }</td>
                        <td class="text-center d-none d-md-table-cell" id="id">${obj.reservation_rdate.substring(0, 16)  }</td>
                        <td><a href="${root }reservation/reservation_delete?member_no=${loginBean.member_no}&reservation_no=${obj.reservation_no}">X</a></td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
            
             <div class="d-none d-md-block">
          <ul class="pagination justify-content-center">
            <c:choose>
          <c:when test="${pageBean.prevPage <= 0 }">
          <li class="page-item active">
            <a href="${root }reservation/reservation_list?page=${pageBean.prevPage}&member_no=${member_no}" class="page-link">이전</a>
          </li>
          </c:when>
          <c:otherwise>
          <li class="page-item">
            <a href="${root }reservation/reservation_list?page=${pageBean.prevPage}&member_no=${member_no}" class="page-link">이전</a>
          </li>
          </c:otherwise>
          </c:choose>
          
          
          <c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
          <c:choose>
          <c:when test="${idx == pageBean.currentPage }">
          <li class="page-item active">
            <a href="${root }reservation/reservation_list?page=${idx}&member_no=${member_no}" class="page-link">${idx }</a>
          </li>
          </c:when>
          <c:otherwise>
          <li class="page-item">
            <a href="${root }reservation/reservation_list?page=${idx}&member_no=${member_no}" class="page-link">${idx }</a>
          </li>
          </c:otherwise>
          </c:choose>
          
          </c:forEach>
          
          <c:choose>
          <c:when test="${pageBean.max >= pageBean.pageCnt }">
          <li class="page-item active">
            <a href="${root }reservation/reservation_list?page=${pageBean.nextPage}&member_no=${member_no}" class="page-link">다음</a>
          </li>
          </c:when>
          <c:otherwise>
          <li class="page-item">
            <a href="${root }reservation/reservation_list?page=${pageBean.nextPage}&member_no=${member_no}" class="page-link">다음</a>
          </li>
          </c:otherwise>
          </c:choose>

          </ul>
        </div>

         </div>
      </div>
   </div>


</body>
</html>