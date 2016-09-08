<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String bname = request.getParameter("bname");
String price = request.getParameter("price");
String date = request.getParameter("date");
%>

<ul class="collapsible" data-collapsible="accordion">
    <li>
      <div class="collapsible-header  active"><i class="material-icons">shopping_basket</i>주문정보</div>
      <div class="collapsible-body">
      	<table style="margin-left:30px">
      		<tr><th style="width: 7em;">주문일시</th><td><%=date %></td></tr>
      		<tr><th>주문도서</th><td><%=bname %></td></tr>
      		<tr><th>주문금액</th><td><%=price %></td></tr>
      	</table>
      
      </div>
    </li>
    <li>
      <div class="collapsible-header"><i class="material-icons">credit_card</i>결제정보</div>
      <div class="collapsible-body">
      	<table style="margin-left:30px">
      		<tr><th style="width: 7em;">주문금액</th><td><%=price %></td></tr>
      	    <tr><th>적립포인트</th><td><%=Integer.parseInt(price)/10 %></td></tr>
      	</table>
      
      
      </div>
    </li>
    <li>
      <div class="collapsible-header"><i class="material-icons">assignment_ind</i>판매자정보</div>
      <div class="collapsible-body">
      		<table style="margin-left:30px">
      		<tr><th style="width: 9em;">사업자등록번호</th><td>220-81-62517</td></tr>
      		<tr><th>통신판매업 신고번호</th><td>경기성남 제 2006-692호</td></tr>
      		<tr><th>대표이사</th><td>호나우딩요</td></tr>
      	    <tr><th>주소</th><td>경기도 성남시 분당구 정자동 브라질 10 NAVER 옐로팩토리</td></tr>
      	    <tr><th>대표전화</th><td>1588-3830</td></tr>
      	    <tr><th>FAX</th><td>031-784-1000</td></tr>
      		</table>
      
      </div>
    </li>
  </ul>
</div><!-- 바디 마지막 디브 -->
	<script>
	$(document).ready(function(){
		$('.modal-trigger').leanModal();
		$('.carousel.carousel-slider').carousel({full_width: true});
		 $('.collapsible').collapsible({
		    accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
		  });
		
	});
	</script>
	