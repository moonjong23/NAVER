<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 도서관</title>
<link rel="shortcut icon" type="image/x-icon" href="http://www.naver.com/favicon.ico?1" />
</style>
<meta charset="UTF-8">
<!-- 구글 아이콘 -->
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 내 css -->	
	<link href="../css/homestyle.css" rel="stylesheet" type="text/css">	
<!-- 머티리얼 -->	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<!-- 뷰어 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
<%@ include file="../home/home_top.jsp" %>
<div class="container">
<div class="row">
<table class="col s12 m8 l2">
	<tr>
		<td class="guidefont" style="padding-left:14px; width: 95px; text-align: center;">	
			<a href="../home/notice.jsp" class="black-text"><b>공지사항</b></a>
		</td>
		<td class="guidefont" style="text-align: center;">
			<a href="../home/FAQ.jsp" class="black-text"><b>FAQ</b></a>
		</td>
		<td class="guidefont" style="text-align: center;">	
			<a href="../board/boardlist.jsp?page=1" class="black-text"><b>Q&A</b></a>
		</td>
	</tr>
</table>
<br>
<hr class="black" style="border: solid 1px; width: 1280px; margin-right: 10px;">
</div>	
</div>
<div class="container">
<div class="row">
<div class="col s12 m8 l3"><b style="font-size: 12pt;">도서관에 궁금한 것들을<br>알려드립니다.</b></div>

