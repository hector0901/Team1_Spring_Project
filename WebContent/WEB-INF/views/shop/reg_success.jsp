<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />

<script type="text/javascript">
   var shop_name = "<c:out value='${RegShopBean.shop_name }'/>";
   var category_no = "<c:out value='${RegShopBean.category_no }'/>";
   alert(shop_name + '가게 등록에 성공했습니다..')
   location.href = "${root }shop/main?category_no="+ category_no;
</script>