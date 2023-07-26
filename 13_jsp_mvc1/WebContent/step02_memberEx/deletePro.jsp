<%@page import="step02_memberEx.MemberDAO"%>
<%@page import="step01_boardEx.BoardDTO"%>
<%@page import="step01_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePro</title>
</head>
<body>
	
	<%
		MemberDAO.getInstance().deleteMember(request.getParameter("memberId"));
	%>
	
	<script>
		alert("삭제 되었습니다.");
		location.href = "main.jsp";
	</script>
	
</body>
</html>