<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>

<html lang="en">

<head>

<style>
.filter {
	border: 1px solid lightgray;
	width: 300px;
	height: 500px;
	padding: 10px;
	display: inline;
	float: left;
	margin-right: 30px;
}

li {
	list-style-type: none;
	text-align: left;
}

.btn_date {
	border-bottom: 1px solid lightgray;
	padding-bottom: 20px;
}

.btn_wrap button:nth-child(1) {
	width: 130px;
	height: 40px;
	border: 1px solid gray;
	border-radius: 5px;
	background-color: #fff;
	color: gray;
	cursor: pointer;
}

.btn_wrap button:nth-child(2) {
	width: 130px;
	height: 40px;
	border: 1px solid lemonchiffon;
	border-radius: 5px;
	background: lemonchiffon;
	color: gray;
	cursor: pointer;
}

.btn_wrap {
	margin-left: 12px;
}

#reserve {
	margin-left: -30px;
}

#menu-type {
	margin-left: -30px;
	margin-bottom: 15px;
}

.option {
	display: inline;
	float: left;
}

body {
	padding: 0;
	margin: 0;
}

#all {
	margin-left: 20%;
	padding-top: 12%;
}

h3 {
	margin-left: 10px;
}

[type="date"] {
	background: #fff
		url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)
		97% 50% no-repeat;
}

[type="date"]::-webkit-inner-spin-button {
	display: none;
}

[type="date"]::-webkit-calendar-picker-indicator {
	opacity: 0;
}

/* custom styles */
[type="date"] {
	border: 1px solid #c4c4c4;
	border-radius: 5px;
	background-color: #fff;
	padding: 3px 5px;
	box-shadow: inset 0 3px 6px rgba(0, 0, 0, 0.1);
	width: 190px;
	color: gray;
}

/*헤더 css*/
nav {
	top: 0;
	width: 100%;
	height: 15%;
	position: relative;
	display: flex; /* flex 컨테이너 형태*/
	justify-content: center;
	align-items: center;
	/* margin-left: -15%; */
	margin-bottom: 5%;
	box-sizing: border-box;
}

.nav05 {
	z-index: 1;
}

/* 틀 */
nav ul {
	position: relative;
	margin: 0%;
	padding: 0%;
	list-style: none;
}

nav ul::after { /*::after: 요소의 컨텐츠 끝부분에  생성된 컨텐츠 추가*/
	display: block;
	clear: both; /*글자 사진옆에 붙지 않도록*/
	content: ''; /*content : 선택한 요소의 내용 앞이나 뒤에 콘텐트를 붙임*/
}

nav ul li {
	position: relative;
	float: left;
	/* border: 2px solid white; */
}

nav ul li:not(:first-child) {
	border-left: none;
}

nav ul li:hover {
	background-color: lemonchiffon;
}

nav ul li a {
	display: inline-block;
	padding: 1em 2em;
	color: rgba(163, 156, 156, 0.925);
	font: 400 22px/1 'Lato', sans-serif;
	text-align: center;
	text-decoration: none;
	white-space: nowrap;
	/*공백처리,nowrap : https://www.codingfactory.net/10597*/
}

nav ul ul {
	position: absolute;
	top: 100%;
	text-align: center;
	width: 100%;
}

nav ul ul li {
	float: none;
	margin: 0;
}

nav ul ul li:not(:first-child) {
	border: 2px solid white;
	border-top: none;
}
/* 메뉴3 */
nav ul ul ul {
	position: absolute;
	top: -2px;
	left: 100%;
}

/* 효과  */
.nav05 ul li {
	perspective: 300px;
	/*원근감 차이 조정 : https://gahyun-web-diary.tistory.com/80*/
}

.nav05 ul ul {
	visibility: hidden;
	opacity: 0;
	transition: .3s ease-in-out;
	transform: rotateX(-90deg) rotateY(0);
	transform-origin: 0 0;
}

.nav05 ul ul li {
	perspective: 1500px;
}

.nav05 ul ul ul {
	transform: rotateX(0) rotateY(-90deg);
}

.nav05 ul li:hover>ul {
	visibility: visible;
	opacity: 1;
	transform: rotateX(0) rotateY(0);
}
</style>




<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.10.2/js/all.js"></script>


