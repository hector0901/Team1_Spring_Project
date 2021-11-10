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
</head>
<body>
	

<!-- 게시글 리스트 -->
<div class="container" style="margin-top:100px">
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
					<c:forEach var='obj' items="${memberList }">
					<tr>
						<td class="text-center d-none d-md-table-cell">${obj.member_no }</td>
						<td class="text-center d-none d-md-table-cell">${obj.member_id }</td>
						<td class="text-center d-none d-md-table-cell">${obj.member_profile }</td>
						<td class="text-center d-none d-md-table-cell">${obj.member_nickname }</td>
						<td class="text-center d-none d-md-table-cell">${obj.member_email }</td>
						<td class="text-center d-none d-md-table-cell">${obj.member_tel }</td>
						<td class="text-center d-none d-md-table-cell">${obj.member_rdate }</td>
						
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			</div>
			</div>


</body>
</html>
    