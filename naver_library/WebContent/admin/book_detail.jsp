<%@page import="pack.admin.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bookMgr" class="pack.admin.BookMgr"/>
<%
String bid= request.getParameter("bid");
//System.out.println(bid);
BookBean bean = bookMgr.getBook(bid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자세히</title>
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 내 css -->	
	<link href="../css/homestyle.css" rel="stylesheet" type="text/css">

<!-- 머티리얼 -->	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<!-- 뷰어 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

</head>
<body class="container row">
<div class="card-panel grey lighten-4">
<table>
	<tr>
		<td class="center-align">
			<img src="<%=bean.getBimgsrc()%>" width="300" height="100%">
		</td>
		<td style="width:50%; vartical-align:top;">
				<table class="bordered">
					<tr>
						<td>도서 번호: </td>
						<td><%=bean.getBid()%></td>
					</tr>
					<tr>
						<td>도서 명: </td>
						<td><%=bean.getBname()%></td>
					</tr>
					<tr>
						<td>저자: </td>
						<td><%=bean.getBauthor()%></td>
					</tr>
					<tr>
						<td>출판사: </td>
						<td><%=bean.getBcompany()%></td>
					</tr>
					<tr>
						<td>출판국: </td>
						<td><%=bean.getBguk()%></td>
					</tr>
					<tr>
						<td>출판 년도: </td>
						<td><%=bean.getByear()%></td>
					</tr>
					<tr>
						<td>서가 위치: </td>
						<td><%=bean.getBlocation() %></td>
					</tr>
					<tr>
						<td>도서 장르: </td>
						<td><%=bean.getBjang()%></td>
					</tr>
				</table>
			</td>
	</tr>
</table>
</div>
<a href="adminedit.jsp">돌아가기</a>
<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 메테리얼 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
  

</body>
</html>