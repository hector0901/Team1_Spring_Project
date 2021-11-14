<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>    





<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="/resources/js/addressapi.js"></script>

<style>
.title_line {
    text-align: left;
    border-bottom: 1px dashed lightgray;
    width: 1000px;
    margin: 60px auto;
}

.col-md-6 {
    margin-left: -90px;
}

.col-md-2 control-label {
    margin-bottom: 10xp;
}

.form-group {
    margin-left: 300px;
}


#btn {
    margin: 0px 0px 0px 450px;
}

#confirm {
    margin-right: 10px;
}

label {
    margin-top: 7px;
    width: 100px;
    margin-right: 70px;
}

aside {
    width: 44%;
    float: right;
}

body {
    margin: 0px auto;
    width: 100%;
}

button {
    font-size: 16px;
}

h1 {
    margin-left: 60px;
}

.btn1, .btn2 {
    padding-top : 3px;
    width: 130px;
    height: 40px;
    /*border: 1px solid rgb(242,7,76);*/
    border: 1px solid black;
    border-radius: 5px;
    background-color: #fff;
    color: black;
    cursor: pointer;
}

.btn1 {
    margin-left: -10%;
}

section {
    margin: 0px auto;
    width: 60%;
}

.btn2 {
    margin-left: 3%;
}

.select_img {
    margin-left: 18%;
}

img {
    border-radius: 70%;
    overflow: hidden;
}
</style>

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

<script>
function checkMemberIdExist(){
  
  var member_id = $("#member_id").val()
  
  if(member_id.length == 0){
    alert('아이디를 입력해주세요.')
    return
  }
  
  $.ajax({
    url : '${root}member/checkMemberIdExist/' + member_id,
    type : 'get',
    dataType : 'text',
    success : function(result){
      if(result.trim() == 'true'){
        alert('사용할 수 있는 아이디입니다.')
        $("#idExist").val('true')
      } else {
        alert(member_id + '는(은) 사용할 수 없는 아이디 입니다.')
        $("#idExist").val('false')
      }
    }
  })
}  
  
function resetMemberIdExist(){
  $("#idExist").val('false')
}  

//nameCheck() -> name을 테이블명에 맞게 변경
//member_name -> 테이블명에 맞게 변경
//name -> 테이블명으로 변경

function nameCheck(){
var member_name = $("#member_name").val()
if(member_name.length < 2 || member_name.length > 10) {
  var c=document.getElementById("member_namecheck"); //div아이디
  c.innerHTML=null;
  var a= document.createElement("member_namecheck_txt"); //오류 텍스트
  a.innerHTML = "이름은 2 ~ 10글자 사이로 입력해주세요1.";
  document.getElementById("member_namecheck").appendChild(a);
  return;
}
else{
  var c2=document.getElementById("member_namecheck");
  c2.innerHTML=null;
  var b2=document.getElementById("member_namecheck").removeChild(a);
  return;
}
}



</script>
</head>





