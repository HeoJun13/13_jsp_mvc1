<%@page import="step03_boardAdvancedEx.MainBoardDTO"%>
<%@page import="step03_boardAdvancedEx.BoardAdvancedDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDelete</title>
</head>
<body>

	<%
		long boardId = Long.parseLong(request.getParameter("boardId"));
	%>

	<div align="center">
		<h3>게시글 삭제</h3>
		<p><span style="color:red;">삭제된 게시글은 다시는 복구 할 수 없습니다. 정말 삭제하시겠습니까?</span></p>
		<input type="button" value="삭제하기" onclick="location.href='boardDeletePro.jsp?boardId=<%=boardId%>'">
		<input type="button" value="취소" onclick="location.href='boardDetail.jsp?boardId=<%=boardId%>'">
	</div>
	
</body>
</html>