<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="ezen.porfolio.member.dto.Member"%>
<%@page import="ezen.porfolio.article.dao.MemoDao"%>
<%@page import="ezen.porfolio.common.dao.DaoFactory"%>

<% 
request.setCharacterEncoding("UTF-8"); 
%>
<jsp:useBean id="memo" class="ezen.porfolio.article.dto.Memo" scope="request"/>
<jsp:setProperty name="memo" property="*"/>
<%-- 등록시 누가 등록한건지 알기 위해 생성전에 memo객체의 id속성 설정해줌 --%>
<c:set target="${memo}" property="id" value="${loginMember.id}"></c:set>
<c:set target="${memo}" property="writer" value="${loginMember.name}"></c:set>

<%
MemoDao memoDao = DaoFactory.getInstance().getMemoDao();
memoDao.create(memo);
// 전체목록페이지로 자동 요청
response.sendRedirect("/#comment-section");
%>