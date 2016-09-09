<%@page import="pack.admin.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="bookMgr" class="pack.admin.BookMgr"/>
    <%
    String bid = request.getParameter("bid");
    System.out.println("update에서 받은 번호: " + bid);
    
    BookBean bean = bookMgr.getBook(bid);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 수정하기</title>
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 내 css -->	
	<link href="../css/homestyle.css" rel="stylesheet" type="text/css">

<!-- 머티리얼 -->	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<!-- 뷰어 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

</head>
<body class="row container">
<h2>도서 수정하기</h2>
<form action="proc.jsp?flag=update" name="update_frm" enctype="multipart/form-data" method="post">
	<input type=hidden name="bid" value="<%=bid %>">
	<table>
		<tr>
			<td>도서 명:</td>
			<td><input type="text" name="bname" value="<%=bean.getBname() %>"></td>
		</tr>
		<tr>
			<td>저자:</td>
			<td><input type="text" name="bauthor" value="<%=bean.getBauthor() %>"></td>
		</tr>
		<tr>
			<td>출판사:</td>
			<td><input type="text" name="bcompany" value="<%=bean.getBcompany() %>"></td>
		</tr>
		<tr>
			<td>출판국:</td>
			<td><input type="text" name="bguk" value="<%=bean.getBguk() %>"></td>
		</tr>
		<tr>
			<td>출판 년도:</td>
			<td><input type="text" name="byear" value="<%=bean.getByear() %>"></td>
		</tr>
		<tr>
			<td>서가 위치:</td>
			<td><input type="text" name="blocation" value="<%=bean.getBlocation() %>"></td>
		</tr>
		<tr>
			<td>도서 장르:</td>
			<td><input type="text" name="bjang" value="<%=bean.getBjang() %>"></td>
		</tr>
		<tr>
			<td><img src="<%=bean.getBimgsrc() %>"></td>
		</tr>
		<tr>
			<td><input type="file" name="bimgsrc" size="30" ></td>
		</tr>
			<tr>
		<td colspan="2">
			<br>
			<input class="waves-effect waves-light btn" type="submit" value="수정하기">
			<input class="waves-effect waves-light btn" type="reset" value="새로 입력">
		</td>
	</tr>
	</table>
</form>
	<a href="adminedit.jsp">돌아가기</a>
	<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 메테리얼 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
  
</body>
</html>