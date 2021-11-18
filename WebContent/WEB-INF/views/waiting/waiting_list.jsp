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
							<th class="text-center d-none d-md-table-cell">웨이팅번호</th>
							<th class="text-center d-none d-md-table-cell">가게명</th>
							<th class="text-center d-none d-md-table-cell">인원</th>
							<th class="text-center d-none d-md-table-cell">웨이팅시간</th>
							<th class="text-center d-none d-md-table-cell">웨이팅취소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var='obj' items="${waiting_list }" varStatus="status">
							<tr>
								<td class="text-center d-none d-md-table-cell" id="id">${obj.waiting_no }</td>
								<td class="text-center d-none d-md-table-cell" id="id">${obj.shop_name }</td>
								<td class="text-center d-none d-md-table-cell" id="id">${obj.waiting_count }</td>
								<td class="text-center d-none d-md-table-cell" id="id">${obj.waiting_rdate }</td>
								<td><a
									href="${root }waiting/waiting_delete?member_no=${loginBean.member_no}&waiting_no=${obj.waiting_no}">취소</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="d-none d-md-block">
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${pageBean.prevPage <= 0 }">
								<li class="page-item active"><a
									href="${root }waiting/waiting_list?page=${pageBean.prevPage}&member_no=${member_no}"
									class="page-link">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="${root }waiting/waiting_list?page=${pageBean.prevPage}&member_no=${member_no}"
									class="page-link">이전</a></li>
							</c:otherwise>
						</c:choose>


						<c:forEach var='idx' begin="${pageBean.min }"
							end='${pageBean.max }'>
							<c:choose>
								<c:when test="${idx == pageBean.currentPage }">
									<li class="page-item active"><a
										href="${root }waiting/waiting_list?page=${idx}&member_no=${member_no}"
										class="page-link">${idx }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a
										href="${root }waiting/waiting_list?page=${idx}&member_no=${member_no}"
										class="page-link">${idx }</a></li>
								</c:otherwise>
							</c:choose>

						</c:forEach>

						<c:choose>
							<c:when test="${pageBean.max >= pageBean.pageCnt }">
								<li class="page-item active"><a
									href="${root }waiting/waiting_list?page=${pageBean.nextPage}&member_no=${member_no}"
									class="page-link">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="${root }waiting/waiting_list?page=${pageBean.nextPage}&member_no=${member_no}"
									class="page-link">다음</a></li>
							</c:otherwise>
						</c:choose>

					</ul>

				</div>
			</div>
		</div>
</body>
</html>
