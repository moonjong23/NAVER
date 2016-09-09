<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="http://static.naver.com/openapi_map/maps_openapi.css">
<!-- 구글 아이콘 -->
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 내 css -->	
	<link href="../css/homestyle.css" rel="stylesheet" type="text/css">
	<link href="../css/hj.css" rel="stylesheet" type="text/css">
<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 메테리얼 -->
	<link rel="stylesheet" href="../css/materialize.min.css">
	<script src="../js/materialize.min.js"></script>
<!-- 내 자바스크립트 -->	
	<script type="text/javascript" src="../js/bookjs.js"></script>
<!-- 뷰어 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>


<link rel="shortcut icon" type="image/x-icon" href="http://www.naver.com/favicon.ico?1" />

<title>네이버 도서관</title>

</head>
<body>
<%@ include file="../home/home_top.jsp" %>
<article class="container row">
<div class="section">
<h5 class="col s12 l3" style="margin-top:60px">공간구성</h5>
<div class="col s12 l9" style="margin-top:50px">
<img class="responsive-img materialboxed" src="../img/guidemap.png">
</div>
<hr class="grey lighten-4 lane2 col s12 m8 l7 offset-l3">
</div>

<div class="section">
<h5 class="col s12 l3" style="margin-top:80px">이용안내</h5>
<div class="col s12 l8" style="margin-top:50px">
<img class="responsive-img materialboxed" src="../img/info2.JPG">

</div>

</div>


<!-- 지도 -->

<div class="section">
<h5 class="col s12 l3" style="margin-top:80px">오시는길</h5>
<div class="col s12 l9" style="margin-top:50px">
<img class="responsive-img materialboxed" src="../img/info4.JPG">

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3171.283855258068!2d127.10312601520751!3d37.35945984371794!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b5835c92bb553%3A0x930d2dc794fa9066!2z64Sk7J2067KE!5e0!3m2!1sko!2skr!4v1472960284931" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
</div>
</div>




</article>
 <%@ include file="../home/home_bottom.jsp" %>

<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 메테리얼 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
  



	
	
<!-- 내 자바스크립트 -->	
	<script type="text/javascript" src="../js/bookjs.js"></script>
	
</body>
</html>