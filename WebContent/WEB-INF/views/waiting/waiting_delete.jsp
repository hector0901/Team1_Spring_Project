<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<script>
	alert('웨이팅이 취소되었습니다.')
	location.href='${root }waiting/waiting_list?member_no=${loginBean.member_no}'
</script>