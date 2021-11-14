<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value='${pageContext.request.contextPath}/'/>

<head>
<style>
  #box {
      margin-left: 32%;
      margin-top: 12%;
      border: 1px solid gainsboro;
      background-color: gainsboro;
      width: 600px;
      height: 400px;
  }

  #text {
      font-size: 30px;
  }

  #button-div {
      padding-top: 8%;
  }

  img {
      margin-left: 33%;
  }

  #button {
      width: 150px;
      height: 30px;
      border: none;
  }

  #button:hover {
      background-color: darkgray;
      font-weight: bold;
      border: none;
      cursor: pointer;
  }
  
</style>

</head>
<body>
    <div id="box">
        <img src="${root }menu/image/cry_bear.png" style="width: 200px; height: 200px;">
        <div id="text" style="text-align: center;">탈퇴하시겠습니까?</div>
        <div id="button-div" style="text-align: center;">
        <form:form action='${root }member/delete' method='get' modelAttribute="deleteMemberBean">
       		<button id="button" onclick="location.href='${root }member/delete'">탈퇴하기</button>       		
		</form:form>
		<button type="button" id="button" onclick="location.href='../'">돌아가기</button>
    </div>
    
</body>
</html>