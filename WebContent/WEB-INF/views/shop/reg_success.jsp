<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{ font-size: 26px;}
</style>

<script type="text/javascript">
   var shop_name = "<c:out value='${RegShopBean.shop_name }'/>";
   var category_no = "<c:out value='${RegShopBean.category_no }'/>";
   alert(shop_name + '가게 등록에 성공했습니다..')
   location.href = "${root }shop/shop_list_search_paging?category_no="+ category_no;
</script>

</head>
<body>

<%-- ${RegShopBean.map } --%>

</body>
</html>