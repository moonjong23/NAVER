<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"></jsp:useBean>
<jsp:useBean id="orderDto" class="pack.business.OrderDto"></jsp:useBean> 

<%
String id = (String)session.getAttribute("idKey");
orderDto.setCid(id);
%>
<jsp:setProperty property="*" name="orderDto"/>
<%
boolean a = true;
boolean b = processDao.book_basketInsertCheck(id, orderDto.getBid());
if(b == true){
	a = processDao.book_basketInsert(orderDto);
}
%>
  
<%
   
   if(a == true && b == true){
      %>
			<script>
			alert("성공")
			location.href = "book_index3.jsp";
			</script>
			
      <%
   }else{
      %>
      	<script>
      	alert("현재 장바구니에 있는 도서 입니다!");
		location.href = "book_index3.jsp";
      	</script>
      <%
   }
   
%>