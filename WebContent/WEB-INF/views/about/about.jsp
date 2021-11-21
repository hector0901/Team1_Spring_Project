<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

  <script src="https://use.fontawesome.com/releases/v5.10.2/js/all.js"></script>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <style>

  @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

    section {
      height: 500px;
    }

    .about {
      background-color: white;
      width: 1200px;
      height: 300px;
      margin: auto;
      text-align: center;
      opacity: 0.7;
      margin-top: 100px;
      border-top: 2px dotted gainsboro;
      border-bottom: 2px dotted gainsboro;

    }

    footer {
      height: 200px;
      margin-top: 15%;
      height: 60px;
      background-color: lemonchiffon
    }

    .icon {
      margin-left: 20px;
    }

    * {
      margin: 0;
      padding: 0;
    }

    #wrapper {
      width: 1080px;
      margin: 50px auto;
    }

    .image-container {
      width: 220px;
      height: 220px;
      position: relative;
      cursor: pointer;
      overflow: hidden;
      float: left;
      margin: 20px;
    }

    .image-container img {
      width: 100%;
      height: 100%;
      position: absolute;
    }

    .image-container .image-caption {
      width: 100%;
      height: 100%;
      position: absolute;
      background: rgba(0, 0, 0, 0.6);
      font-family: 'Jua', sans-serif;
      text-align: center;
    }

    .image-caption h1 {
      margin-top: 13px;
      color: #fff;
    }

    .image-caption p {
      color: #fff;
    }

    /* bottom slider */

    .image-container .caption-3 {
      bottom: -170px;
      transition: all 0.5s;
    }

    .image-container:hover .caption-3 {
      bottom: 0;
      transition: all 0.5s;
    }

    .info {
      line-height: 150%;
    }

    .point {
      color: yellow;
    }
</style>

</head>
<body>
<c:import url="/WEB-INF/views/menu/page_top.jsp"/>

<section>


    <div class="about">
      <br>
      <h1>ABOUT</h1>
      <br>
      <br>
      <p style="line-height: 300%;">"파인핫플"은 주위의 다양한 핫플레이스의 위치 정보 및 
        인기도를 한눈에 파악할 수 있는 서비스를 제공합니다.<br>
        또한 본 페이지에서는 핫플레이스의 웨이팅 및 예약까지 가능한 서비스를 제공합니다.
        <br>
        주점, 카페, 식당의 카테고리로 분류하여 원하는 가게를 더욱더 찾기 쉽게 구성되어 있으므로,
        가고자 하는 가게를 해당 카테고리에서 찾아 보실 수 있습니다.
      </p>


    </div>
    <div id="wrapper">
      <div class="image-container">
        <img src="${root }about/image/logo.png" />
        <div class="image-caption caption-3">
          <h1>About Logo</h1>
          <br>
          <p class="info"><span class="point">Find와 HOT Place의 합성어</span><br><br>
            핫플레이스를 한눈에 <br>
            찾기 쉽게 도와준다.</p>
        </div>
      </div>

      <div class="image-container ">
         <img src="${root }about/image/contact.png" />
        <div class="image-caption caption-3">
          <h1>Contact Us</h1>
          <br>
          <p class="info">
            <span class="point"> Tel </span> <br>070-4031-1560 <br>
            <span class="point"> Fax</span> <br> 02-111-1111<br>
            <span class="point"> E-mail</span> <br> findhotplace@gmail.com
          </p>
        </div>
      </div>


      <div class="image-container">
             <img src="${root }about/image/location.png" />
        <div class="image-caption caption-3">
          <h1>Location Info</h1>
          <br>
          <p class="info"> <span class="point">서울 종로구 종로12길 15</span><br><br>
            15, Jong-ro 12-gil<br> Jongno-gu, Seoul<br> Republic of Korea
          </p>
        </div>
      </div>

      <div class="image-container">
        <img src="${root }about/image/team.jpg" />
        <div class="image-caption caption-3">
          <h1>About Team</h1>
          <br>
          <p class="info"><span class="point">Leader</span><br>
            Choi sunwoong <br><br>
            <span class="point"> member</span><br> Kim jihyum,
            Park geonwoo<br>
            Choi eungyum,
            Yun yeongki
          </p>
        </div>
      </div>


  </section>



  <footer>

    <div style="text-align: center; padding-top: 20px;">

      <span style="opacity: 0.5;">© Copyright</span>
      <span class="icon"><i class="fab fa-instagram"></i></span>
      <span class="icon"><i class="fab fa-facebook-f"></i></span>
      <span class="icon"><i class="fab fa-youtube"></i></span>
      <span class="icon"><i class="fab fa-google"></i></span>
    </div>
  </footer>


</body>
</html>