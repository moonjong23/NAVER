<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="pack.business.BoardBean" />
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="boardMgr" class="pack.business.BoardMgr" />
<%
String num = request.getParameter("num");
if(session.getAttribute("adminKey") == null){
%>	
	<script>
	alert("권한이 없습니다.");
	location.href="../board/boardlist.jsp?page=1";
	</script>
<%
}else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<script>
if(confirm("정말 삭제할까요?")){
	alert("aa");
	<%
	boolean b = boardMgr.checkPass(Integer.parseInt(num));  

	if(b){
		boardMgr.delData(num);  
		response.sendRedirect("boardlist.jsp?page=1");		
	} 
	%>
}
<%}%>
</script>
</body>
</html>