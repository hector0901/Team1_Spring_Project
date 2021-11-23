<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<title>결제</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/shop_Style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">
    <style>
              #hr_line{
            border: 0%;
            width: 95%; 
            height: 2px;
            background: black;
            
        }
        #hr_line_02{
            border: 0%;
            width: 95%; 
            height: 0.3px;
            background: black;
            margin-top: 20%;
        }
        #card:target{
            background-color: blue;
        }
        #pay_table_td_01{
            float: left;
        }
        #pay_div_01,#pay_option, h2{
            margin-left: 5%;
        }
        
        #pay_div_02{
            margin-top: -4%;
            margin-left: 30%;
        }
        #pay_cl{
            margin-top: 3%;
            margin-left: 2%;
            padding: 1% 3%;
            background-color: lemonchiffon;
            border-radius: 5px;
            font-family:"맑은고딕";
            border:none;
            color: rgba(112, 109, 109, 0.925);
            font-size: 20px;
            cursor: pointer;
        }
        #pay_cl:hover{
      background-color: rgb(228, 223, 184);
    }
        #pay_cancel{
            margin-top: 3%;
            margin-left: 30%;
            padding: 1% 3%;
            background-color: white;
            border-radius: 5px;
            border: solid 0.3px rgba(112, 109, 109, 0.925);
            font-family:"맑은고딕";
            color: rgba(112, 109, 109, 0.925);
            font-size: 20px;
            cursor: pointer;
        }
        #pay_cancel:hover{
         background-color: rgb(219, 218, 204);
    }
input[type=radio] {
	display:none;
	margin: 10px;
      
}
input[type=radio]+ label {
	display:inline-block;
	padding:8px 19px;
  	cursor: pointer;
  	border: 1px solid black; 
  	width: 110px;
  	text-align: center;
}
input[type=radio]:checked + .c{
  border: 10px solid lemonchiffon;
}
#a{
	float: left;
	margin-left: 1%;
}

    </style>
    <script>
    function payclick(){
	      window.open("${root }reservation/kakaopay?pay_no=1&reservation_person=${reservationBean.reservation_person}&reservation_date=${reservationBean.reservation_date}&reservation_time=${reservationBean.reservation_time}&reservation_add=${reservationBean.reservation_add}&member_no=${reservationBean.member_no}&shop_no=${reservationBean.shop_no}","예약하기","width=500,height=600,left=300");
	      window.close();
	}
    </script>
</head>
<body>
    
    <h2>결제 정보</h2>
    <hr id="hr_line">
                <div id="pay_option">
                      <h3>결제 방법</h3>
                    
                    <div class="pay">
                    <div id="a">       	
                    	<div id="a">
                    	<input type="radio" name="pay_name" value="3" id="ckakao" >
                    	<label for="ckakao" class="c">
                    	<img src="image/카카오페이_CI_combination.svg" width="60" height="60">
                    	<div id="pay_no">카카오 페이</div></label>
                    	</div>	
                    		
                  </div>
                    </div>
             <hr id="hr_line_02">


       <div id="pay_div_01">   
                <div id="pay_div_h4">
                    <h4>총 결제금액</h4></div>  

                    
                    <!-- 예약금액은 10000원 고정, 총인원수랑 최종결제금액 값가져와야함 -->
                    <form>
                    <input type='hidden' name='member_no' id='member_no' value='${reservationBean.member_no }'>
                    <input type='hidden' name='shop_no' id='shop_no' value='${reservationBean.shop_no }'>
                    <input type='hidden' name='reservation_no' id='reservation_no' value='${reservationBean.reservation_no }'>
                    </form>
                <div id="pay_div_02">
                    <div id="pay_table_tr_02">
                        예약금액&ensp;&nbsp;&emsp;&emsp;
                        <input type="number" id="reserve_pay"  dir="rtl" value="10000" readonly>원 
                    </div> 
                  <!--  <form action="kakaopay " method="get"></form>   -->
                <div id="pay_table_tr_02">총 인수&ensp;&emsp;&emsp;&emsp;
                        <input type="number" id="people" name="people"  dir="rtl" value="${reservationBean.reservation_person }" readonly>명
                        </div>
                    
                    <div id="pay_table_tr_02" style="margin-top: 5%;">
                        <span style="font-weight: bold;">최종 결제금액</span>&nbsp;
                        <input type="number" id="pay_text" name="pay_text"  dir="rtl" value="${reservationBean.reservation_person *10000}" readonly>원
                    </div>
                    
                  <!--   <div id="pay_table_tr_02" style="margin-top: 5%;">
                        <span style="font-weight: bold;">데이트</span>&nbsp;
                        <input type="text" id="date" name="date" size="10" dir="rtl" readonly>${reservationBean.reservation_date}
                    </div>
                    
                    <div id="pay_table_tr_02" style="margin-top: 5%;">
                        <span style="font-weight: bold;">time</span>&nbsp;
                        <input type="text" id="time" name="time" size="10" dir="rtl" readonly>${reservationBean.reservation_time}
                    </div>
                    
                    <div id="pay_table_tr_02" style="margin-top: 5%;">
                        <span style="font-weight: bold;">add</span>&nbsp;
                        <input type="text" id="add" name="add" size="10" dir="rtl" readonly>${reservationBean.reservation_add}
                    </div>-->
                    
                 </div>
                 
</div>
    <hr id="hr_line_02" style="margin-top: 5%;">
    <input type="button" id="pay_cancel" value="취소" onclick="window.close()">
    <input type="submit" id="pay_cl" value="결제" onclick="payclick()">
    
</body>
</html>