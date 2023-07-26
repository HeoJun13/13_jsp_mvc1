<%@page import="step03_boardAdvancedEx.MainBoardDTO"%>
<%@page import="step03_boardAdvancedEx.BoardAdvancedDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdatePro</title>
</head>
<body>

		<%
	
		request.setCharacterEncoding("utf-8");
	
		MainBoardDTO mainBoardDTO = new MainBoardDTO();
		mainBoardDTO.setBoardId(Long.parseLong(request.getParameter("boardId")));
		mainBoardDTO.setSubject(request.getParameter("subject"));
		mainBoardDTO.setContent(request.getParameter("content"));
		
		BoardAdvancedDAO.getInstance().updateBoard(mainBoardDTO);
	%>
	
	<script>
		alert("수정 되었습니다.");
		location.href = "boardList.jsp";
	</script>
	
</body>
</html>