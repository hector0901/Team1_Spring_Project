<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="../menu/css/PageHeader.css">


</head>
<body>

<!-- 헤더 -->
    <nav class="header">
  <div style="margin-right: 20% ;margin-left: -3%;">   
       <a href="../"><img src="${root }image/logo_1.png" alt="" width="50%" height="50%"></a> </div>
       <ul>
        <li><a href="#">LOGIN</a>
        <ul>
        
        <c:choose>
         <c:when test="${loginBean2.adminLogin == true }">                   <!--  관리자 로그인 -->
          <li class="nav-item">
            <a href="${root }member/list" class="nav-link">회원전체 목록!</a>
          </li>
          <li class="nav-item">
            <a href="${root }admin/logout" class="nav-link">관리자 로그아웃</a>
          </li>
        </c:when>
        <c:when test="${loginBean.memberLogin == true }">                   <!--  회원 로그인 -->
          <li class="nav-item">
            <a href="${root }member/update" class="nav-link">개인정보 수정 및 탈퇴</a>
          </li>
          <li class="nav-item">
            <a href="${root }member/logout" class="nav-link">회원 로그아웃</a>
          </li>
        </c:when>
        <c:otherwise>
          <li class="nav-item">
            <a href="${root }member/login" class="nav-link">로그인</a>
          </li>
          <li class="nav-item">
            <a href="${root }admin/admin_login" class="nav-link">관리자 로그인</a>
          </li>
          <li class="nav-item">
            <a href="${root }member/join" class="nav-link">회원가입</a>
          </li>
        </c:otherwise>
      </c:choose>

         
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