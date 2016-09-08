<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udto" class="pack.business.UserDto"></jsp:useBean>
<jsp:setProperty property="*" name="udto"/>    
<jsp:useBean id="processDao" class="pack.business.ProcessDao"></jsp:useBean>
<%boolean b= processDao.selectUserLogin(udto);%>    
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<link href="../css/homestyle.css" rel="stylesheet" type="text/css">
<title>로그인 처리 결과</title>
</head>
<body class="container">

<%
if(b){
	session.setAttribute("idKey", udto.getId());
%>
	<div class="section">
	<div class="card-panel green accent-4 white-text center-align col s12"><b style="font-size:16px"><%=udto.getId()%>님 로그인 성공<br></b></div>
	</div>
	<div class="row">
	<a class ="waves-effect waves-light grey darken-1 btn col s12" href="javascript:window.opener.location.reload();close();" style="margin-top:15px">창닫기</a>
	</div>
<%
}else{
	
%>
	<div class="card-panel green accent-4 white-text center-align col s12"><b style="font-size:16px">로그인 실패  <br>아이디와 비밀번호를 다시 확인해주세요.<br></b></div>

	<div class="row">
		<a class ="waves-effect waves-light blue-grey lighten-1 lighten-4 btn col s12" href="login.jsp" style="margin-top:20px">다시시도</a>
	</div>
<%	
}
%>

<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 메테리얼 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
</body>
</html>