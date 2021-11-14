<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/shop_Style.css">
 <style type="text/css">
   h2{
            text-align: center;
            margin-top: 5%;
        }
   ul{
            list-style-type: none;
        }
[type="date"] {
  background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
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
  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
  width: 190px;
  color: gray;
}

[type="time"] {
  background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/clock.png)  97% 50% no-repeat ;
}
[type="time"]::-webkit-inner-spin-button {
  display: none;
}
[type="time"]::-webkit-calendar-picker-indicator {
  opacity: 0;
}
/* custom styles */
[type="time"] {
  border: 1px solid #c4c4c4;
  border-radius: 5px;
  background-color: #fff;
  padding: 3px 5px;
  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
  width: 190px;
  color: gray;
}
.col-sm-3{
	margin-left:15%;
}
input[type=text]{
	margin-top:-10%;
}
 textarea {
    width: 100%;
    height: 6.25em;
    resize: none;
  }
   #pay{
            margin-left: 30%;
            width: 130px;
            height: 40px;
            background-color: lemonchiffon;
            border-radius: 5px;
            color: rgba(112, 109, 109, 0.925);
            cursor: pointer;
            /*text-align: center;*/
            border-radius: 5px;
            font-family:"맑은고딕";
            border:none;
            font-size: 20px;
        }
        #pay:hover{
            background-color:rgb(228, 223, 184) ;
        }




      </style>
    <script>
     function minus(){
    var n=document.getElementById("eun_number");
    var tmp = parseInt(n.innerText);

    tmp--;
    if(tmp < 1){
        tmp = 1;
    }
    n.innerText = tmp;
   }

   function plus(){
    var n=document.getElementById("eun_number");
    var tmp = parseInt(n.innerText);

    tmp++;
    if(tmp>6){
        tmp=5;
        alert("최대 인원은 5명입니다.");
    }
    n.innerText = tmp;
   }
   function reserveclick(){
	      window.open("${root }pay/pay?reservation_no=1&pay_no=1","예매하기","width=500,height=600,left=300");
	    }
    </script>
</head>
<body >
    <header class="header">
        <ul class="header_ul">
           <div style="margin-left: 38%;">
               <img src="${root }image/logo_1.png" alt="" width="30%" height="30%">
           </div>
        </ul>
    </header>
    
    <form:form action="${root }reservation/reservation_pro" method="post" modelAttribute="reservationBean">
        <h2>예약 정보</h2>
        <div style="margin-left:20%"> 
        <span style="font:7px bold gray; margin-left: 8%;">최선을 다해 준비하겠습니다</span>
        <ul id="time">
            <li>
                날짜 선택&nbsp;&nbsp;<form:input type="date" id="reservation_date" path="reservation_time"/><br>
                						<form:errors path="reservation_time" style='color:red'/>
            </li><br>
            <li>
                시간 선택&nbsp;&nbsp;<form:input type="time" id="reservation" path="reservation_time"/>
                						<form:errors path="reservation_time" style='color:red'/>	
                </li>
                <br><br>
            <li style="border-bottom: gray;">
                인원 선택
                <button type="button" id="minus-button" onclick="minus()" style="background-color: white; color: gray; border: none; font-size: 27px; cursor: pointer;">-</button>
                <p id="eun_number" style=" display: inline-block; font-size: 18px; font-weight: bold; padding-left:2em;">1</p>
                <button type="button" id="plus-button" onclick="plus()" style="background-color: white; color: gray; border: none; font-size: 20px; cursor: pointer;">&emsp;&emsp;+</button>
            (최대 5인까지 가능)</li>
        </ul>
        <form>
            <fieldset>
            <legend>개인정보입력</legend>
            <div style="margin-left:5%;">
        <div class="form-inline form-group" style="width: 70%">
         <label for="name" class="col-sm-2 control-label">이름:</label>
         <div class="col-sm-3"> 
         <input type="text" class="form-control" id="name" readonly="readonly" value="홍길동">
         </div>
        </div>
     
      <div class="form-inline form-group" style="width: 70%">
         <label for="tel" class="col-sm-2 control-label">연락처:</label>
         <div class="col-sm-3">
         <input type="text" class="form-control" id="tel" value="abc@naver.com" readonly="readonly">
         </div>
        </div>
   
      <div class="form-inline form-group" style="width: 70%">
         <label for="email" class="col-sm-2 control-label">이메일:</label>
         <div class="col-sm-3">
         <input type="text" class="form-control" id="email" value="01077323936" readonly="readonly">
         </div>
        </div>
      
        <div class="form-group" style="width: 70%; margin-left: 3%">
    <label for="add">추가사항</label>
    <div class="col-sm-1">
    <textarea class="form-control"id="add" rows="4"></textarea>
    </div>
  </div>
</div>
        <form:button type="submit" id="pay" onclick="check()">결제하기</form:button>
        </fieldset>
        </form>
       </form:form>
        </div>
       <hr style="width: 86%;">
        <div style="font-size: 3px; margin:2%;margin-left: 35%">
            예약시 예약금 인원수*10,000원 결제 되는점 양해부탁드립니다.<br>
            노쇼 방지를 위하여 예약 후 취소는 불가한점 안내드립니다.<br>
            예약취소시 모든 예약금은 소멸되므로 신중한 예약부탁드립니다.
        </div> 
                   
                    
</body>
</html>
