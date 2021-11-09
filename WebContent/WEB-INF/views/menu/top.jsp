<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="menu/css/mainHeader_Style.css">
</head>
<body>

<!-- 헤더 -->
    <nav class="header">
      <ul>
        <li><a href="#">LOGIN</a>
        <ul>
        <li><a href="member/join">JOIN</a></li>
        <li><a href="member/login">로그인</a></li>
      </ul>
      </li>

        <li><a href="#">MORE</a>
          <ul>
            <li><a href="#">sub menu</a></li>
            <li><a href="#">sub menu</a></li>
          </ul>
        </li>

        <li><a href="#">MORE</a>
          <ul>
            <li><a href="#">sub menu</a></li>
            <li><a href="#">sub menu</a></li>
          </ul>
        </li>
        
      </ul>
    </nav>


</body>
</html>