<script>
  function minus(){
    var n=document.getElementById("number");
    var tmp = parseInt(n.innerText);

    tmp--;
    if(tmp < 0){
        tmp = 0;
    }
    n.innerText = tmp;
  }

  function plus(){
    var n=document.getElementById("number");
    var tmp = parseInt(n.innerText);

    tmp++;
    n.innerText = tmp;
  }

  function reset(){
    var reserve=document.getElementById("reserve");
    var menuname=document.getElementsByName("menuname");
    var date=document.getElementById("date");  
    var number=document.getElementById("number");
    
    reserve.checked=false;
    
    for(var i=0;i<menuname.length;i++){
        menuname[i].checked=false;
    }

    date.value='yyyy-MM-dd';

    number.innerHTML=0;
  }

  </script>

</head>

<body>

	<!-- 헤더 -->
	<nav class="nav05">
		<div style="margin-right: 40%; margin-left: -3%;">
			<a href=""> <img src="C:/Users/wlgus/Desktop/사진/LOGO.png" alt=""
				width="50%" height="50%"></a>
		</div>
		<ul>
			<li><a href="#">로그인</a>
				<ul>
					<li><a href="#">sub nav</a></li>
					<li><a href="#">sub nav</a></li>
				</ul></li>

			<li><a href="#">더보기</a>
				<ul>
					<li><a href="#">sub nav</a></li>
					<li><a href="#">sub nav</a></li>
				</ul></li>

			<li><a href="#">더보기</a>
				<ul>
					<li><a href="#">sub nav</a></li>
					<li><a href="#">sub nav</a></li>
				</ul></li>

		</ul>
	</nav>

	<div id="all">
		<div class="filter" style="margin-left: 100px;">
			<section class="date_wrap">
				<h3>날짜</h3>
				<div class="btn_date">
					<input type="date" id="date" style="margin-left: 16%;">
				</div>
			</section>

			<h3>상세조건</h3>
			<div class="btn_wrap">
				<button onclick="reset()" style="font-size: 16px;">초기화</button>
				<button type="submit" style="font-size: 16px;">적용</button>
			</div>
			<br>
			<section>
				<ul>
					<li><label><input type="checkbox" id="reserve">예약가능</label>
					</li>
				</ul>
			</section>
			<section>
				<h3>
					<strong>메뉴</strong>
				</h3>
				<ul>
					<li><label><input type="checkbox" id="menu-type"
							name="menuname">한식</label></li>
					<li><label><input type="checkbox" id="menu-type"
							name="menuname">중식</label></li>
					<li><label><input type="checkbox" id="menu-type"
							name="menuname">양식</label></li>
				</ul>
			</section>
			<section>
				<input type="hidden" name="persons"><span
					style="font-weight: bold; font-size: 19px; margin-left: 10px;">인원</span>
				<span data-min="2" data-max="99" data-def="2">
					<button type="button" id="minus-button" onclick="minus()"
						style="background-color: white; color: gray; border: none; font-size: 27px; cursor: pointer;">&emsp;&emsp;&emsp;-</button>
					<p id="number"
						style="color: limegreen; display: inline-block; font-size: 18px; font-weight: bold; padding-left: 2em;">1</p>
					<button type="button" id="plus-button" onclick="plus()"
						style="background-color: white; color: gray; border: none; font-size: 20px; cursor: pointer;">&emsp;&emsp;+</button>
				</span>
			</section>
		</div>


		<div class="option">
			<button type="button" onclick="location.href='${root }shop/reg?admin_no=${admin_no }&category_no=${category_no }'">가게
				등록</button>
			<li><a href="C:/Users/ayngi/OneDrive/바탕 화면/프로젝트 통합/프로젝트2.html"><input
					type="image" src="C:/Users/ayngi/OneDrive/바탕 화면/프로잭트2/2.png"
					; width=600; height=220;></a></li>
			<li><a href="C:/Users/ayngi/OneDrive/바탕 화면/프로젝트 통합/가게2.html"><input
					type="image" src="C:/Users/ayngi/OneDrive/바탕 화면/프로잭트2/3.png"
					; width=600; height=220;></a></li>
			<li><a href="C:/Users/ayngi/OneDrive/바탕 화면/프로젝트 통합/가게3.html">
					<input type="image" src="C:/Users/ayngi/OneDrive/바탕 화면/프로잭트2/1.png"
					; width=600; height=220;>
			</a></li>
		</div>
	</div>


</body>

</html>