<%@page import="pack.business.BookDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String bid = request.getParameter("bid");
String cid = (String)session.getAttribute("idKey");
%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"/>
<%boolean b = processDao.bannap(bid, cid);%>
<%ArrayList<BookDto> list = (ArrayList)processDao.mytabList(cid);%>
<%
int count = processDao.countbook(cid);
%>
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
	<div class="card-panel blue-grey lighten-5 grey darken-3-text z-depth-1 hoverable col s12 m12 l6"><b>${status.current.bname}</b>
		<div class="collection ">
	        <a href="#!" class="collection-item " style="color:#616161">대여일 : <b style="color:#ff1744;">${status.current.date}</b></a>
	        <a href="#!" class="collection-item " style="color:#616161">반납예정일 : <b style="color:#ff1744;">${status.current.enddate}</b> </a>
	        <a href="#!" class="collection-item " style="color:#616161">대여료 : <b style="color:#ff1744;">${status.current.price}</b> </a>
	        <a class="waves-effect waves-green btn collection-item light-green accent-4 white-text" onclick="bannap('${status.current.bid}')"><i class="material-icons right large">swap_vert</i>반납</a>
	    </div>
	</div>
</c:forEach>

