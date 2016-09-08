
<%@page import="pack.business.UserDto"%>
<%@page import="pack.business.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%String uid = (String)session.getAttribute("idKey");%>
<%
request.setCharacterEncoding("utf-8");
int sum = 0;	//총 구매액으로 사용
int count = 0;	//총 구매 횟수로 사용
int spage = 1;
int pageSu = 1;

processDao.totalList(uid);
pageSu = processDao.getPageSu(); 
try{	//번호 클릭시 페이지 번호 받아오는거
	spage = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){	//기본 페이지 번호는 1
	spage = 1;
}
if(spage <= 0) spage = 1;	//페이지번호를 음수로 넣는 새끼가있을 수 있으니까 1로 처리

ArrayList<OrderDto> list = (ArrayList)processDao.payInfo(uid, spage);

ArrayList<OrderDto> list3 = (ArrayList)processDao.sumbook(uid);

for(OrderDto k : list3){
	sum += Integer.parseInt(k.getPrice());
	count++;
}

processDao.updateSumbook(uid, count);	//총구매 횟수 업데이트

ArrayList<UserDto> list2 =  (ArrayList)processDao.selectPoint(uid);
int couponCount = 0;
int point = 0;
for(UserDto u : list2){
	couponCount = (int)u.getCoupon();
	point = u.getPoint();
}
%>
<!DOCTYPE html> 
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="http://www.naver.com/favicon.ico?1" />
</style>
<meta charset="UTF-8">
<!-- 구글 아이콘 -->
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 내 css -->	
	<link href="../css/homestyle.css" rel="stylesheet" type="text/css">
	<link href="../css/hj.css" rel="stylesheet" type="text/css">
<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 메테리얼 -->
	<link rel="stylesheet" href="../css/materialize.min.css">
	<script src="../js/materialize.min.js"></script>
<!-- 내 자바스크립트 -->	
	<script type="text/javascript" src="../js/bookjs.js"></script>


<title>네이버 도서관</title>
<style>
.modal-content td,.modal-content th {
    padding: 0px 15px;
    display: table-cell;
    text-align: left;
    vertical-align: middle;
    border-radius: 2px;
}
</style>

</head> 
<body>
<%@ include file="../home/home_top.jsp" %>

<div class="container row">

<!-- 총괄 정보 -->

<table style="margin-top:30px;">
	<tr>
		<td class="col s12 m8 l3  teal accent-3 ">
			<ul>
				<li>
				<div style="height:40px">
					
					</div>
					<h5 class=" center-align white-text"><%=uid %>님 환영합니다</h5>
					<hr class="hh">
					<div style="height:20px"></div>
					<h6 class="right grey-text" style="margin-bottom:20px;margin-right:20px">아이디</h6>
				
					
				</li>
			</ul>
		</td>
		<td class="col s12 m8 l3  grey darken-2 white-text">
			<ul>
				<li>
				<div style="height:40px">

					</div>
					<h5 class="categoryf center-align"><%=sum %></h5>
					<hr class="hh">
					<div style="height:20px"></div>
					<h6 class="right grey-text" style="margin-bottom:20px;margin-right:20px">총 결제 내역</h6>
					
				</li>
			</ul>
		</td>
		<td class="col s12 m8 l3  teal accent-3 white-text">
			<ul>
				<li>
				<div style="height:40px">
					
					</div>
					<h5 class="categoryf center-align"><%=point %></h5>
					<hr class="hh">
				<div style="height:20px"></div>
					<h6 class="right grey-text" style="margin-bottom:20px;margin-right:20px">보유포인트</h6>
					
				</li>
			</ul>
		</td>
		<td class="col s12 m8 l3  grey darken-2 white-text">
			<ul>
				<li>
				<div style="height:40px">
					
					</div>
					
					<h5 class="categoryf center-align">쿠폰 <%=couponCount %>개</h5>

					<hr class="hh">
					<div style="height:20px"></div>
					<h6 class="right grey-text" style="margin-bottom:20px;margin-right:20px">보유쿠폰</h6>
					
				</li>
			</ul>
		</td>
	
	</tr>
</table>







<div class="row"><hr class="col s12 m8 l11 undervar1" style=" margin-left:30px"></div>

<!-- 영수증 처리 -->
<br>
  <div class="card-panel blue-grey lighten-5 grey darken-3-text z-depth-1">영수증이 필요하신 경우 [온라인 영수증 출력] 버튼을 클릭해주세요.</div>

<!-- 제목처리 -->
<div class="collection">
		<a href="#!" class="collection-item active grey darken-3 blue-grey lighten-5">결제내역</a>
</div>
<!-- 아작스 내용문처리 -->
 <ul class="collapsible" data-collapsible="accordion">
