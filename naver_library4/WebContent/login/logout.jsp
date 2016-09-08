<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<link href="../css/homestyle.css" rel="stylesheet" type="text/css">

<title>로그아웃</title>
</head>
<body class="container">
<%session.removeAttribute("idKey");%>
<div class="section">
	<div class="card-panel blue-grey lighten-1 white-text center-align col s12"><b style="font-size:16px">로그아웃 성공<br></b></div>
</div>

<div class="row">
<a class ="waves-effect waves-light grey darken-1 btn col s12" href="javascript:window.opener.location.reload();close();" style="margin-top:15px">창닫기</a>
</div>


<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 메테리얼 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>

</body>
</html>