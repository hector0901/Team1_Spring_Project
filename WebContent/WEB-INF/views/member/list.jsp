<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath }/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
.font{
  font-family: 'Jua', sans-serif;
  margin-left: 19%;
}
td {
  text-align: center;
}

#id {
  padding-top: 5.5%;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: gray;
    cursor: default;
    background-color: lemonchiffon;
    border-color: lemonchiffon;
}

.page-item.active .page-link {
    z-index: 1;
    color: gray;
    background-color: lemonchiffon;
    border-color: lemonchiffon;
}
</style>
<body>
	<c:import url="/WEB-INF/views/menu/page_top.jsp"/>
	<div class="font">
  <h1>회원 목록</h1>
</div>

<!-- 게시글 리스트 -->
<div class="container" style="margin-top:-20px">
	<div class="card shadow">
		<div class="card-body">
			<table class="table table-hover" id='board_list'>
				<thead>
					<tr>
					    <th class="text-center d-none d-md-table-cell">번호</th>
						<th class="text-center d-none d-md-table-cell">아이디</th>
						<th class="text-center d-none d-md-table-cell">사진</th>
						<th class="text-center d-none d-md-table-cell">닉네임</th>
						<th class="text-center d-none d-md-table-cell">이메일</th>
						<th class="text-center d-none d-md-table-cell">연락처</th>
						<th class="text-center d-none d-md-table-cell">가입일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var='obj' items="${memberList }"  varStatus="status" >
					<tr>
						<td class="text-center d-none d-md-table-cell" id="id">${obj.member_no }</td>
						<td class="text-center d-none d-md-table-cell" id="id">${obj.member_id }</td>
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
						<td class="text-center d-none d-md-table-cell" id="id">${obj.member_nickname }</td>
						<td class="text-center d-none d-md-table-cell" id="id">${obj.member_email }</td>
						<td class="text-center d-none d-md-table-cell" id="id">${obj.member_tel }</td>
						<td class="text-center d-none d-md-table-cell" id="id">${obj.member_rdate }</td>		
					  </tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="d-none d-md-block">
          <ul class="pagination justify-content-center">
            <c:choose>
          <c:when test="${pageBean.prevPage <= 0 }">
          <li class="page-item active">
            <a href="${root }member/list?page=${pageBean.prevPage}" class="page-link">이전</a>
          </li>
          </c:when>
          <c:otherwise>
          <li class="page-item">
            <a href="${root }member/list?page=${pageBean.prevPage}" class="page-link">이전</a>
          </li>
          </c:otherwise>
          </c:choose>
          
          
          <c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
          <c:choose>
          <c:when test="${idx == pageBean.currentPage }">
          <li class="page-item active">
            <a href="${root }member/list?page=${idx}" class="page-link">${idx }</a>
          </li>
          </c:when>
          <c:otherwise>
          <li class="page-item">
            <a href="${root }member/list?page=${idx}" class="page-link">${idx }</a>
          </li>
          </c:otherwise>
          </c:choose>
          
          </c:forEach>
          
          <c:choose>
          <c:when test="${pageBean.max >= pageBean.pageCnt }">
          <li class="page-item active">
            <a href="${root }member/list?page=${pageBean.nextPage}" class="page-link">다음</a>
          </li>
          </c:when>
          <c:otherwise>
          <li class="page-item">
            <a href="${root }member/list?page=${pageBean.nextPage}" class="page-link">다음</a>
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
    