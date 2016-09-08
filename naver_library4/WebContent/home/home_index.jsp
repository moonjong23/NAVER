<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
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

	<style>
	
	@CHARSET "UTF-8";
.grey-text.text-lighten-5.mm{font-size: 35px; position: absolute; left: 320px; top: 25px;}.grey-text.text-lighten-5.mn{font-size: 35px; position: absolute; left: 320px; top: 60px;}.row.container.bl{width: 1100px;}.hhl{border: solid 1px; width: 280px; margin-left: 1px;}.categoryf{font-size: 11pt; font-family: serif;}.categoryf1{font-size: 9pt; font-family: serif;}
font-size: 13px;}.hov{background-color: black; opacity: 2; color: white;}.col.s12.m8.l12.hide-on-small-only.md{width: 180px; height: auto; max-height: 200px;}.col.s12.m8.l12.hide-on-med-and-down.ml{width: 180px; height: auto; max-height: 260px;}.col.s12.m8.l11.undervar1{border: solid 1px; }
a.active.grey-text.text-lighten-5.nv{width: 190px;}a.grey-text.text-lighten-5.nv{width: 190px;}.guidefont>a{color: black; font-size: 10pt; font-family: serif;}.guidefont{width: 60px; text-align: center;}#intro{background-color: black; color: white; width: 80px; height: 80px;}.introfrm{width: 400px; vertical-align: text-top;}
.introfont{font-size: 10pt;}.carousel.carousel-slider.col.s12.m12{height: 600px;}.black.lane{border: solid 1px; width: 1120px; margin-right: 60px;}.grey.lighten-4.lane{border: solid 1px; width: 815px; margin-right: 60px;}.text_top{vertical-align: text-top;}.hh{border: solid 1px; width: 170px; margin-left: 1px;}.hh1{border: solid 1px; width: 170px; margin-left: 770px;}.grey-text.text-grey.lighten-1.mc{text-align: right; text-decoration: underline;}
	
	</style>
<title>네이버 도서관</title>

</head>
<body>
<%@ include file="home_top.jsp" %>
<article class="container row">


		<!-- Note that "m8 l9" was added -->

	
			<div class="col s12 l3 offset-l1">
				<table>
					<tr>
						<td style="text-align: left; font-size: 13px;"><b>운영시간</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="guide.jsp" class="grey-text text-grey lighten-1 mc"></a><br> <span
							class="grey-text text-grey lighten-1">월-금</span> <b
							style="font-size: 20px;">&nbsp;&nbsp;&nbsp;09:00~21:00</b><br>
							<span class="grey-text text-grey lighten-1">토-일</span> <b
							style="font-size: 20px;">&nbsp;&nbsp;&nbsp;10:00~17:00</b>
				</table>
			</div>

			<div class="col s12 l4">
				<table>
					<tr>
						<td style="text-align: left; font-size: 13px;"><b>휴관안내</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="guide.jsp" class="grey-text text-grey lighten-1 mc"></a><br> <span
							class="grey-text text-grey lighten-1">2016.09(September)</span><br>
							<b style="font-size: 20px;">9/12, 9/13, 9/14, 9/15, 9/16,
								9/17, 9/18, 9/19, 9/20</b>
				</table>
			</div>

			<div class="col s12 l4">
				<table>
					<tr>
						<td style="text-align: left; font-size: 13px;"><b>Q&A</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="../board/boardlist.jsp" class="grey-text text-grey lighten-1 mc">자세히</a><br>
							<span class="grey-text text-grey lighten-1">Q&A 게시판 만들예정</span><br>
							<span class="grey-text text-grey lighten-1">게시파아아아아안</span>
				</table>
			</div>

	
		<hr class="grey darken-4 col s12" size=4>
	
