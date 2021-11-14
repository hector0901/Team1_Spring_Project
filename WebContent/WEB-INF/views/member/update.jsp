<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.10.2/js/all.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<script>
        $(function () {
            $(":disabled").css("background-color", "white");
        })
    </script>
<script type="text/javascript">
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=member_zipcode]").val(data.zonecode);
           $("[name=member_address1]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
</script>
</head>

<body>
	<!-- 헤더 (메뉴리스트, 로고) -->
	<header class="mypage회원정보수정_header">
		<!-- <form id="form1" runat="server">
            <div class="wrap"> -->
		<div class="mypage회원정보수정_menubar">
			<div class="mypage회원정보수정_menuLogo" style="margin: -30px;">
				<a
					href="file:///C:/Users/ayngi/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/%ED%94%84%EB%A1%9C%EC%9E%AD%ED%8A%B82/project/%EB%A9%94%EC%9D%B8.html">
					<img src="C:/Users/ayngi/OneDrive/바탕 화면/프로잭트2/logo.png" alt=""
					style="margin-left: 150px;">
				</a>
			</div>
			<ul class="mypage회원정보수정_menuItem">
				<li><a href="#"><i class="fas fa-search"></i></a></li>
				<li><a href="#">예약내역</a></li>

				<li><a href="#">더보기</a>
					<ul>
						<li><a href="#" style="padding-bottom: 60px;">공지사항</a></li>
						<li><a href="#" style="padding-bottom: 60px;">이벤트</a></li>
						<li><a href="#" style="padding-bottom: 60px;">Q&A</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- </div>
            </form> -->
	</header>
	<form:form action='${root }member/update_pro' method='post'
		modelAttribute="updateMemberBean">
		<div class="mypage회원정보수정_div" style="margin-top: 10px;">
			<br>
			<br>
			<br>
			<div class="form-group">
				<form:label path="member_id" class="col-md-2 control-label">아이디 *</form:label>
				<div class="col-md-4">
					<form:input path="member_id" type='text' class="form-control"
						required="required" disabled="disabled" />
				</div>
			</div>

			<br>
			<br>

			<div class="form-group">
				<form:label path="member_pw" class="col-md-2 control-label">비밀번호 *</form:label>
				<div class="col-md-4">
					<form:input path="member_pw" type='password' class="form-control"
						required="required" />
				</div>
			</div>

			<br>
			<br>

			<div class="form-group">
				<form:label path="member_pw2" class="col-md-2 control-label">비밀번호 확인 *</form:label>
				<div class="col-md-4">
					<form:input path="member_pw2" type='password' class="form-control"
						required="required" />
				</div>
			</div>

			<br>
			<br>

			<div class="form-group">
				<form:label path="member_name" class="col-md-2 control-label">성명 *</form:label>
				<div class=" col-md-4">
					<form:input path="member_name" type='text' class="form-control"
						required="required" disabled="disabled" />
				</div>
			</div>

			<br>
			<br>

			<div class="form-group">
				<form:label path="member_social" class="col-md-2 control-label">주민등록번호 *</form:label>
				<div class="col-md-4">
					<form:input path="member_social" type='text' class="form-control"
						required="required" disabled="disabled" />
				</div>
			</div>

			<br>
			<br>

			<div class="form-group">
				<form:label path="member_nickname" class="col-md-2 control-label">닉네임 *</form:label>
				<div class="col-md-4">
					<form:input path="member_nickname" type='text' class="form-control"
						required="required" />
				</div>
			</div>

			<br>
			<br>

			<div class="form-group">
				<form:label path="member_tel" class="col-md-2 control-label">연락처 *</form:label>
				<div class="col-md-4">
					<form:input path="member_tel" type='tel' class="form-control"
						required="required" />
				</div>
			</div>

			<br>
			<br>

			<div class="form-group">
				<form:label path="member_email" class="col-md-2 control-label">이메일 *</form:label>
				<div class="col-md-4">
					<form:input path="member_email" type='email' class="form-control"
						required="required" disabled="disabled" />
				</div>
			</div>

			<br>
			<br>
			<!-- 
    <div class="form-group">
        <form:label path="member_zipcode" class="col-md-2 control-label">우편번호 *</form:label>
        <div class="col-md-4">
            <form:input path="member_zipcode" type='text' class="form-control" required="required"/>
        </div>
    </div>

    <br><br>
    
    <div class="form-group">
        <form:label path="member_address1" class="col-md-2 control-label">주소 *</form:label>
        <div class="col-md-4">
            <form:input path="member_address1" type='text' class="form-control" required="required"/>
        </div>
    </div>

    <br><br>
    
    <div class="form-group">
        <form:label path="member_address2" class="col-md-2 control-label">상세주소 *</form:label>
        <div class="col-md-4">
            <form:input path="member_address2" type='text' class="form-control" required="required"/>
        </div>
    </div>-->
			<div class="form-group">
				<form:label path="member_zipcode" class="col-md-2 control-label">우편번호 *</form:label>
				<div class="col-md-6">
					<form:input path="member_zipcode" class='form-control'
						readonly="true" />
					<button type="button" class="btn btn-default"
						onclick="execPostCode();" style="margin-top: 2%">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
				</div>
				<div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%">
					<form:errors path="member_zipcode" style='color:red' />
				</div>
			</div>

			<br>
			<br>
			<br>
			<br>

			<div class="form-group">
				<form:label path="member_address1" class="col-md-2 control-label">주소 *</form:label>
				<div class="col-md-6">
					<form:input path="member_address1" class='form-control'
						readonly="true" />
				</div>
				<div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%">
					<form:errors path="member_address1" style='color:red' />
				</div>
			</div>

			<br>
			<br>
			<br>
			<br>

			<div class="form-group">
				<form:label path="member_address2" class="col-md-2 control-label">상세주소 *</form:label>
				<div class="col-md-6">
					<form:input path="member_address2" class='form-control' />
				</div>
				<div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%">
					<form:errors path="member_address2" style='color:red' />
				</div>
			</div>

			<br>
			<br>
			<br>
			<br> <br>
			<br>

			<div class="form-group">
              <form:label path="upload_file" class="col-md-2 control-label">첨부 이미지 *</form:label>
              <div class="col-md-6">
                  <form:input type='file' path='upload_file' class="form-control" accept="image/*"/>
              </div>
              <div class="select_img"><img src="" /></div>

               <script>
               $("#upload_file").change(function(){
                 if(this.files && this.files[0]) {
                   var reader = new FileReader;
                   reader.onload = function(data) {
                     $(".select_img img").attr("src", data.target.result).width(500);        
                     }
                   reader.readAsDataURL(this.files[0]);
                   }
                 });
               </script>
            </div>

			<br>
			<br>

			<!--  <button type="button" value="우편번호찾기" class="mypage회원정보수정_button" onclick="execPostCode();" style="margin-left: 720px;">우편번호찾기</button><br><br>-->

			<br>
			<br>

			<div style="margin-left: 488px;">
				<form:button class="mypage회원정보수정_button" id="button1"
					style="margin-left: 19%;">수정완료</form:button>
				<form:button type="button" value="취소" class="mypage회원정보수정_button"
					id="button2" onclick="location.href='../'" />
					
			</div>
		</div>
	</form:form>
	<form:form action='${root }member/delete' method='get'
		modelAttribute="deleteMemberBean">
    <a href="${root }member/delete">삭제</a>
	</form:form>
	<br>
	<br>
	<footer class="mypage_footer">
		<!-- <hr> -->
		<ul class="mypage_footer_1">
			<li><i class="fas fa-map-marker-alt"></i> 15, Jong-ro 12-gil,
				Jongno-gu, <br> &nbsp; &nbsp; Seoul, Republic of Korea <br>
				&nbsp; &nbsp;(서울시 종로구 관철동 13-13)</li>
			<li><i class="fas fa-phone-alt"></i> +82-1234-5678</li>
			<li style="color: dodgerblue;"><i class="far fa-envelope"></i>
				abcdhijklmnop@gmail.com</li>
		</ul>
		<ul class="mypage_footer_2">
			<li><span style="font-size: 25px; font-weight: bold;">
					About the company</span> <br> Yesterday. All my troubles seemed so
				far away. <br> Now it looks as though they're here to stay. <br>
				Oh, I believe in yesterday. Suddenly. <br> I'm not half the man
				I used to be. <br> There's a shadow hanging over me. Oh,
				yesterday came</li>
			<hr>
			<li class="mypage_mark"><i class="fab fa-facebook-square"></i></li>
			<li class="mypage_mark"><i class="fab fa-twitter-square"></i></li>
			<li class="mypage_mark"><i class="fab fa-instagram"></i></li>
			<li class="mypage_mark"><i class="fas fa-blog"></i></li>
		</ul>
	</footer>
</body>