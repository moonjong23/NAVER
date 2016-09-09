<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="pack.business.BoardMgr" />
<jsp:useBean id="dto" class="pack.business.BoardDto" />
<%
String num = request.getParameter("num");
//String spage = request.getParameter("page");

boardMgr.updateReadcnt(num); //조회수 증가
dto = boardMgr.getDate(num);

String name = dto.getName();
String pass = dto.getPass();
String mail = dto.getMail();
String title = dto.getTitle();
int gnum = dto.getGnum();
String cont = dto.getCont();
String bip = dto.getBip();
String bdate = dto.getBdate();
int readcnt = dto.getReadcnt();

String apass = "*****"; //일반인은 *이보임
String admin = (String)session.getAttribute("adminKey");
if(admin != null){
	if(admin.equalsIgnoreCase("admin1")) apass = pass; //관리자는 비번 보임
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="http://www.naver.com/favicon.ico?1" />
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
<table class="bordered" style="border-top: solid 1px silver;">
	<tr>
		<td><b>비밀번호:<%=apass %></b></td>
		<td>
		<%if(session.getAttribute("adminKey") != null){%>			
			<a class="waves-effect waves-light modal-trigger right black-text" href="#modal22<%=num%>">
				답변하기
			</a>
		</td>
		<td>
			<a href="delete.jsp?num=<%=num %>" class="black-text right">
				삭제
			</a>
		</td>
		<%}%>   	
	</tr>
</table>
<table style="padding: 1px; border:solid 1px silver; box-shadow:1px;" class="bordered">
	<tr>
		<td>
		작성자 : <br/><a href="mailto:<%=mail %>"><%=name %></a> <%-- (ip : <%=bip %>) --%>
		</td>
		<td>작성일 : <br/><%=bdate %></td>
		<td>조회수 : <br/><%=readcnt %></td>
		
	</tr>
	<tr>
		<td colspan="3" style="">제목 : <br/><%=title %></td>
	</tr>
	<tr>
		<td colspan="3">
			<textarea rows="10" style="width: 99%; max-height: 300px; height: 240px; border: none;" readonly="readonly"><%=cont %></textarea>
		</td>
	</tr>
	
</table>

<div id="modal22<%=num %>" class="modal teal lighten-5" style="width: 450px; height: 780px;">
    <div class="modal-content">
    <form action="replysave.jsp" method="post" name="sfrm">
    		<div><br>
    			답변하기  <i class="small material-icons right" style="vertical-align: top; cursor: pointer;" title="수정" id="ref">loop</i>
    			<p/>
    		</div><br/>
    		<div style="border-bottom: solid 1px grey; width: 400px;"></div>
    		<br>
    			   <input type="hidden" name="num" value="<%=num %>"> 
					<input type="hidden" name="gnum" value="<%=gnum%>">
					<input type="hidden" name="onum" value="<%=dto.getOnum() %>">
					<input type="hidden" name="nested" value="<%=dto.getNested() %>">
    		이 름 : <input type="text" name="name" value="관리자"><br>
    		암 호 : <input type="text" name="pass" value="<%=pass%>"><br>
    		제 목 : <input type="text" name="title" value="답변 : <%=title%>"><br>
    		내 용 : <textarea rows="1" cols="6" style="height: 160px; border-color: grey" name="cont"></textarea>
    		<input type="submit" value="작성완료" class="btn" style="margin-top: 10px; width: 100%;">
    		

    </form>
	</div>
</div>  
</body>
<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 내 자바스크립트 -->	
	<script type="text/javascript" src="../js/bookjs.js"></script>
<!-- 메테리얼 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('.modal-trigger').leanModal();

	});
	</script>	
</html>