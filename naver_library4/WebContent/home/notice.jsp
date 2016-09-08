<%@page import="pack.business.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao" />
<%ArrayList<BoardDto> list = (ArrayList)processDao.selectNotice();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 도서관</title>
<link rel="shortcut icon" type="image/x-icon" href="http://www.naver.com/favicon.ico?1" />
</style>
<meta charset="UTF-8">
<!-- 구글 아이콘 -->
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 내 css -->	
	<link href="../css/homestyle.css" rel="stylesheet" type="text/css">	
<!-- 머티리얼 -->	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<!-- 뷰어 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		
</head>
<body>
<%@ include file="../home/home_top.jsp" %>
<div class="container">
<div class="row">
<table class="col s12 m8 l2">
	<tr>
		<td class="guidefont" style="margin-left:50px; padding-left:14px; width: 95px; text-align: center;">	
			<a href="../home/notice.jsp" class="black-text"><b>공지사항</b></a>
		</td>
		<td class="guidefont" style="text-align: center;">
			<a href="boardwrite.jsp" class="black-text"><b>FAQ</b></a>
		</td>
		<td class="guidefont" style="text-align: center;">	
			<a href="../board/boardlist.jsp?page=1" class="black-text"><b>Q&A</b></a>
		</td>
	</tr>
</table>
<br>
<hr class="black" style="border: solid 1px; width: 1280px; margin-right: 10px;">
</div>	
</div>
<div class="container">
<div class="row">
<div class="col s12 m8 l3"><b style="font-size: 12pt;">새로운 소식을확인하세요.</b></div>
<div class="col s12 m8 l9"><h6 style="font-size: 9pt;" class="grey-text text-lighten-1">
<i class="tiny material-icons" style="height: 15px; vertical-align: bottom;">volume_up</i>라이브러리에서 공지사항을 알려드립니다.</h6></div>
</div>
<div class="row">
<ul class="collapsible col s12 m8 l9 offset-l3" data-collapsible="accordion" style="box-shadow:none; border-left: none; border-right: none;">
<c:forEach var="n" items="<%=list %>" varStatus="status">
    <li>
      <div class="collapsible-header">
      <c:choose><c:when test="${n.num >3 }"><i class="material-icons">announcement</i><b>${n.title }</b><div class="right" style="font-size: 10pt">${n.bdate }</div></div></c:when>
      <c:otherwise>${n.title }<div class="right" style="font-size: 10pt">${n.bdate }</div></div></c:otherwise>
      </c:choose>
      <div class="collapsible-body">
	  <p>
      <c:choose>
      	<c:when test="${n.image != null }">
      		<img src="${n.image }"><br>
      	</c:when>
      </c:choose>
      ${n.cont }
      </p>
      </div>
    </li>
</c:forEach>
  </ul>
</div>
</div>

<%@ include file="../home/home_bottom.jsp" %>

<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 내 자바스크립트 -->	
	<script type="text/javascript" src="../js/bookjs.js"></script>
<!-- 메테리얼 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('.collapsible').collapsible({
      accordion : true
    });
  });
</script>
</body>
</html>