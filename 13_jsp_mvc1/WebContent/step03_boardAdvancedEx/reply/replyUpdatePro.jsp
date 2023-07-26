<%@page import="step03_boardAdvancedEx.ReplyDTO"%>
<%@page import="step03_boardAdvancedEx.BoardAdvancedDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>replyUpdatePro</title>
</head>
<body>

	<%
	
		request.setCharacterEncoding("utf-8");
		
		ReplyDTO replyDTO = new ReplyDTO();
		
		String boardId = request.getParameter("boardId");
		replyDTO.setBoardId(Long.parseLong(boardId));
		replyDTO.setReplyId(Long.parseLong(request.getParameter("replyId")));
		replyDTO.setPasswd(request.getParameter("passwd"));
		replyDTO.setContent(request.getParameter("content"));
		
		if (BoardAdvancedDAO.getInstance().updateReply(replyDTO)) {
	%>
			<script>
				alert('수정 되었습니다.');
				location.href = "../board/boardDetail.jsp?boardId=<%=boardId%>";
			</script>
	<% 
		}
		else {										
	%>
			<script>
				alert("패스워드를 확인하세요.");
				history.go(-1);
			</script>
	<%			
		}
	%>
</body>
</html>