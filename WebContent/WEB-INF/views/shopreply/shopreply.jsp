<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<form:form action="${root }shopreply/shopreply_pro" method='post'
		modelAttribute="joinShopreplyBean">
		<form:hidden path="member_no" />
		<form:hidden path="shop_no" />
		<div id="shop_review" class="cont">
			<div id="review_view">
				<!-- 닉네임 올린 리뷰들어가야함 -->
				<div id="review_user">
					댓글내용
					<form:textarea path="shop_reply_content" />
				</div>
			</div>
			<button type="submit" id="review_button">등록</button>
		</div>
	</form:form>
</body>
</html>