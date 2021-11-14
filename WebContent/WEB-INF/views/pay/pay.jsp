<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/shop_Style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">
    <style>
        #card:hover{
            background-color: blanchedalmond;
        }
        #pay_name{
            display: block;
        }
        #pay_option{
            display: inline-block;
        }
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
            margin-top: 5%;
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
            font-family:"�������";
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
            font-family:"�������";
            color: rgba(112, 109, 109, 0.925);
            font-size: 20px;
            cursor: pointer;
        }
        #pay_cancel:hover{
         background-color: rgb(219, 218, 204);
    }
       
    </style>
</head>
<body>
    
    <h2>���� ����</h2>
    <hr id="hr_line">
                <div id="pay_option">
                    <h3>���� ���</h3>
                    <button id="card">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16">
                    <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"/>
                    <path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"/>
                  </svg>
                  <span id="pay_name">�ſ�ī��</span></button>

                <button id="money">
                <img src="image/money-svgrepo-com.svg" width="30" height="30">
                <span id="pay_name">�������Ա�</span></button>

               <button id="kakao">
                      <img src="image/īī������_CI_combination.svg" width="30" height="30">
                      <span id="pay_name">īī�� ����</span>
                  </button> 
                </div>
             <hr id="hr_line_02">


       <div id="pay_div_01">   
                <div id="pay_div_h4">
                    <h4>�� �����ݾ�</h4></div>  

                <div id="pay_div_02">
                    <div id="pay_table_tr_02">
                        ����ݾ�&ensp;&nbsp;&emsp;&emsp;
                        <input type="text" id="reserve_pay" size="10" dir="rtl" value="10000" readonly>��
                    </div>     
                     
                    
                    <div id="pay_table_tr_02">�� �ο���&ensp;&emsp;&emsp;
                        <input type="text" id="people" size="10" dir="rtl" value="2" readonly>��
                        </div>
                    
                    <div id="pay_table_tr_02" style="margin-top: 5%;">
                        <span style="font-weight: bold;">���� �����ݾ�</span>&nbsp;
                        <input type="text" id="pay_text" size="10" dir="rtl" readonly>��
                        
                        </div>
                 </div>
</div>
    <hr id="hr_line_02">
    <input type="submit" id="pay_cancel" value="���" onclick="click()">
    <input type="submit" id="pay_cl" value="����" onclick="click()">
</body>
</html>