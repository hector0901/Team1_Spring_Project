<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>??????</title>
<link rel="stylesheet" type="text/css" href="css/shop_Style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">
 <style>
 .waiting_number{
            padding: 5%;
        }
        .waiting_num{
            display: block;
            text-align: center;
            font: 5em bold black;
        }
        #waiting_button{
            padding: 2% 5%;
            text-align: center;
            background-color: lemonchiffon;
            border-radius: 5px;
            font-family:"????????";
            border:none;
            color: rgba(112, 109, 109, 0.925);
            font-size: 20px;
            cursor: pointer;
        }
        #waiting_button:hover{
            background-color: rgb(228, 223, 184);
            cursor: pointer;
        }
        .waiting_im{
            text-align: center;
            margin-top: 8%;
            margin-bottom: 4%;
        }
        #waiting_people_im{
            margin-top: 5%;
            margin-bottom: 5%;
        }
        #waiting_gu{
            font-size:12px;
            margin-bottom: 3%; 
            list-style-type: none;
        }
       
        

      </style>
      <script>
   function watiting_check(){
       window.close;
   }
      </script>
</head>
<body >

           <div style="margin-left: 40%;">
               <img src="${root }image/logo_1.png" alt="" width="30%" height="30%">
           </div>
              <form>
            <fieldset>
            <legend>?????? ??ȣ</legend>
                <div class="waiting_number">
                    <span class="waiting_num">${cnt + 1}</span>
                </div>
            </fieldset>
        </form>
           
           
           
                <form:form action="${root }waiting/waiting_pro" method='post' modelAttribute="joinWaitingBean">
                <form:hidden path="member_no"/>
                <form:hidden path="shop_no"/>
                
                
                    <div class="waiting_im">
                         <h1>???? ?ο? ????</h1>
                        <div class="waiting_people">
                                <form:input type="number" path="waiting_count" id="eun_number" style="display: inline-block; font-size: 18px; font-weight: bold; padding-left:2em;" value="1" min="1" max="5"/><br>
                            <span id="waiting_guide">(?ο??? ?ִ? 5???????Է????ּ???)</span>
                        </div>
                        <hr width="80%" style="margin-top:8%; padding-bottom: 2px; background: black;">
                        <ul id="waiting_gu">
                            <li>
                                ??????Ȳ?? ???? ?????ð??? ?????? ?? ?ֽ??ϴ?.
                            </li>
                            <li>
                                ?????湮?? ???????? ???? ?ٸ??????Ե??? ???? ?????? ???? ??Ź?帳?ϴ?.
                            </li>
                            <li>
                                ȣ???? ?????Ұ??Ѱ??? ?????????? ???? ?????ϰų? ???? ó???? ?? ?ִ? ??
                                ???? ??Ź?帳?ϴ?.
                            </li>
                        </ul> 
                        <input type="submit" id="waiting_button" value="Ȯ??" onclick="watiting_check()">
                    </div>
                    </form:form>
                   
                    
</body>
</html>
