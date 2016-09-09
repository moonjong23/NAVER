<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bean" class="pack.business.BoardBean" />
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="boardMgr" class="pack.business.BoardMgr"/>

<%
int num = bean.getNum();
int gnum = bean.getGnum();
System.out.println(gnum);
int onum = bean.getOnum() + 1;
int nested = bean.getNested() + 1;

//같은 그룹 내에서 새로운 댓글의 onum 보다 크거나 같은 값을 댓글 입력 전에 먼저 수정하기
//먼저 수정하기. 작으면 수정하지 않음

boardMgr.updateOnum(gnum, onum); //onum 갱신처리
//댓글 저장
bean.setOnum(onum);
bean.setNested(nested);
bean.setBip(request.getRemoteAddr());
bean.setBdate();
bean.setNum(boardMgr.currentGetNum() + 1);

boardMgr.saveReply(bean);
response.sendRedirect("boardlist.jsp?page=1");
%>














