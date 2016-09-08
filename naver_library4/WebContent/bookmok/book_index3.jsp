<%@page import="pack.business.BookDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"></jsp:useBean>
<%
ArrayList<BookDto> list = (ArrayList)processDao.selectdataAllBook();
String idkey = (String)session.getAttribute("idKey");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- 뷰어 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>


<style type="text/css">


</style>

<title>네이버 도서관</title>

</head> 
<body>
<%@ include file="../home/home_top.jsp" %>

<div class="container">
<div class="row">
<table style="margin-top:30px; margin-left:30px">
	<tr>
		<td class="text_top col s12 m8 l2">
			<ul>
				<li>
					<b class="categoryf">인터넷/네트워크</b><br/>
					<hr class="hh">
					<p class="categoryf1">
						보안/인증/해킹/바이러스<br/>
						인터넷<br/>
						네트워킹<br/>
						인터넷마케팅/비즈니스
					</p>
				</li>
			</ul>
		</td>
		<td class="text_top col s12 m8 l2">
			<ul>
				<li>
					<b class="categoryf">컴퓨터공학/IT</b><br/>
					<hr class="hh">
					<p class="categoryf1">
						컴퓨터공학<br/>
						IT일반<br/>
						테크니컬커뮤니케이션<br/>
						IT기타
					</p>
				</li>
			</ul>
		</td>
		<td class="text_top col s12 m8 l3">
			<ul>
				<li>
					<b class="categoryf">프로그래밍/언어</b><br/>
					<hr class="hhl">
					<p class="categoryf1">
						<a style="text-decoration: none; color: black; cursor: pointer;" onclick="funcBjang('java')">JAVA</a><br/>
						<a style="text-decoration: none; color: black; cursor: pointer;" onclick="funcBjang('web')">WEB</a><br/>
						<a style="text-decoration: none; color: black; cursor: pointer;" onclick="funcBjang('기타언어')">기타언어</a><br/>
						<a style="text-decoration: none; color: black; cursor: pointer;" onclick="funcBjang('정보처리/알고리즘')">정보처리/알고리즘</a><br/>
						<a style="text-decoration: none; color: black; cursor: pointer;" onclick="funcBjang('C')">C</a>
					</p>
				</li>
			</ul>
		</td>
		<td class="text_top col s12 m8 l2">
			<ul>
				<li>
					<b class="categoryf">운영체제</b><br/>
					<hr class="hh">
					<p class="categoryf1">
						리눅스<br/>
						유닉스<br/>
						임베디드시스템<br/>
						ARM<br/>
						MAC/기타
					</p>
				</li>
			</ul>
		</td>
		<td class="text_top col s12 m8 l2">
			<ul>
				<li>
					<b class="categoryf">데이터베이스</b><br/>
					<hr class="hh">
					<p class="categoryf1">
						Data/DB<br/>
						오라클<br/>
						SQL서버<br/>
						데이터베이스론<br/>
					</p>
				</li>
			</ul>
		</td>
	</tr>
</table>
</div>
<div class="row"><hr class="col s12 m8 l11 undervar1"></div>
<div class="row" id="cnt"></div>
<form name="test_form" method="post" action="">

    <div class="input-field col s12">
    <input  type="text" class="validate" name="text_field" style="width: 250px;">
     <label for="text_field">책 제목검색</label>
       <button class="btn waves-effect waves-light green" onclick="test(this.form)" type="button" style="vertical-align: top; margin-top: 10px;">검색</button> 
 

    </div>
 
  </form>

