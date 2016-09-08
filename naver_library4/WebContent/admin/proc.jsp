<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bookMgr" class="pack.admin.BookMgr"/>

<%
String flag = request.getParameter("flag");
boolean result = false;



if(flag.equals("insert")){
	result = bookMgr.InsertBook(request);
}else if(flag.equals("update")){
	result = bookMgr.UpdateBook(request);
}else if(flag.equals("delete")){
	result = bookMgr.DeleteBook(request.getParameter("bid"));
}else{
	response.sendRedirect("adminedit.jsp");
}

if(result){
	%>
		<script>
			alert("정상처리완료");
			location.href="adminedit.jsp";
		</script>
	<%
}else{
	%>
		<script>
			alert("실패");
			location.href="adminedit.jsp";
		</script>
	<%
}
%>