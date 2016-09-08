<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="pack.business.BoardMgr" />
<jsp:useBean id="dto" class="pack.business.BoardDto" />
<%
String num = request.getParameter("num");
//String spage = request.getParameter("page");

boardMgr.updateReadcnt(num); //조회수 증가
dto = boardMgr.getDate(num);

String name = dto.getName();
String pass = dto.getPass();
String mail = dto.getMail();
String title = dto.getTitle();
String cont = dto.getCont();
String bip = dto.getBip();
String bdate = dto.getBdate();
int readcnt = dto.getReadcnt();

String apass = "*****"; //일반인은 *이보임
String adminOk = (String)session.getAttribute("adminOk");
if(adminOk != null){
	if(adminOk.equalsIgnoreCase("admin")) apass = pass; //관리자는 비번 보임
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

</head>
<body>
<table class="bordered" style="border-top: solid 1px silver;">
	<tr>
		<td><b>비밀번호:<%=apass %></b></td>
		<td>
			<a href="reply.jsp?num=<%=num %>" class="black-text">
				페이징
			</a>
			<a href="edit.jsp?num=<%=num %>" class="black-text">
				새글
			</a>
			<a href="delete.jsp?num=<%=num %>" class="black-text">
				삭제
			</a>
<%-- 			<a href="boardlist.jsp?page=<%=spage%>">
				목록
			</a> --%>
			
			
		</td>
	</tr>
</table>
<table style="padding: 1px; border:solid 1px silver; box-shadow:1px;" class="bordered">
	<tr>
		<td>
		작성자 : <a href="mailto:<%=mail %>"><%=name %></a> <%-- (ip : <%=bip %>) --%>
		</td>
		<td>작성일 : <%=bdate %></td>
		<td>조회수 : <%=readcnt %></td>
		
	</tr>
	<tr>
		<td colspan="3" style="">제목 : <%=title %></td>
	</tr>
	<tr>
		<td colspan="3">
			<textarea rows="10" style="width: 99%; max-height: 300px; height: 280px; border: none;" readonly="readonly"><%=cont %></textarea>
		</td>
	</tr>
	
	
</table>
</body>
</html>