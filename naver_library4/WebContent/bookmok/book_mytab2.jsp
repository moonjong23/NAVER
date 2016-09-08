
<%@page import="pack.business.BookDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"></jsp:useBean>
<jsp:useBean id="bookDto" class="pack.business.BookDto"></jsp:useBean>
<% String id = (String)session.getAttribute("idKey"); %>
<%ArrayList<BookDto> list = (ArrayList)processDao.mytabList(id);%>
<%
int count = processDao.countbook(id);
%>

<!DOCTYPE html> 
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="http://www.naver.com/favicon.ico?1" />
</style>
<meta charset="UTF-8">
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
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>dth, initial-scale=1.0"/>


<title>네이버 도서관</title>

</head> 
<body>
<%@ include file="../home/home_top.jsp" %>


<div id="ajaxx" class="container row">

<br>
<!-- 반납기일 메시지 -->
<div class="collection">
		<a href="#!" class="collection-item active red accent-3">타 이용자를 위해 정해진 기일내에 반납해주세요.</a>
</div>
<div class="collection">
		<a href="#!" class="collection-item active  grey darken-2 white-text">현재 대여중인 도서수 <%=count%>권</a>
</div>

<br>
<c:forEach var="s" items="<%=list%>" varStatus="status">
<!--대여중이 도서 하나-->
<!-- 
  <div class="card-panel blue-grey lighten-5 grey darken-3-text z-depth-1 hoverable col s12 m12 l6" ><b>제목 출력값</b>
		<div class="collection ">
			
	        <a href="#!" class="collection-item " style="color:#616161">대여일 : <b style="color:#ff1744;">대여일 출력값</b> </a>
	        <a href="#!" class="collection-item " style="color:#616161">반납예정일 : <b style="color:#ff1744;">반납예정일 출력값</b> </a>
	        <a href="#!" class="collection-item " style="color:#616161">대여료 : <b style="color:#ff1744;">대여료 출력값</b> </a>
	        <a class="waves-effect waves-green btn collection-item light-green accent-4 white-text"><i class="material-icons right large">swap_vert</i>반납</a>
	    </div>
	</div>
-->

	<div class="card-panel blue-grey lighten-5 grey darken-3-text z-depth-1 hoverable col s12 m12 l6"><b>${status.current.bname}</b>
		<div class="collection ">
	        <a href="#!" class="collection-item " style="color:#616161">대여일 : <b style="color:#ff1744;">${status.current.date}</b></a>
	        <a href="#!" class="collection-item " style="color:#616161">반납예정일 : <b style="color:#ff1744;">${status.current.enddate}</b> </a>
	        <a href="#!" class="collection-item " style="color:#616161">대여료 : <b style="color:#ff1744;">${status.current.price}</b> </a>
	        <a class="waves-effect waves-green btn collection-item light-green accent-4 white-text" onclick="bannap('${status.current.bid}')"><i class="material-icons right large">swap_vert</i>반납</a>
	    </div>
	</div>

	


</c:forEach>
</div><!-- 바디 마지막 디브 -->
 <%@ include file="../home/home_bottom.jsp" %>

<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 메테리얼 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
      <!-- angular -->

	
<!-- 내 자바스크립트 -->	
	<script type="text/javascript" src="../js/bookjs.js"></script>
	<script>
	$(document).ready(function(){
		$('.modal-trigger').leanModal();
		$('.carousel.carousel-slider').carousel({full_width: true});
		 $('.collapsible').collapsible({
		    accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
		  });
		
	});
	
	
	
	</script>
</body>
</html>