<ul class="collapsible col s12 m8 l9" data-collapsible="expandable" style="box-shadow:none; border-left: none; border-right: none; padding-right: 24px;">
    <li>
      <div class="collapsible-header">
     <i class="material-icons">question_answer</i><b>소장 자료 현황은 어떻게 되나요?</b></div>
    
      <div class="collapsible-body">
	  <p style="padding-left: 20px;">
	  <i class="material-icons left">spellcheck</i>
      네이버 라이브러리는 크게 매거진/디자인/백과사전과 IT 도서를 보유하고 있습니다.<br/>
	매년 가치 있는 도서를 선별하여 장서를 더욱 더 확대해 나갈 예정입니다.<br/>
	 
	  <i class="material-icons left" style="visibility: hidden;">spellcheck</i>
	- 매거진 : ´생활/육아´, ´패션/미용´, ´음식/요리´, ´자동차/기술/과학/´, ´경제/경영´, ´문화´, ´여행/여가´등 7개 카테고리의 잡지 250<br/>여 종
	- 디자인 : 건축, 일러스트, 그래픽, 산업디자인, UX, 예술 등의 DESIGN 서적 1만 7천여 권<br/>
	<i class="material-icons left" style="visibility: hidden;">spellcheck</i>
	- 백과사전 : <두산 세계 대백과사전>등의 ´종합백과´와 <DK대백과> 시리즈 등의 ´총서/시리즈´류 1천 3백 여권<br/>
	- IT : 인터넷, IT, 프로그래밍, DB 등의 IT 서적 7천여 권
      </p>
      </div>
    </li>
    <li>
      <div class="collapsible-header">
     <i class="material-icons">question_answer</i><b>운영시간은 어떻게 되며, 휴관일은 언제인가요?</b></div>
    
      <div class="collapsible-body">
	  <p style="padding-left: 20px;">
	  <i class="material-icons left">spellcheck</i>
     - 매거진 공간 : 월-금 09:00 ~ 21:00 / 토,일 10:00 ~ 17:00 / 공휴일 휴관<br/>
	 - 디자인, 백과사전/IT 공간 : 월-금 09:00 ~ 21:00 / 토,일 10:00 ~ 17:00 / 매월 둘째&넷째 월요일, 공휴일 휴관<br/><br/>
 	 <i class="material-icons left" style="visibility: hidden;">spellcheck</i>
	   기타 회사에서 임시로 휴관일을 지정할 수 있으며, 공지사항을 통해 안내해드리고 있습니다.<br/>
	   휴관일에는 원활한 도서 이용을 위해 장서 및 시설 점검이 이루어집니다.
      </p>
      </div>
    </li>
    <li>
      <div class="collapsible-header">
     <i class="material-icons">question_answer</i><b>주민등록증 이외에 제출할 수 있는 신분증에는 어떤 것이 있나요?</b></div>
    
      <div class="collapsible-body">
	  <p style="padding-left: 20px;">
	  <i class="material-icons left">spellcheck</i>
	  학생증•여권 등 사진이 부착되어 있고, 데스크에 맡길 수 있는 실물형태여야 합니다.<br/>
	  얼굴과 성함이 기재되어 있는 타 도서관의 회원증이나 사원증 등도 가능하며, 신분증을 분실하신 경우에는 신분증발급신청서를 맡기<br/>
     <i class="material-icons left" style="visibility: hidden;">spellcheck</i>
	  시고 이용 가능하십니다. 단, 명함 • 신용카드 • 휴대폰 등은 해당되지 않으며,(휴대폰에 저장된 학생증 포함) 초등학생 및 유아동은<br/>
	  부모님 동반하에 신분증 없이 입장 가능하십니다.
      </p>
      </div>
    </li>
    <li>
      <div class="collapsible-header">
     <i class="material-icons">question_answer</i><b>사물함은 꼭 이용해야 하나요? 어떻게 이용하나요?</b></div>
    
      <div class="collapsible-body">
	  <p style="padding-left: 20px;">
	  <i class="material-icons left">spellcheck</i>
	  1층 디자인공간, 2층 백과사전/IT 공간을 이용할 때에는 가져오신 가방과 소지품을 사물함에 넣어주세요.<br/>
	   각 층 안내데스크에서 신분증을 제시하면 사물함을 이용할 수 있는 출입증으로 교환해 드립니다.<br/>
 	 <i class="material-icons left" style="visibility: hidden;">spellcheck</i>
 	  - 잠금 : 가방 및 소지품을 넣고 문을 닫은 후 비밀 번호 4자리 입력 (반입 가능 소지품 ; 노트북, 필기구, 주제 관련 도서)<br/>
	  - 열림 : 입력했던 비밀 번호 4자리 입력 (문이 열리면 기존 비밀번호는 지워집니다)
      </p>
      </div>
    </li>
    <li>
      <div class="collapsible-header">
     <i class="material-icons">question_answer</i><b>인터넷 이용 가능한 PC가 있나요?</b></div>
    
      <div class="collapsible-body">
	  <p style="padding-left: 20px;">
	  <i class="material-icons left">spellcheck</i>
	   인터넷 이용을 위한 PC는 없으며, 도서검색 전용 PC 6대가 비치되어 있습니다.
      </p>
      </div>
    </li>
    <li>
      <div class="collapsible-header">
     <i class="material-icons">question_answer</i><b>도서검색은 어떻게 하나요?</b></div>
    
      <div class="collapsible-body">
	  <p style="padding-left: 20px;">
	  <i class="material-icons left">spellcheck</i>
	  네이버 라이브러리 홈페이지(library.navercorp.com)에서 검색하실 수 있습니다.<br/>
	  각 층에 마련된 도서검색 PC를 이용하시면 책의 위치정보를 출력할 수 있어 조금 더 편리하게 이용 가능합니다.
      </p>
      </div>
    </li>
    <li>
      <div class="collapsible-header">
     <i class="material-icons">question_answer</i><b>책은 대출할 수 있나요?</b></div>
    
      <div class="collapsible-body">
	  <p style="padding-left: 20px;">
	  <i class="material-icons left">spellcheck</i>
	  보다 많은 사람들이 함께 책을 볼 수 있도록 책은 네이버 라이브러리 내에서만 열람할 수 있습니다.<br/>
	  분실로 인한 불편을 미연에 방지하기 위함이니 양해 부탁드립니다.
      </p>
      </div>
    </li>
    <li>
      <div class="collapsible-header">
     <i class="material-icons">question_answer</i><b>주차는 가능한가요?</b></div>
    
      <div class="collapsible-body">
	  <p style="padding-left: 20px;">
	  <i class="material-icons left">spellcheck</i>
	  그린팩토리 사옥 지하 주차장을 이용하실 수 있습니다.<br/><br/>
     <i class="material-icons left" style="visibility: hidden;">spellcheck</i>
		- 주차요금 : 10분당 500원(1시간 3,000원)<br/>
		- 이용시간 : 평일 09:00 ~ 21:00 / 주말 10:00 ~ 17:00<br/>
	   <i class="material-icons left" style="visibility: hidden;">spellcheck</i>
		- 출차시 무인 정산기에서 신용/체크카드, 후불교통카드 결제<br/>
		- 2016.01.11일 부터 현금 결제는 불가합니다.
      </p>
      </div>
    </li>
    <li>
      <div class="collapsible-header">
     <i class="material-icons">question_answer</i><b>복사나 스캔이 가능한가요?</b></div>
    
      <div class="collapsible-body">
	  <p style="padding-left: 20px;">
	  <i class="material-icons left">spellcheck</i>
	 2층 백과사전/IT 공간에 흑백/컬러 복사기가 설치되어 있으며, 충전용 T-money 카드 결제로 사용할 수 있습니다.<br/>
	 스캐너는 저작권법 보호를 위해 비치되어 있지 않습니다.
      </p>
      </div>
    </li>
    <li>
      <div class="collapsible-header">
     <i class="material-icons">question_answer</i><b>디자인 공간의 북카트는 무엇인가요?</b></div>
    
      <div class="collapsible-body">
	  <p style="padding-left: 20px;">
	  <i class="material-icons left">spellcheck</i>
	 무거운 디자인 책을 골라 자리로 옮길 때의 불편을 덜기 위해 ´네이버 라이브러리´에 적합한 북카트를 직접 제작했습니다. ´네이버 북<br/>
	 카트´를 밀고 다니다 책장 앞에서 꺼낸 책을 바로 카트의 보면대에 올려놓고 내용을 살펴볼 수 있습니다. 아래쪽 수납공간에는 몇 권<br/>
	  <i class="material-icons left" style="visibility: hidden;">spellcheck</i>
	 의 책을 넣어 손쉽게 이동할 수 있습니다.
      </p>
      </div>
    </li>
    <li>
      <div class="collapsible-header">
     <i class="material-icons">question_answer</i><b>도서 신청을 할 수 있나요?</b></div>
    
      <div class="collapsible-body">
	  <p style="padding-left: 20px;">
	  <i class="material-icons left">spellcheck</i>
	라이브러리 내 비치된 ´도서 신청함´ 및 e메일(library@navercorp.com)를 통해 신청하실 수 있습니다.<br/>
	단, 소장 주제인 매거진과 디자인, 백과사전, IT 분야의 책만 신청이 가능하다는 점 참고해주세요.
      </p>
      </div>
    </li>
    </li>
    <li>
      <div class="collapsible-header" style="border-bottom: solid 4px black;">
     <i class="material-icons">question_answer</i><b>소규모/독립출판의 책들은 무엇인가요?</b></div>
    
      <div class="collapsible-body">
	  <p style="padding-left: 20px;">
	  <i class="material-icons left">spellcheck</i>
	소규모로 출판되어 더 가치 있고 시중에서 쉽게 만나보기 어려운 도서들을 모아놓은 코너로, 1층 디자인 공간 내 전용 서가에서 만날<br/>
	 수 있습니다.
      </p>
      </div>
    </li>

  </ul>
</div>

<%@ include file="../home/home_bottom.jsp" %>

<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 내 자바스크립트 -->	
	<script type="text/javascript" src="../js/bookjs.js"></script>
<!-- 메테리얼 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('.collapsible').collapsible({
      expandable : true
    });
  });
</script>
</body>
</html>