<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 추가하기</title>
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 내 css -->	
	<link href="../css/homestyle.css" rel="stylesheet" type="text/css">

<!-- 머티리얼 -->	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<!-- 뷰어 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

</head>
<body class="container row">
<h2>도서 추가하기</h2>
<form action="proc.jsp?flag=insert" name="insert_frm" enctype="multipart/form-data" method="post">
	<table>
		<tr>
			<td>도서 명:</td>
			<td><input type="text" name="bname"></td>
		</tr>
		<tr>
			<td>저자:</td>
			<td><input type="text" name="bauthor"></td>
		</tr>
		<tr>
			<td>출판사:</td>
			<td><input type="text" name="bcompany"></td>
		</tr>
		<tr>
			<td>출판국:</td>
			<td><input type="text" name="bguk"></td>
		</tr>
		<tr>
			<td>출판 년도:</td>
			<td><input type="text" name="byear"></td>
		</tr>
		<tr>
			<td>서가 위치:</td>
			<td><input type="text" name="blocation"></td>
		</tr>
		<tr>
			<td>도서 장르:</td>
			<td><input type="text" name="bjang"></td>
		</tr>
		<tr>
			<td>도서 이미지:</td>
			<td><input  type="file" name="bimgsrc" size="30" />		
			</td>
		</tr>
			<tr>
		<td colspan="2">
			<br>
			<input class="waves-effect waves-light btn"  type="submit" value="상품 등록">
			<input class="waves-effect waves-light btn"  type="reset" value="새로 입력">
		</td>
	</tr>
	</table>
</form>
	<a href="adminedit.jsp">돌아가기</a>
<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 메테리얼 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
  
	
</body>
</html>