<c:forEach var="s" items="<%=list %>" varStatus="status">
		   <li>
		     <div class="collapsible-header"><i class="material-icons">filter_drama</i>${status.current.bname}<div class="right">${status.current.date}</div></div>
		     <div class="collapsible-body">
		     <ul class="collapsible" data-collapsible="accordion">
		   <li>
		     <!-- 모달버튼 삽입 -->
		     <div class="collapsible-header  active"><i class="material-icons">shopping_basket</i>주문정보<a style="margin-top:4px;" class="waves-effect waves-light btn red accent-3 blue-grey lighten-5-text right modal-trigger" href="#modal${status.current.no}">온라인영수증</a></div>
		     <div class="collapsible-body">
		     	<table style="margin-left:30px">
		     		<tr><th style="width: 7em;">주문일시</th><td>${status.current.date}</td></tr>
		     		<tr><th>주문도서</th><td>${status.current.bname}</td></tr>
		     		<tr><th>주문금액</th><td>${status.current.price}</td></tr>
		     	</table>
		     
		     </div>
		   </li>
		   <li>
		     <div class="collapsible-header"><i class="material-icons">credit_card</i>결제정보</div>
		     <div class="collapsible-body">
		     	<table style="margin-left:30px">
		     		<tr><th style="width: 7em;">주문금액</th><td></td></tr>
		     		<tr><th>쿠폰</th><td><%=couponCount %>장</td></tr>
		     	    <tr><th>포인트</th><td><%=(sum/10) %></td></tr>
		     	    <tr><th>적립포인트</th><td>${status.current.price / 10}</td></tr>
		     	</table>
		     
		     
		     </div>
		   </li>
		   <li>
		     <div class="collapsible-header"><i class="material-icons">assignment_ind</i>판매자정보</div>
		     <div class="collapsible-body">
		     		<table style="margin-left:30px">
		     		<tr><th style="width: 9em;">사업자등록번호</th><td>220-81-62517</td></tr>
		     		<tr><th>통신판매업 신고번호</th><td>경기성남 제 2006-692호</td></tr>
		     		<tr><th>대표이사</th><td>김상헌</td></tr>
		     	    <tr><th>주소</th><td>경기도 성남시 분당구 정자동 불정로 6 NAVER 그린팩토리</td></tr>
		     	    <tr><th>대표전화</th><td>1588-3830</td></tr>
		     	    <tr><th>FAX</th><td>031-784-1000</td></tr>
		     		</table>
		     
		     </div>
		   </li>
		 </ul>
      
      </div>
    </li>
    
    
     <!-- Modal Structure -->
  <div id="modal${status.current.no}" class="modal modal-fixed-footer" style="width:320px; ">
    <div class="modal-content">
    
    <div class="card-panel grey darken-3 white-text col s12 center-align"> <br><h5>NAVER LIBRARY</h5></h6>&nbsp;&nbsp;</div>
      
     
  
        <h6 class="col s12" >거래장소</h6>
       <div class="col s12" style="border-bottom:2px dotted #424242"></div>
       <table>
       <tr style="margin-top:-30px"><th>사업자등록번호:</th><td>220-81-62517</td></tr>
  	   <tr style="margin-top:-30px"><th>대표이사:</th><td>김효준</td></tr>
  	   <tr style="margin-top:-30px"><th>대표전화:</th><td>1588-3830</td></tr>
  	   <tr style="margin-top:-30px"><th colspan="2">library@navercorp.com</th></tr>
       </table>
       
       <br>
       <h6 class="col s12" >구매물품</h6>
       <div class="col s12" style="border-bottom:2px dotted #424242"></div>
       <table>
       <tr style="margin-top:-30px"><th>상품명:</th><td>${status.current.bname}</td></tr>
  	   <tr style="margin-top:-30px"><th>단가:</th><td>${status.current.price}</td></tr>
  	   <tr style="margin-top:-30px"><th>수량:</th><td>1</td></tr>
  	   <tr style="margin-top:-30px"><th>시간:</th><td>${status.current.date}</td></tr>
  
       </table>
       
         <br>
       <h6 class="col s12" >결제금액</h6>
       <div class="col s12" style="border-bottom:2px dotted #424242"></div>
       <table>
       <tr style="margin-top:-30px"><th>금액:</th><td>${status.current.price}원</td></tr>
  	   <tr style="margin-top:-30px"><th>부가세:</th><td>0원</td></tr>
  	   <tr style="margin-top:-30px"><th>합계:</th><td>${status.current.price}원</td></tr>
  
       </table>
     
    </div>
    <div class="modal-footer">
      <a href="#" class="modal-action modal-close waves-effect waves-green btn-flat ">취소</a>
      <a href="#" class="modal-action  waves-effect waves-green btn-flat "  onclick="alert('프린터연결을 확인해주세요')">출력</a>
    </div>
  </div><!-- 모달끝 -->
  
    
</c:forEach>
  </ul>

<table>
	<tr>
		<td style="text-align: center;">
		<%
			out.print("<ul class='pagination'>");
			if(spage != 1){
			out.print("<li class='waves-effect'><a href='payinfo.jsp?page=" + (spage - 1) + "')><i class='material-icons'>chevron_left</i></a></li>");						
			}else{
				out.print("<li class='waves-effect'><a href='payinfo.jsp?page=" + "1" + "')><i class='material-icons'>chevron_left</i></a></li>");	
			}
		for(int i = 1; i <= pageSu; i++){
			if(i == spage){
			out.print("<li class='active'><a href='#!'>" + i + "</a></li>");						
			}else{
			out.print("<li class='waves-effect'><a href='payinfo.jsp?page=" + i + "'>" + i + "</a></li>");												
			}
		}
		if(spage != pageSu){
			out.print("<li class='waves-effect'><a href='payinfo.jsp?page=" + (spage + 1) + "')><i class='material-icons'>chevron_right</i></a></li>");						
			}else{
				out.print("<li class='waves-effect'><a href='payinfo.jsp?page=" + pageSu + "')><i class='material-icons'>chevron_right</i></a></li>");	
			}
			out.print("</ul>");
		%>
		</td>
	</tr>
</table>

<div>
	<a href="javascript:payinfo('${status.current.bname}','${status.current.price}','${status.current.date}')">
	</a>
</div>

<div id="ajaxyo"></div>
<!-- 아작스 데이터값 제공 -->
<div >

</div>
 <%@ include file="../home/home_bottom.jsp" %>

	<script>
	$(document).ready(function(){
		$('.modal-trigger').leanModal();
		$('.carousel.carousel-slider').carousel({full_width: true});
		 $('.collapsible').collapsible({
		    accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
		  });
		
	});
	</script>
</body>
</html>