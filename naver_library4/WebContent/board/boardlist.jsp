<%@page import="pack.business.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="pack.business.BoardMgr"/>
<jsp:useBean id="dto" class="pack.business.BoardDto" />
<%
int spage = 1;
int pageSu = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MS LIBRARY</title>
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
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnSearch").onclick = function(){
		if(frm.sword.value == ""){
			frm.sword.focus();
			Materialize.toast('검색어를 입력해주세요!', 1400);
			return;
		}
		frm.submit();
	}

}
	function funcContent(a){
		$.ajax({
            type: 'get'
          , url: 'conajax.jsp?num='  + a
          , dataType : 'html'
          , success: function(data) {
             $("#ajax2").html(data);
            }
          });
	}
</script>
</head>
<body>
<%@ include file="../home/home_top.jsp" %>
<div class="container row">

<table class="col s12 m8 l2">
	<tr>
		<td class="guidefont" style="padding-left:14px; width: 95px; text-align: center;">	
			<a href="../home/notice.jsp" class="black"><b>공지사항</b></a>
		</td>
		<td class="guidefont" style="text-align: center;">
			<a href="boardwrite.jsp" class="black"><b>FAQ</b></a>
		</td>
		<td class="guidefont" style="text-align: center;">	
			<a href="../board/boardlist.jsp?page=1" class="black"><b>Q&A</b></a>
		</td>
	</tr>
</table>
<br>
<hr class="black" style="border: solid 1px; width: 1280px; margin-right: 10px;">
	
</div>

		<div class="row">
		<div class="col s12 m8 l3 offset-l2">
			<b style="font-size: 12pt;">궁금증을 해결해보세요.</b>
		</div>
		<div class="col s12 m8 l2 pull-l1">
			<h6 style="font-size: 9pt; color: silver"><i class="tiny material-icons">volume_up</i>라이브러리에서 궁금증을 해결해드립니다.</h6>
		</div>
		</div>
		<div class="row">
		<div class="col s12 m8 l2 offset-l2" id="ajax2"></div>
		<table class="highlight bordered col s12 m8 l6" >
			<thead>
			<tr>
				<th style="text-align: center;">번호</th>
				<th style="text-align: center;">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
			</thead>
		<%
		request.setCharacterEncoding("utf-8");
		try{
			spage = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e){
			spage = 1;
		}
		if(spage <= 0) spage = 1;
		
		//검색이 있는 경우
		String stype = request.getParameter("stype");
		String sword = request.getParameter("sword");
		
		boardMgr.totalList();
		pageSu = boardMgr.getPageSu();  //전체 페이지 수 얻기
		ArrayList<BoardDto> list = boardMgr.getDataAll(spage, stype, sword);
		for(int i =0; i < list.size(); i++){
			dto = (BoardDto)list.get(i);
			
			//댓글 들여쓰기 준비 -------------
			int nst = dto.getNested();
			String tab = "";
			String icon = "";
			for(int k = 0; k < nst; k++){
				tab += "&nbsp;&nbsp;";
				icon = "<img src='../images/re.gif' />";
			}
			//----------------------------------
		%>
		<tbody>
			<tr>
				<td style="text-align: center;"><%=dto.getNum() %></td>
				<td>
				<%=tab %><%=icon %><a class="black-text" style="text-decoration: none; cursor: pointer;" onclick="funcContent('<%=dto.getNum()%>')"><%=dto.getTitle() %></a>
				</td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getBdate() %></td>
				<td><%=dto.getReadcnt() %></td>
			</tr>
		<% 
		}
		%>
		</tbody>
		</table>
		</div>
		<div class="row">
		<table style="width: 50%;" class="col s12 m8 l6">
			<tr>
				<td style="text-align: center;" class="col s12 m8 l12 offset-l8">
				<%
					out.print("<ul class='pagination'>");
					if(spage != 1){
					out.print("<li class='waves-effect'><a href='boardlist.jsp?page=" + (spage - 1) + "')><i class='material-icons'>chevron_left</i></a></li>");						
					}else{
						out.print("<li class='waves-effect'><a href='boardlist.jsp?page=" + "1" + "')><i class='material-icons'>chevron_left</i></a></li>");	
					}
				for(int i = 1; i <= pageSu; i++){
					if(i == spage){
					out.print("<li class='active'><a href='#!'>" + i + "</a></li>");						
					}else{
					out.print("<li class='waves-effect'><a href='boardlist.jsp?page=" + i + "'>" + i + "</a></li>");												
					}
				}
				if(spage != pageSu){
					out.print("<li class='waves-effect'><a href='boardlist.jsp?page=" + (spage + 1) + "')><i class='material-icons'>chevron_right</i></a></li>");						
					}else{
						out.print("<li class='waves-effect'><a href='boardlist.jsp?page=" + pageSu + "')><i class='material-icons'>chevron_right</i></a></li>");	
					}
					out.print("</ul>");
				%>
				
				<form action="boardlist.jsp" name="frm" method="post">
				<select name="stype">
				<option value="title" selected="selected">글제목</option>
				<option value="name">작성자</option>
				</select>
				<div class="row col s12 m8 l12">
				<input type="text" name="sword" class="row col s12 m8 l3 offset-l4" style="margin-left: 330px;">
				<i class="tiny material-icons waves-effect waves-light btn green row col s12 m8 l1" id="btnSearch" style="width: 60px; height: 35px; margin-top: 10px;">검색</i>
				</div>
				</form>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>

<%@ include file="../home/home_bottom.jsp" %>
<!--제이쿼리-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- 내 자바스크립트 -->	
	<script type="text/javascript" src="../js/bookjs.js"></script>
<!-- 메테리얼 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
</body>
</html>