<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<script type="text/javascript">
   <!-- var shop_no="<c:out value='${RegShopBean.shop_no}'/>"; -->
   alert('댓글 등록이 완료 되었습니다')
    <!--location.href='${root }shop/shop_detail?shop_no=' + shop_no; -->
    window.close(); 
  
</script>