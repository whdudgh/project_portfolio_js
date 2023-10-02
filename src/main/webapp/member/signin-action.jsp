
<%@page import="ezen.porfolio.common.dao.DaoFactory"%>
<%@page import="ezen.porfolio.member.dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="member" class="ezen.porfolio.member.dto.Member" scope="session"/>
<jsp:setProperty property="*" name="member"/>

<%
// 폼 전송 데이터 유효성 검증 작업 (편의상 생략)
//MemberDao memberDao = new JdbcMemberDao();
MemberDao memberDao = DaoFactory.getInstance().getMemberDao();
memberDao.create(member);
System.out.println("회원 가입 완료!!");
// 회원 가입 정보 보여주는 페이지로 이동
response.sendRedirect("/");
%>