</div>
	
	<div class="row container" id="ajax">
	<%
	int cou = 0;
	%>
	<div class="row" id="cnt"></div>
		<c:forEach var="b" items="<%=list%>" varStatus="status">
			<div class="col s12 m7 l2" style="width: 170px;">

				<div class="card hoverable">
					<div class="card-image">
					<li onclick="javascript:$('#modal${status.current.bid}').openModal();">
					<img src="../images/${b.bimgsrc }">
							<dl class="book_info_layer">
							<dt>
								<span>${b.bname }</span>
							</dt>
							<dd>
								<dl>
									<dt>저자</dt>
									<dd>${b.bauthor }</dd>
									<dt>출판사</dt>
									<dd>${b.bcompany }</dd>
									<dt>출판국</dt>
									<dd>${b.bguk }</dd>
									<dt>출판년도</dt>
									<dd>${b.byear }</dd>
								</dl>
							</dd>
						</dl>
					<li>
					</div>
				</div>

				<!-- modal -->
				<div id="modal${status.current.bid}" class="modal"
					style="width: 900px;">
					<div class="modal-content">

						<div class="col s12 m8 l12">
							<blockquote>
								<b><h5>${b.bname}</h5></b>
							</blockquote>
							<div class="divider"></div>
							<table class="bordered highlight striped">
								<tr>
									<td rowspan="3" colspan="2"><img
										src="../images/${b.bimgsrc}"
										class="col s12 m8 l12 hide-on-small-only md" /></td>
									<th>저자</th>
									<td>${b.bauthor}</td>
									<th>출판사</th>
									<td>${b.bcompany}</td>
									<td rowspan="3"><a class="waves-effect waves-light modal-trigger" href="#modalzz"><img src="../images/loc.png"
										class="col s12 m8 l12 hide-on-med-and-down ml hide-on-small-only" /></a></td>
								</tr>
								<tr>
									<th>출판국</th>
									<td>${b.bguk}</td>
									<th>출판년도</th>
									<td>${b.byear}</td>
								</tr>
								<tr>
									<th>서가위치</th>
									<td>${b.blocation}</td>
									<th>분류</th>
									<td>${b.bjang}</td>
								</tr>
								<tr>
									<!-- 
									javascript:basketInsert('${status.current.bid}','${status.current.bname}','${status.current.bauthor}','${status.current.bcompany}','${status.current.bguk}','${status.current.byear}','${status.current.blocation}','${status.current.bjang}','${status.current.bimgsrc}','${status.current.price}')
									 -->
									<td colspan="6"></td>

									
									<c:set var="a" value="${status.current.state}"/>
									<c:set var="b" value="<%=idkey %>"/>
									<c:choose>
										<c:when test="${a eq '0'}">
											<td style="width: 250px;">
											<c:choose>
												<c:when test="${b eq null}">
													<a style="cursor: pointer;" onclick="window.open('../login/login.jsp','', 'width=500, height=450, top=200, left=300')" 
													class=" modal-action waves-effect waves-green btn-flat left green grey-text text-lighten-5">장바구니 담기</a>&nbsp;
												</c:when>
												<c:otherwise>
													<a href="javascript:basketInsert('${status.current.bid}','${status.current.bname}',
														'${status.current.bauthor}','${status.current.bcompany}','${status.current.bguk}',
														'${status.current.byear}','${status.current.blocation}','${status.current.bjang}',
														'${status.current.bimgsrc}','${status.current.price}','${status.current.state}')"
													class=" modal-action waves-effect waves-green btn-flat left green grey-text text-lighten-5">장바구니 담기</a>&nbsp; 
												</c:otherwise>
											</c:choose>
													<a href="#!"
												class=" modal-action modal-close waves-effect waves-green btn-flat right green grey-text text-lighten-5">닫기</a>
											</td>
										</c:when>
										<c:otherwise>
											<td style="width: 207px;"><a
												class=" modal-action waves-effect waves-green btn-flat left green grey-text text-lighten-5"
												href="javascript:alert('이미 누군가 대여중입니당');">대여중</a>&nbsp; <a href="#!"
												class=" modal-action modal-close waves-effect waves-green btn-flat right green grey-text text-lighten-5">닫기</a>
											</td>
										</c:otherwise>
									</c:choose>
										
								</tr>
							</table>
						</div>

					</div>

				</div>

			</div>
			<%
				cou++;
			%>
		
		</c:forEach>
		
<div id="modalzz" class="modal" style="width: 450px;">
    <div class="modal-content">
    <img src="../images/loc.png" style="height: 500px; width: 400px;">
	</div>
</div>     
	</div>
	
<!-- 장바구니로 폼 넘기기 -->
<form action="book_basket.jsp" name="basketForm" method="post">
	<input type="hidden" name="bid">
	<input type="hidden" name="bname">
	<input type="hidden" name="bauthor">
	<input type="hidden" name="bcompany">
	<input type="hidden" name="bguk">
	<input type="hidden" name="byear">
	<input type="hidden" name="blocation">
	<input type="hidden" name="bjang">
	<input type="hidden" name="bimgsrc">
	<input type="hidden" name="price">
</form> 
         
 <%@ include file="../home/home_bottom.jsp" %>

<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 메테리얼 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
      <!-- angular -->

	
<!-- 내 자바스크립트 -->	
	<script type="text/javascript" src="../js/bookjs.js"></script>
	<script>
	$(document).ready(function(){
		$('.modal-trigger').leanModal();
		$('.carousel.carousel-slider').carousel({full_width: true});
		
		$('.card-image > li').mouseenter(function(){
			$("dl", this).addClass("bil_on");
		}).mouseleave(function(){
			$("dl", this).removeClass("bil_on");
		});
	});
	
	function funcBjang(a){
		$.ajax({
            type: 'get'
          , url: 'aja.jsp?bjang='  + a
          , dataType : 'html'
          , success: function(data) {
             $("#ajax").html(data);
            }
          });
	}
	function funcFindName(a){
		$.ajax({
            type: 'get'
          , url: 'ajafindname.jsp?bname='  + a
          , dataType : 'html'
          , success: function(data) {
             $("#ajax").html(data);
            }
          });
	}
	
	function test(this_form)
	{	
		
		 
		if(this_form.text_field.value==''){
			
			Materialize.toast('검색어를 입력해주세요', 1500);
			return;
		}
	
		funcFindName(this_form.text_field.value);
	}
	
	
	$("#cnt").html("<b style='margin-left:10px'>전체 > "+<%=cou%>+"건</b>");

	</script>
</body>
</html>