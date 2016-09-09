<%@page import="pack.business.UserDto"%>
<%@page import="pack.admin.UserBean"%>
<%@page import="pack.business.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"></jsp:useBean>
<jsp:useBean id="orderDto" class="pack.business.OrderDto"></jsp:useBean>
<%String id = (String)session.getAttribute("idKey"); %>
<%ArrayList<OrderDto> list = (ArrayList)processDao.book_basketList(id);%>
<%UserBean bean = processDao.getUserAll(id);%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
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
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<script>
	$(document).ready(function(){
		$('.modal-trigger').leanModal();
		
	});
	</script>

<title>네이버 도서관</title>
</head>
<body>
	<%@ include file="../home/home_top.jsp" %>
<div id="aja">
<article class="container row">
<c:set var="sum" value="0"/> <!-- 가격선언 -->
<c:set var="count" value="0"/>
<c:forEach var="s" items="<%=list %>" varStatus="status">


<div class="col s12 m12 l6">
    <div class="card horizontal hoverable light-green lighten-5">
      <div class="card-image">
        <img src="${s.bimgsrc}">
      </div>
      <div class="card-stacked">
        <div class="card-content">
       		<blockquote><b>${s.bname}</b></blockquote>
         		<p><b>저자</b>&nbsp;&nbsp;&nbsp;${s.bauthor}</p>
         		<p><b>출판사</b>&nbsp;&nbsp;&nbsp;${s.bcompany}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>출판연도</b>&nbsp;&nbsp;&nbsp;${s.byear}</p>
         		<c:choose>
					<c:when test="${status.current.state == '1'}">
					<p><b>대여날짜</b>&nbsp;&nbsp;&nbsp;{b.date}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>반납예정일</b>&nbsp;&nbsp;&nbsp;${b.enddate}</p>
					</c:when>
				</c:choose>
        </div>
        <div class="card-action">
        	<a class="waves-effect waves-light modal-trigger" href="#modal1${status.current.bid}">상세정보보기</a>
        	<a class="waves-effect waves-light" href="javascript:del('${status.current.bid}')">장바구니에서 제거</a>
        </div>
      </div>
    </div>
    
    <!-- modal -->
     <div id="modal1${status.current.bid}" class="modal container">
   		<div class="modal-content">
    		<img src="${s.bimgsrc}" class="col s2 hide-on-small-only" />
     
	     	<div class="col s7">
	     		<blockquote><b><h5>${s.bname}</h5></b></blockquote>
	      		<div class="divider"></div>
	   			<table class="bordered highlight striped" > 
	    			<tr><th>저자</th><td>${s.bauthor}</td><th>출판사</th><td>${s.bcompany}</td></tr>
	   				<tr><th>출판국</th><td>${s.bguk}</td><th>출판년도</th><td>${s.byear}</td></tr>
	    			<tr><th>서가위치</th><td>${s.blocation}</td><th>분류</th><td>${s.bjang}</td></tr>
 				<c:choose>
					<c:when test="${status.current.state == '1'}">
						<tr>
						<th>대여날짜</th>
						<td>${b.date}</td>
						<th>반납예정일</th>
						<td>${b.enddate}</td>
						</tr>
					</c:when>
				</c:choose>
	    		</table> 
	    	</div>
	     		<img src="../img/loc.PNG" class="col s3 hide-on-med-and-down" />
    	</div>
   		<div class="modal-footer">
     		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">닫기</a>
   		</div>
  	</div>
  	
  	
</div>
<c:set var="sum" value="${sum + status.current.price}"/>
<c:set var="count" value="${count + 1}"/>

<!-- 장바구니 폼 넘기기 -->

<!-- 
${status.current.bid}<br/>
${status.current.bname}<br/>
${status.index <5}<br/>        
${status.count}<br/>       
${status.first}<br/>           
${status.last}<br/> 
 -->              
</c:forEach>

</article>

<div class="container row">
	
    <div class="valign-wrapper">
    	<div class="card-panel red col s9 center-align waves-orange white-text z-depth-3" style="height:50px;font-size: 30px;"> 결제 금액 : ${sum}원</div>
        <div class="card-panel blue col s3 center-align waves-orange white-text hoverable z-depth-3" style="height:50px;font-size: 30px;cursor: pointer;" onclick="javascript:pay('${sum}','${count}')">결제</div>
  </div>
</div>
</div>
<!-- 
<nav style="width: 70%; margin: auto;" class="col s6 m6 l3">
  <div class="nav-wrapper">
    <a href="" class="brand-logo" style="margin-left: 400px">결제 금액 : ${sum}원</a>
    <ul id="nav-mobile" class="right indigo">
        <li><a href="book_order.jsp" style="width: 200px; text-align: center; font-size: 30px;">결제</a></li>
    </ul>
  </div>
</nav>
 -->
<!-- 
<nav class="container row">
  <div class="nav-wrapper">
    <a href="" class="brand-logo col s9" >결제 금액 : ${sum}원</a>
    <ul id="nav-mobile" class="right indigo col s3">
        <li><a href="book_order.jsp" style="text-align: center; font-size: 30px;">결제</a></li>
    </ul>
  </div>
</nav>
 -->
 

</body>
</html>
