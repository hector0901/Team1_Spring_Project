<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="../menu/css/PageHeader.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">

<style>
@import url('https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap');

nav ul li a  {
   font-family: 'Hi Melody', cursive;
   font-size: 22px;
}
</style>


</head>
<body>

	<!-- 헤더 -->
	<nav class="header">
		<div style="margin-right: 20%; margin-left: -3%;">
			<a href="../"><img src="${root }image/logo_1.png" alt=""
				width="50%" height="50%"></a>
		</div>
		<ul>
			<li class="head_1"><a href="#">로그인</a>
				<ul>

					<c:choose>
						<c:when test="${loginBean2.adminLogin == true }">
							<!--  관리자 로그인 -->
							<li class="nav-item"><a href="${root }member/list"
								class="nav-link">회원 목록</a></li>
							<li class="nav-item"><a href="${root }admin/logout"
								class="nav-link">관리자 로그아웃</a></li>
						</c:when>
						<c:when test="${loginBean.memberLogin == true }">
							<!--  회원 로그인 -->
							<li class="nav-item"><a href="${root }member/update"
								class="nav-link">내 정보 관리</a></li>
							<li class="nav-item"><a href="${root }member/logout"
								class="nav-link">로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a href="${root }member/login"
								class="nav-link">로그인</a></li>
							<li class="nav-item"><a href="${root }admin/admin_login"
								class="nav-link">관리자 로그인</a></li>
							<li class="nav-item"><a href="${root }member/join"
								class="nav-link">회원가입</a></li>
						</c:otherwise>
					</c:choose>


				</ul></li>


			<li class="head_1"><a href="#">예약 내역</a>
				<ul>
					<c:choose>
                     <c:when test="${loginBean.memberLogin == true }">
                     <li><a href="${root }waiting/waiting_list?member_no=${loginBean.member_no}">웨이팅 조회</a></li>
                     <li><a href="${root }reservation/reservation_list?member_no=${loginBean.member_no}">예약내역 확인</a></li>
				     </c:when>
				     
				     <c:when test="${loginBean2.adminLogin == true }">                   <!--  관리자 로그인 -->
                     <li class="nav-item">
                      <a href="${root }waiting/waiting_list_admin" class="nav-link">웨이팅 리스트</a>
                     </li>
                     <li class="nav-item">
                     <a href="${root }reservation/reservation_list_admin" class="nav-link">예약 리스트</a>
                     </li>
                     </c:when>

					<c:otherwise>
					</c:otherwise>
					
					</c:choose>
				</ul></li>

			<li class="head_1"><a href="#">더보기</a>
			 <ul>
                  <li><a href="${root }about/about">about</a></li>
                  <li>
             <a href="${root }about/about">댓글순 추천</a>
             <ul>
                <li class="child"><a href="${root }shop/recommend_list?category_no=1">주점</a></li>
                <li class="child"><a href="${root }shop/recommend_list?category_no=2">식당</a></li>
                <li class="child"><a href="${root }shop/recommend_list?category_no=3">카페</a></li>
              </ul>
             </li>
               <c:choose>
                  <c:when test="${loginBean.memberLogin == true }">
                  <li><a href="${root }member/delete_page">탈퇴하기</a></li>
               </c:when>
            
            <c:otherwise>
            </c:otherwise>
            </c:choose>
          </ul>
        </li>
        
      </ul>
	</nav>


</body>
</html>