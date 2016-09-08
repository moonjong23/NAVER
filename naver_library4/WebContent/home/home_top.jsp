<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

String memid = (String)session.getAttribute("idKey");
String adminid = (String)session.getAttribute("adminKey");
String info = "";
String message="";
String tooltip ="";
if(memid == null && adminid==null){
	info ="disabled  blue-grey lighten-4";

 	message="로그인";
}
else{
	info ="grey darken-3";
	
	message="로그아웃";
	if (adminid!=null){
		message="";
	}
	
}	
%>    
    
  <div class="parallax-container " style="height:250px">
      <div class="parallax"><img src="../img/h5-crop.jpg" class="responsive-img"></div>
   </div>


<nav class ="green accent-4" >
    <div class="nav-wrapper container">
      <a href="../home/home_index.jsp" class="brand-logo">NAVER LIBRARY</a>
      
      <ul id="nav-mobile" class="right hide-on-med-and-down">
      
        <li><a href="#" onclick="window.open('../login/login.jsp','', 'width=500, height=450, top=200, left=300')"><%=message%></a></li>
        <li><a href="#" onclick="window.open('../admin/adminlogin.jsp','', 'width=500, height=450, top=200, left=300')">관리자</a></li>
      </ul>
    </div>
</nav>


<header class="col s12 container">
    
      <ul class="tabs grey darken-4">
      	<li class="tab col s4 grey darken-3"><a target="_self" class="white-text" href="../bookmok/info.jsp">이용안내</a></li>
       
        <li class="tab col s4 grey darken-3"><a target="_self" class="white-text" href="../bookmok/book_index3.jsp">자료검색</a></li>
        <li class="tab col s4 <%=info%>"><a target="_self" href="../bookmok/book_basketList.jsp" class="white-text">장바구니</a></li>
        <li class="tab col s4 <%=info%>"><a target="_self" href="../bookmok/book_mytab2.jsp" class="white-text">내 도서현황</a></li>
        <li class="tab col s4 <%=info%>"><a target="_self" href="../bookmok/payinfo.jsp" class="white-text">결제내역</a></li>
         <li class="tab col s4 grey darken-3"><a target="_self" href="../home/notice.jsp" class="white-text">공지사항</a></li>
      </ul>

  </header>