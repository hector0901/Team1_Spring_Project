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
</style>
<body>
	<c:import url="/WEB-INF/views/menu/page_top.jsp" />

	<!-- 게시글 리스트 -->
	<div class="container" style="margin-top: 100px">
		<div class="card shadow">
			<div class="card-body">
				<table class="table table-hover" id=shopreply_list>
					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">회원닉네임</th>
							<th class="text-center d-none d-md-table-cell">회원프로필</th>
							<th class="text-center d-none d-md-table-cell">댓글내용</th>
							<th class="text-center d-none d-md-table-cell">댓글등록일</th>
							<th class="text-center d-none d-md-table-cell">댓글삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var='obj' items="${shopreply_list }" varStatus="status">
							<tr>
								<td class="text-center d-none d-md-table-cell" id="id">${obj.member_nickname }</td>
								<td><c:choose>
										<c:when test="${obj.member_profile != null}">
											<!-- 파일이 존재하면 -->
											<img src="${root }upload/${obj.member_profile}"
												style="width: 120px; height: 120px;">
											<!--  -->
										</c:when>
										<c:otherwise>
											<%-- 파일이 없는 경우 기본 이미지 출력 --%>
											<img src='${root }image/none1.png'
												style='width: 150px; height: 150px;'>
										</c:otherwise>
									</c:choose></td>
								<td class="text-center d-none d-md-table-cell" id="id">${obj.shop_reply_content }</td>
								<td class="text-center d-none d-md-table-cell" id="id">${obj.shop_reply_rdate }</td>
								<td><a
									href="${root }shopreply/shopreply_delete?shop_reply_no=${obj.shop_reply_no}">삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="d-none d-md-block">
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${pageBean.prevPage <= 0 }">
								<li class="page-item active"><a
									href="${root }shopreply/shopreply_list?page=${pageBean.prevPage}&shop_no=${shop_no}"
									class="page-link">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="${root }shopreply/shopreply_list?page=${pageBean.prevPage}&shop_no=${shop_no}"
									class="page-link">이전</a></li>
							</c:otherwise>
						</c:choose>


						<c:forEach var='idx' begin="${pageBean.min }"
							end='${pageBean.max }'>
							<c:choose>
								<c:when test="${idx == pageBean.currentPage }">
									<li class="page-item active"><a
										href="${root }shopreply/shopreply_list?page=${idx}&shop_no=${shop_no}"
										class="page-link">${idx }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a
										href="${root }shopreply/shopreply_list?page=${idx}&shop_no=${shop_no}"
										class="page-link">${idx }</a></li>
								</c:otherwise>
							</c:choose>

						</c:forEach>

						<c:choose>
							<c:when test="${pageBean.max >= pageBean.pageCnt }">
								<li class="page-item active"><a
									href="${root }shopreply/shopreply_list?page=${pageBean.nextPage}&shop_no=${shop_no}"
									class="page-link">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="${root }shopreply/shopreply_list?page=${pageBean.nextPage}&shop_no=${shop_no}"
									class="page-link">다음</a></li>
							</c:otherwise>
						</c:choose>

					</ul>

				</div>
				
			</div>
		</div>
	</div>
</body>
</html>
