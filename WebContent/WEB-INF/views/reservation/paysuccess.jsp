<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<script type="text/javascript">
   msg = '결제가 완료되었습니다.';
   alert(msg)
   window.close(); 
  
</script>