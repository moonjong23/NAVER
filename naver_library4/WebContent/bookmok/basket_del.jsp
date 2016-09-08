<%@page import="pack.business.OrderDto"%>
<%@page import="pack.business.BookDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"/>
<jsp:useBean id="orderDto" class="pack.business.OrderDto"></jsp:useBean>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String id = (String)session.getAttribute("idKey");
%>
<%orderDto.setCid(id); %>
<%orderDto.setBid((String)request.getParameter("bid")); %>
<%
processDao.basket_del(orderDto);
%>
<%ArrayList<OrderDto> list = (ArrayList)processDao.book_basketList(id);%>

<article class="container row">
<c:set var="sum" value="0"/> <!-- 가격선언 -->
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
	    		</table> 
	    	</div>
	     		<img src="../img/loc.PNG" class="col s3 hide-on-med-and-down" />
    	</div>
   		<div class="modal-footer">
     		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">닫기</a>
   		</div>
  	</div>
  	
  	<!-- 장바구니 제거 모델 modal -->
  	
  	
</div>
<c:set var="sum" value="${sum + status.current.price}"/>

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
        <div class="card-panel blue col s3 center-align waves-orange white-text hoverable z-depth-3" style="height:50px;font-size: 30px;cursor: pointer;" onclick="javascript:pay()">결제</div>
  </div>
</div>