<body style="width: 100%;">
<c:import url="/WEB-INF/views/menu/page_top.jsp"/>
<section>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

    <!-- 회원가입 타이틀-->
    <div class="title_line">
        <h1>회원 가입</h1>
    </div>

    <!-- aside 주의사항-->
    <aside>
        * 표시는 필수 입력사항 입니다.
    </aside>

    <br><br><br><br>
    
    <form:form action="${root }member/join_pro" method='post' modelAttribute="joinMemberBean" enctype="multipart/form-data">
       <form:hidden path="idExist"/>
           <div class="form-group">
              <form:label path="member_id" class="col-md-2 control-label">아이디 *</form:label>
              <div class="col-md-6">
                <form:input path="member_id" class='form-control'  onkeypress="resetIdExist()" />
                  <div>
                    <button type="button" class="btn btn-default" onclick='checkMemberIdExist()' style="margin-top: 2%">중복확인</button>
                  </div>
              </div>
              <div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%"  >
                <form:errors path="member_id" style='color:red' />
              </div>
           </div>
           
           <br><br><br><br><br><br>
          
           <div class="form-group">
              <form:label path="member_pw" class="col-md-2 control-label">비밀번호 *</form:label>
              <div class="col-md-6">
                <form:password path="member_pw" class='form-control'/>
              </div>
              <div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%"  >
                <form:errors path="member_pw" style='color:red' />
              </div>
           </div>
           
           <br><br><br><br>
          
          <div class="form-group">
              <form:label path="member_pw2" class="col-md-2 control-label">비밀번호 확인 *</form:label>
              <div class="col-md-6">
                <form:password path="member_pw2" class='form-control'/>
              </div>
              <div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%"  >
                <form:errors path="member_pw2" style='color:red' />
              </div>
           </div>
           
           <br><br><br><br>
           
           <div class="form-group">
              <form:label path="member_name" class="col-md-2 control-label">이름 *</form:label>
              <div class="col-md-6">
                <form:input path="member_name" class='form-control' oninput="nameCheck()"/> <!-- oninput="nameCheck()" : name을 테이블명에 맞게 변경 -->
              </div>
              <div id=member_namecheck oninput="nameCheck()">
              </div>
           </div>

           <br><br><br><br>
           
           <div class="form-group">
              <form:label path="member_social" class="col-md-2 control-label">주민등록번호 *</form:label>
              <div class="col-md-6">
                <form:input path="member_social" class='form-control' placeholder="-를 제외한 13자리를 입력해주세요."/>
              </div>
              <div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%"  >
                <form:errors path="member_social" style='color:red' />
              </div>
           </div>
           
           <br><br><br><br>
           
           <div class="form-group">
              <form:label path="member_nickname" class="col-md-2 control-label">닉네임 *</form:label>
              <div class="col-md-6">
                <form:input path="member_nickname" class='form-control'/>
              </div>
              <div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%"  >
                <form:errors path="member_nickname" style='color:red' />
              </div>
           </div>

           <br><br><br><br>
           
           <div class="form-group">
              <form:label path="member_tel" class="col-md-2 control-label">전화번호 *</form:label>
              <div class="col-md-6">
                <form:input path="member_tel" class='form-control' placeholder="-를 제외한 전화번호를 입력해주세요."/>
              </div>
              <div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%"  >
                <form:errors path="member_tel" style='color:red' />
              </div>
           </div>
           
           <br><br><br><br>

           <div class="form-group">
              <form:label path="member_email" class="col-md-2 control-label">이메일 *</form:label>
              <div class="col-md-6">
                <form:input path="member_email" class='form-control' />
              </div>
              <div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%"  >
                <form:errors path="member_email" style='color:red' />
              </div>
           </div>
           
           <br><br><br><br>

		      <div class="form-group">
              <form:label path="member_zipcode" class="col-md-2 control-label">우편번호 *</form:label>
              <div class="col-md-6">
                <form:input path="member_zipcode" class='form-control' readonly="true"/>
                <button type="button" class="btn btn-default" onclick="execPostCode();" style="margin-top: 2%"><i class="fa fa-search"></i> 우편번호 찾기
            </button>
              </div>
              <div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%"  >
                <form:errors path="member_zipcode" style='color:red' />
              </div>
           </div>
           
           <br><br><br><br>   
           
           <div class="form-group">
              <form:label path="member_address1" class="col-md-2 control-label">주소 *</form:label>
              <div class="col-md-6">
                <form:input path="member_address1" class='form-control' readonly="true"/>
              </div>
              <div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%"  >
                <form:errors path="member_address1" style='color:red' />
              </div>
           </div>
           
           <br><br><br><br>
           
           <div class="form-group">
              <form:label path="member_address2" class="col-md-2 control-label">상세주소 *</form:label>
              <div class="col-md-6">
                <form:input path="member_address2" class='form-control' />
              </div>
              <div class="col-md-6" style="margin-left: 14.8%; margin-top: 0.3%"  >
                <form:errors path="member_address2" style='color:red' />
              </div>
           </div>
           
           <br><br><br><br>

            <div class="form-group">
              <form:label path="upload_file" class="col-md-2 control-label">프로필 이미지</form:label>
              <div class="col-md-6">
                  <form:input type='file' path='upload_file' class="form-control" accept="image/*"/>
              </div><br><br>
              <div class="select_img"><img src=""/></div>

               <script>
               $("#upload_file").change(function(){
            	   if(this.files && this.files[0]) {
            		   var reader = new FileReader;
            		   reader.onload = function(data) {
            			   $(".select_img img").attr("src", data.target.result).width(250);        
            			   }
            		   reader.readAsDataURL(this.files[0]);
            		   }
            	   });
               </script>
            </div>
           
           <br><br>

           <div id="btn">
             <form:button class='btn1'>회원가입</form:button>&emsp;
              <button type="button" class='btn2' onclick="location.href='../'">취소</button>  
           </div>
    </form:form>
    </section>
    <br><br>
</body>
</html>