<!-- 위 탭 3개 -->





		<div class="col s12 m8 l12">
			<table>
				<tr>
					<td class="introfrm"><b>도서관이<br> 조금 다를 수 있다는 생각
					</b></td>
					<td class="introfont">´네이버 라이브러리´는 회사를 대표하는 공간, 네이버 사옥의 로비에
						자리하고 있습니다.<br /> 로비에 유명한 미술 작품이나 대표 서비스를 보여주는 대신 ´책이 있는 공간, 도서관´을
						만든 이유는<br /> 네이버와 책 모두 지식과 정보, 이야기와 콘텐츠가 담겨 있다는 점에서 서로 닮아있기
						때문입니다.<br />
						<p /> <b>´네이버 라이브러리´는 일반적인 도서관, 서점, 북카페 등<br /> 책이 있는 공간의
							장점들을 모두 경험할 수 있는 공간입니다.
					</b>
						<p /> -개인이 구매하기 부담스럽거나 잘 알려지지 않은 희소가치가 있는 책들을 만날 수 있습니다.<br />
						-책과 함께 커피를 즐길 수 있습니다.<br /> -책들은 ´책등´이 아닌 ´책 표지´가 보이도록 꽂혀있습니다.<br />
						-책장의 공간적 효율 대신 사람들이 책을 고르기 쉽도록 하기 위해서입니다.<br /> -개인이 구매하기에 부담스러운
						고가의 희귀 장서도 누군가에게 요청할 필요 없이 바로 펼쳐볼 수 있습니다.<br /> -´정숙´해야만 하는 일반
						도서관과 다르게 공간에 따라 북적거리거나 옆 사람과 이야기를 나눌 수도 있습니다.
					</td>
				</tr>
			</table>

		</div>
		<table>
			<tr>
				<td class="introfrm"><b>만나볼 수 있는 장서와<br> 공간 콘셉트
				</b></td>
				<td class="introfont">
					<table>
						<tr>
							<td>
								<ul>
									<li>
										<p>
											<img src="../images/Magazine.png">
										</p>
										<p>
											<b>국내외 잡지 250여 종</b>
										</p>
										<p>
											거리(Street)에서<br />쇼핑하듯 잡지를 훑어보다
										</p>
									</li>
								</ul>
							</td>
							<td>
								<ul>
									<li>
										<p>
											<img src="../images/Design.png">
										</p>
										<p>
											<b>디자인 장서 17,000여권</b>
										</p>
										<p>
											숲(Forest)에 둘러싸이듯<br />방대한 디자인 서적을 거닐다
										</p>
									</li>
								</ul>
							</td>
							<td>
								<ul>
									<li>
										<p>
											<img src="../images/Encyclopedia.png">
										</p>
										<p>
											<b>전세계 전문 백과사전 1,300여권</b>
										</p>
										<p>
											방 한쪽(My room)에 앉아<br />깊이 지식을 탐독하다
										</p>
									</li>
								</ul>
							</td>
							<td>
								<ul>
									<li>
										<p>
											<img src="../images/IT.png">
										</p>
										<p>
											<b>기초체력 IT 장서 7000여권</b>
										</p>
										<p>
											차곡차곡 쌓여진(archive) 서가를<br />거닐며 IT의 흐름을 읽다
										</p>
									</li>
								</ul>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="introfrm"><b>사회 취약계층과 함께<br> 합니다
				</b></td>
				<td class="introfont"><b>네이버 라이브러리는 사회취약계층이 함께 만들어갑니다.</b>
					<p /> 할머니, 할아버지들의 손길로 도서관의 책이 정리됩니다.<br /> 네이버 라이브러리 내에 위치한 카페에는
					발달 장애인의 일터를 만드는 회사 ´베어베터´와 함께</br> 지적 장애나 자폐를 가진 청년들이 커피를 만들고 있습니다.</td>
			</tr>
		</table>
		
		
			<table>
			<tr>
				<td class="introfrm"><b>MS 라이브러리 둘러보기</b></td>
				<td class="introfont">
					<div class="carousel carousel-slider col s12 m12" title="좌우로 밀어서 넘기기">
						<a class="carousel-item" href="#one!"><img
							src="../img/homeimg/img_gallery_big1.jpg"></a> <a
							class="carousel-item" href="#two!"><img
							src="../img/homeimg/img_gallery_big2.jpg"></a> <a
							class="carousel-item" href="#three!"><img
							src="../img/homeimg/img_gallery_big3.jpg"></a> <a
							class="carousel-item" href="#four!"><img
							src="../img/homeimg/img_gallery_big4.jpg"></a> <a
							class="carousel-item" href="#four!"><img
							src="../img/homeimg/img_gallery_big5.jpg"></a> <a
							class="carousel-item" href="#four!"><img
							src="../img/homeimg/img_gallery_big6.jpg"></a> <a
							class="carousel-item" href="#four!"><img
							src="../img/homeimg/img_gallery_big7.jpg"></a> 
							
					</div>
				</td>
			</tr>
		</table>
				




	
</article>
 <%@ include file="home_bottom.jsp" %>


<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 메테리얼 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<!-- 내 자바스크립트 -->	
	<script type="text/javascript">
	$(document).ready(function(){
	    $('.parallax').parallax();
	    $('.carousel.carousel-slider').carousel({full_width: true});
	});
	
	</script>
</body>
</html>