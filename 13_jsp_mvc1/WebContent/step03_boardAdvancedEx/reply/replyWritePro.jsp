<%@page import="step03_boardAdvancedEx.ReplyDTO"%>
<%@page import="step03_boardAdvancedEx.BoardAdvancedDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>replyWritePro</title>
</head>
<body>

	<%
	
		request.setCharacterEncoding("UTF-8");
	
		ReplyDTO replyDTO = new ReplyDTO();
		String boardId = request.getParameter("boardId");
		replyDTO.setBoardId(Long.parseLong(boardId));
		replyDTO.setWriter(request.getParameter("writer"));
		replyDTO.setPasswd(request.getParameter("passwd"));
		replyDTO.setContent(request.getParameter("content"));
		
		BoardAdvancedDAO.getInstance().insertReply(replyDTO);
		
	%>

	<script>
		alert("댓글이 입력되었습니다.");
		location.href = "../board/boardDetail.jsp?boardId=<%=boardId%>";
	</script>

</body>
</html>