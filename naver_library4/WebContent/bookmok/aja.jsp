<%@page import="pack.business.BookDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"/>
<%
String bjang = request.getParameter("bjang");
String idkey = (String)session.getAttribute("idKey");
ArrayList<BookDto> list = (ArrayList)processDao.selectDataAllByJang(bjang);%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
%>
     <%
	int cou = 0;
	%>
	<div class="row" id="cnt"></div>
		<c:forEach var="b" items="<%=list%>" varStatus="status">
			
			<%
     		//System.out.println(cou);
			cou++;
			%>
     
     <c:if test="${status.last}"><script>document.getElementById("cnt").innerHTML = "<b style='margin-left:10px'>${status.current.bjang} > "+<%=cou%>+"건</b>";</script></c:if>
			
			
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
									<td rowspan="3"><img src="../images/loc.png"
										class="col s12 m8 l12 hide-on-med-and-down ml hide-on-small-only" /></td>
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
		
		
		</c:forEach>
		<script>
			$('.card-image > li').mouseenter(function(){
				$("dl", this).addClass("bil_on");
			}).mouseleave(function(){
				$("dl", this).removeClass("bil_on");
			});
		</script>