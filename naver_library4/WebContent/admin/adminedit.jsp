<%@page import="pack.admin.UserBean"%>
<%@page import="pack.admin.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String uid = (String)session.getAttribute("adminKey");%>
<jsp:useBean id="bookMgr" class="pack.admin.BookMgr"/>
<jsp:useBean id="userMgr" class="pack.admin.UserMgr"/>
<!DOCTYPE html> 
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="http://www.naver.com/favicon.ico?1" />

<meta charset="UTF-8">
<!-- 구글 아이콘 -->
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 내 css -->	
	<link href="../css/homestyle.css" rel="stylesheet" type="text/css">

<!-- 머티리얼 -->	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<!-- 뷰어 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>


<style>
 .jbMenu {
  margin-right:70px;
  position: fixed;
  bottom: 200;
  right: 0;
  width: 200px;
  background-color: white;
 }
  .jbFixed {
  margin-right:70px;
  position: fixed;
  bottom: 200;
  right: 0;
  width: 200px;
  background-color: white;
  
   }

</style>


<title>네이버 도서관</title>

<script type="text/javascript">
function bookDelete(bid){
	if(confirm("정말 삭제할까요?")){
		document.bookDelete_frm.bid.value = bid;
		document.bookDelete_frm.submit();		
	}
}
</script>

</head> 
<script type="text/javascript">
function bookDelete(bid){
	if(confirm("정말 삭제할까요?")){
		document.bookDelete_frm.bid.value = bid;
		document.bookDelete_frm.submit();		
	}
}
</script>
<body class="container row">




<!-- 반납기일 메시지 -->
<div class="collection">
		<a href="#!" class="collection-item active deep-purple darken-3 white-text">관리자 페이지</a>
		<a href="#!" class="collection-item active grey darken-2 white-text">장애발생시 긴급연락망 ( 에이콘 개발1팀 02-123-4567 연락가능시간 9am-6pm)</a>
		<a href="../home/home_index.jsp" class="collection-item active green accent-4 white-text">돌아가기</a>
</div>


<div class="hide-on-small-only jbMenu">
     <ul class="section table-of-contents">
        <li><a href="#introduction">도서정보 관리</a></li>
        <li><a href="#structure">사용자정보 관리</a></li>
        <li><a href="#initialization">매출 관리</a></li>
      </ul>
</div>


<!-- 도서정보 관리 -->
<article id="introduction" class="section scrollspy">



<div class="collection">
		<a href="#!" class="collection-item active  deep-purple darken-3 white-text">도서정보 관리</a>
</div>

<div class="card-panel grey lighten-4">
<a href="book_insert.jsp">도서 등록</a>
   <table style="color:#1a237e" class="striped">
        <thead>
          <tr>
              <th>도서번호</th>
              <th>도서명</th>
              <th>저자</th>
              <th>출판사</th>
              <th>도서장르</th>
              <th>상세보기</th>
              <th>수정/삭제</th>
          </tr>
        </thead>

        <tbody>
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
        </tbody>
      </table>         
      <form action="proc.jsp?flag=delete" name="bookDelete_frm"
			method="post">
			<input type="hidden" name="bid">
		</form>
</div>
 </article>           

<!-- 사용자정보 관리 -->
<article id="structure" class="section scrollspy">

<div class="collection">
		<a href="#!" class="collection-item active  deep-purple darken-3 white-text">사용자정보 관리</a>
</div>

	<div class="card-panel grey lighten-4">
		<table style="color: #1a237e" class="striped">
			<thead>
				<tr>
					<th>유저등록번호</th>
					<th>id</th>
					<th>password</th>
					<th>미사용 포인트</th>
					<th>미사용 쿠폰</th>
					<th>총 대여권수</th>

				</tr>
			</thead>
			<%
				ArrayList<UserBean> ulist = userMgr.getUserAll();
				for (UserBean u : ulist) {
			%>
			<tbody>
			<tr>
				<td><%=u.getNo()%></td>
				<td><%=u.getId()%></td>
				<td><%=u.getPswd()%></td>
				<td><%=u.getPoint()%></td>
				<td><%=(int)u.getCoupon()%></td>
				<td><%=u.getSumbook()%></td>
				
			</tr>
				<%
					}
				%>

			</tbody>
		</table>
	</div>

</article>


<!-- 매출정보 관리 -->
<article id="initialization" class="section scrollspy">
	<div class="collection">
		<a href="#!" class="collection-item active  deep-purple darken-3 white-text">매출 관리</a>
</div>

<div class="card-panel grey lighten-4">
   <div>그래프</div>       
   <iframe width="100%" height="500" src="chart.jsp"></iframe>
</div>


</article>


<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 메테리얼 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
      <!-- angular -->

	
<!-- 내 자바스크립트 -->	
	<script type="text/javascript" src="../js/bookjs.js"></script>
	<script>
	$(document).ready(function(){
		$('.scrollspy').scrollSpy();
		$('.modal-trigger').leanModal();
		$('.carousel.carousel-slider').carousel({full_width: true});
		 $('.collapsible').collapsible({
		    accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
		  });
		
	});
	
	//스크롤
	
	 var jbOffset = $( '.jbMenu' ).offset();
       $( window ).scroll( function() {
         if ( $( document ).scrollTop() > jbOffset.top ) {
           $( '.jbMenu' ).addClass( 'jbFixed' );
         }
         else {
           $( '.jbMenu' ).removeClass( 'jbFixed' );
         }
      });
	
	
	</script>
</body>
</html>