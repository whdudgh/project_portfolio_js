<%@page import="ezen.porfolio.common.dao.DaoFactory"%>
<%@page import="ezen.porfolio.member.dto.Member"%>
<%@page import="ezen.porfolio.member.dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

//MemberDao memberDao = new JdbcMemberDao();
MemberDao memberDao = DaoFactory.getInstance().getMemberDao();
Member loginMember = memberDao.findByUser(id, passwd);
session.setAttribute("loginMember", loginMember);
%>

<c:choose>
	<c:when test="${empty loginMember}">
		<script>
			// 추후 JavaScript2에서 Ajax를 이용한 비동기 통신 처리
			alert('아이디와 비밀번호를 확인하세요.');
			location.href='<c:url value="/member/login.jsp"/>';
		</script>
	</c:when>
	<c:otherwise>
		<c:set var="loginMember" value="${loginMember}" scope="session"/>
		<c:redirect url="/#comment-section"/>
	</c:otherwise>
</c:choose>