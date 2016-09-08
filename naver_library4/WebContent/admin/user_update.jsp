<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
    String no = request.getParameter("no");
    System.out.println("update에서 받은 번호: " + no);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정하기</title>
</head>
<body>
<h2>회원정보 수정하기</h2>
<form action="proc.jsp?flag2=update" name="userupdate_frm" method="post">
	<input type=hidden name="no" value="<%=no %>">
	<table>
		<tr>
			<td>고객명:</td>
			<td><input type="text" name="bname"></td>
		</tr>
		<tr>
			<td>패스워드:</td>
			<td><input type="text" name="bauthor"></td>
		</tr>
		<tr>
			<td>대여한 도서 수:</td>
			<td><input type="text" name="bcompany"></td>
		</tr>
			<tr>
		<td colspan="2">
			<br>
			<input type="submit" value="수정하기">
			<input type="reset" value="새로 입력">
		</td>
	</tr>
	</table>
</form>
	<a href="adminedit.jsp">돌아가기</a>
</body>
</html>