<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 구글 아이콘 -->
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- 머티리얼 -->	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<link href="../css/homestyle.css" rel="stylesheet" type="text/css">

</head>
<body class="container row">
<%String sessionVal = (String)session.getAttribute("idKey"); 
if(sessionVal != null){
	%>
	<div class="section"></div>
	<div class="section">
	<div class="card-panel green accent-4 white-text center-align col s12"><br><b style="font-size:16px"><%=sessionVal%>님 이미 로그인중입니다.<br><br></b></div>
	</div>
	
	<a class ="waves-effect waves-light blue-grey lighten-1 btn col s12" href="logout.jsp" style="margin-top:20px">로그아웃</a>
	
	<a class ="waves-effect waves-light grey darken-1 btn col s12" href="javascript:window.opener.location.reload();close();" style="margin-top:15px">창닫기</a>
		
	<%
}else{
%>	

<form name="login" method="post" action="loginproc.jsp">
<div class="section"></div>
<div class="card-panel green accent-4 white-text center-align"><b style="font-size:18px">네이버 도서관 방문을 환영합니다.</b></div>
<div class="section"></div>
 <div class="divider"></div>
 <div class="section"></div>
 <div class="input-field col s12">
<input placeholder="아이디를 입력해주세요."  name="id" type="text" ng-required="true">
<label for="id">id</label>


</div>
<div class="section"></div>

 <div class="input-field col s12">
<input placeholder="패스워드를 입력해주세요."  name="pswd" type="password" class="validate" ng-required="true">
<label for="pswd">Password</label>
</div>

  <button class="btn-large waves-effect waves-light col s12 grey darken-1" type="submit" name="action" style="font-size:16px">
  	로그인
  </button>
   
</form>


<%	
}
%>



<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 메테리얼 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<!-- angular -->
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>

</body>
</html>