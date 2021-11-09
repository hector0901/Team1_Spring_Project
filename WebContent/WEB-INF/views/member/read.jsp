<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath }/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>우리반 화이팅</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<div class="form-group">
						<label for="member_id">아이디</label>
						<input type="text" id="member_id" name="member_id" class="form-control" value="${readMemberBean.member_id }" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="member_name">이름</label>
						<input type="text" id="member_name" name="member_name" class="form-control" value="${readMemberBean.member_name }" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="member_social">주민등록번호</label>
						<input type="text" id="member_social" name="member_social" class="form-control" value="${readMemberBean.member_social }" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="member_nickname">닉네임</label>
						<textarea id="member_nickname" name="member_nickname" class="form-control" rows="10" style="resize:none" disabled="disabled">${readMemberBean.member_nickname }</textarea>
					</div>
					<div class="form-group">
						<label for="member_tel">연락처</label>
						<textarea id="member_tel" name="member_tel" class="form-control" rows="10" style="resize:none" disabled="disabled">${readMemberBean.member_tel }</textarea>
					</div>
					<div class="form-group">
						<label for="member_email">이메일</label>
						<textarea id="member_email" name="member_email" class="form-control" rows="10" style="resize:none" disabled="disabled">${readMemberBean.member_email }</textarea>
					</div>
					<div class="form-group">
						<label for="member_zipcode">우편번호</label>
						<textarea id="member_zipcode" name="member_zipcode" class="form-control" rows="10" style="resize:none" disabled="disabled">${readMemberBean.member_zipcode }</textarea>
					</div>
					<div class="form-group">
						<label for="member_address1">주소1</label>
						<textarea id="member_address1" name="member_address1" class="form-control" rows="10" style="resize:none" disabled="disabled">${readMemberBean.member_address1 }</textarea>
					</div>
					<div class="form-group">
						<label for="member_address2">주소2</label>
						<textarea id="member_address2" name="member_address2" class="form-control" rows="10" style="resize:none" disabled="disabled">${readMemberBean.member_address2 }</textarea>
					</div>
					<div class="form-group">
						<label for="member_profile">프로필사진</label>
						<textarea id="member_profile" name="member_profile" class="form-control" rows="10" style="resize:none" disabled="disabled">${readMemberBean.member_profile }</textarea>
					</div>
					
					
					<div class="form-group">
						<div class="text-right">
							<a href="${root }member/update" class="nav-link">정보수정</a>
							<a href="${root }member/delete?member_no=${member_no }">삭제</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>


<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>

</body>
</html>
    