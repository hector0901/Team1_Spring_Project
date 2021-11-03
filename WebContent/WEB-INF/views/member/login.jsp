<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <style>
        #login_id,
        #login_pw {
            margin-left: -5px;
        }
        #login_btn,
        #join_btn {
            margin-top: 25px;
            border: 0px;
            width: 388px;
            height: 60px;
            font-size: 20px;
            font-weight: bolder;
            color: white;
            background-color: #f7323f;
            border-radius: 5px;
            cursor: pointer;
        }
        #naver_btn {
            margin-top: 15px;
            border: 0px;
            width: 388px;
            height: 60px;
            font-size: 20px;
            font-weight: bolder;
            color: white;
            background-color: #03c75a;
            border-radius: 5px;
            cursor: pointer;
        }
        #find_id_pw {
            margin-right: 60px;
        }
        #bottom_div {
            margin: 0px;
            text-align: center;
            
        }
        h2 {
            margin-left: -10px;
        }
        input:focus {
            outline: none;
        }
        #main_img {
            margin-top: 65px;
            margin-right: 22px;
            text-align: center;
        }
    </style>
    
    <script>
        // 중복체크
       function double_id_check() {
           
       		var member_id = $("#member_id").val()
       	
		   		if(member_id.length == 0){
		   			alert('아이디를 입력해주세요.')
		   			return
		   		}
       		
       		$.ajax({
    			url : '${root}member/double_id_check/' + member_id,
    			type : 'get',
    			dataType : 'text',
    			success : function(result){
    				if(result.trim() == 'true'){
    					alert(member_id + '는 사용할 수 있는 아이디입니다')
    					$("#idExist").val('true')
    				} else {
    					alert('중복된 아이디가 존재합니다.')
    					$("#idExist").val('false')
    				}
    			}
    		})
       }
        
        window.onload = function () {
            var n = document.getElementById("login_btn");
            var m = document.getElementById("naver_btn");
            n.onmouseover = function() {
                n.style.fontSize = "24px";
            }
            n.onmouseleave = function() {
                n.style.fontSize = "20px";
            }
            m.onmouseover = function() {
                m.style.fontSize = "24px";
            }
            m.onmouseleave = function() {
                m.style.fontSize = "20px";
            }
        }
        
    	function resetUserIdExist(){
    		$("#idExist").val('false')
    	}
        
      function open_find() {
          window.open("C:/Users/Administrator/Desktop/Project/find_id_pw.html", "계정 찾기", "width=460, height=380, left=720, top=370");
      }
</script>

</head>

<body>
    <form>
        <div id="main_img">
            <a href="#"><img src="member/image/top_image.png" ></a>
        </div>
        
        <div style="width: 20.5%; margin: 60px auto;">
            <h2>로그인</h2>

            <span style="float: right;">* 표시는 필수 입력사항 입니다.</span><br><br>

            <!-- ID div -->
            <div class="form-group">
                <label class="col-md-4 control-label" style="margin-left: -20px;">아이디 *</label>
                <div class="col-md-14">
                    <input type='text' class="form-control" id='login_id' value='' required="required"
                        style='width: 100%;' placeholder="아이디를 입력하세요." autofocus="autofocus">
                </div>
            </div>

            <br>

            <!-- PW div -->
            <div class="form-group">
                <label class="col-md-4 control-label" style="margin-left: -20px;">비밀번호 *</label>
                <div class="col-md-14">
                    <input type='password' class="form-control" id='login_pw' value='' required="required"
                        style='width: 100%;' placeholder="비밀번호를 입력하세요.">
                </div>
            </div>

            <!-- 로그인 버튼 div -->
            <div>
                <input type="submit" id="login_btn" onclick="login()" value="로그인">
            </div>

            <!-- 네이버 로그인 버튼 div -->
            <div>
                <a href="https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com"><input
                   type="button" id="naver_btn" value="N 네이버 로그인"></a>
            </div>

            <br>

            <div id="bottom_div">
                <a href=" " id="find_id_pw" style="color: black; text-decoration: none;" onclick="open_find()">계정 찾기</a>
                <span style="color: lightgray; margin-right: 65px;"> | </span>
                <a href="C:/Users/Administrator/Desktop/Project/join.html" id="join" style="color: black; text-decoration: none;">회원가입</a>
            </div>
        </div>
    </form>

</body>

</html>