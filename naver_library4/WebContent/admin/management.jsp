<%@page import="pack.admin.UserBean"%>
<%@page import="pack.admin.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bookMgr" class="pack.admin.BookMgr"/>
<jsp:useBean id="userMgr" class="pack.admin.UserMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function bookDelete(bid){
	if(confirm("정말 삭제할까요?")){
		document.bookDelete_frm.bid.value = bid;
		document.bookDelete_frm.submit();		
	}
}
</script>
</head>
<body>
	<div id="book">
		<h2>도서관리</h2>
		<br>
		<a href="book_insert.jsp">도서 등록</a>
		<table border="1">
			<tr>
				<th>도서 번호</th>
				<th>도서명</th>
				<th>저자</th>
				<th>출판사</th>
				<th>도서 장르</th>
				<th>상세보기</th>
				<th>도서수정 or 도서삭제</th>
			</tr>
			<%
				ArrayList<BookBean> blist = bookMgr.getBookAll();
				for (BookBean b : blist) {
			%>
			<tr>
				<td><%=b.getBid()%></td>
				<td><%=b.getBname()%></td>
				<td><%=b.getBauthor()%></td>
				<td><%=b.getBcompany()%></td>
				<td><%=b.getBjang()%></td>
				<td><a href="book_detail.jsp?bid=<%=b.getBid()%>">자세히</a></td>
				<td><a href="book_update.jsp?bid=<%=b.getBid()%>">수정</a>/ 
						<a href="javascript:bookDelete('<%=b.getBid()%>')">삭제</a>
						</td>
			</tr>
			<%
				}
			%>
		</table>
		<form action="proc.jsp?flag=delete" name="bookDelete_frm"
			method="post">
			<input type="hidden" name="bid">
		</form>
	</div>
	<div>
		<h2>회원관리</h2>
		<table border="1">
			<tr>
				<th>고객 번호</th>
				<th>고객명</th>
				<th>암호</th>
				<th>미사용 포인트</th>
				<th>미사용 쿠폰</th>
				<th>총 대여권수</th>

			</tr>
			<%
				ArrayList<UserBean> ulist = userMgr.getUserAll();
				for (UserBean u : ulist) {
			%>
			<tr>
				<td><%=u.getNo()%></td>
				<td><%=u.getId()%></td>
				<td><%=u.getPswd()%></td>
				<td><%=u.getPoint()%></td>
				<td><%=u.getCoupon()%></td>
				<td><%=u.getSumbook()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>