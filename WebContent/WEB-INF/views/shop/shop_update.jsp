<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
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
					<form:form action='${root }shop/shop_update_pro?shop_no=${shop_no}' method='post' modelAttribute="updateShopBean" enctype="multipart/form-data">
						<form:hidden path="shop_no"/>
						<form:hidden path="category_no"/>
						<form:hidden path="admin_no"/>
						<div class="form-group">
							<form:label path="shop_simple">한줄평</form:label>
							<form:input path="shop_simple" class='form-control'/>
						</div>
						<div class="form-group">
							<form:label path="shop_content">가게 내용</form:label>
							<form:input path="shop_content" class='form-control'/>
						</div>
						<div class="form-group">
							<form:label path="shop_total_seat">전체자리</form:label>
							<form:input type="number" path="shop_total_seat" class='form-control'/>
						</div>
						<div class="form-group">
							<form:label path="shop_remain_seat">남은자리</form:label>
							<form:input type="number" path="shop_remain_seat" class="form-control" rows="10" style="resize:none"/>
						</div>
						<div class="form-group">
							<form:label path="shop_time">영업시간</form:label>
							<form:input path="shop_time" class="form-control" rows="10" style="resize:none"/>
						</div>
						
						<div class="form-group">
							<div class="text-right">
								<form:button class='btn btn-primary'>수정완료</form:button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>


</body>
</html>
    