<%@page import="step01_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bDeletePro</title>
</head>
<body>

	<% 
		long boardId = Long.parseLong(request.getParameter("boardId"));
	
		BoardDAO.getInstance().deleteBoard(boardId);
	
	%>

	<script>
		alert("삭제 되었습니다.");
		location.href = "bList.jsp";
	</script>



</body>
</html>
