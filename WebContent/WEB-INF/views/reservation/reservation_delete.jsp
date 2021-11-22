<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>


<c:choose>
  <c:when test="${loginBean2.admin_no != null }">
  <script>
  alert('예약이 취소되었습니다')
  location.href = "${root }reservation/reservation_list_admin"
</script>
  </c:when>
  <c:otherwise>
  <script>
  alert('예약이 취소되었습니다')
  location.href = "${root }reservation/reservation_list?member_no=${loginBean.member_no}"
</script>
  </c:otherwise>
</c:choose>