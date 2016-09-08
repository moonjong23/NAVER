<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"></jsp:useBean>
<%
int sum = Integer.parseInt(request.getParameter("sum"));
int count = Integer.parseInt(request.getParameter("count"));
String id = (String)session.getAttribute("idKey");
%>
<%
boolean b = processDao.insertOrder(id);
processDao.pointUpdate(id, sum, count);
%>

<%
if(b){
	%>
	<script>
	alert("결제 완료");
	location.href = "book_index3.jsp";
	</script>
	<%
}else{
	%>
	<script>
	alert("누군가 대여 하셨습니다.");
	location.href = "book_index3.jsp";
	</script>
	<%
}
%>
