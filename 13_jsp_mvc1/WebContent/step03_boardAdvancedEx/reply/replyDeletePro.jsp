<%@page import="step03_boardAdvancedEx.ReplyDTO"%>
<%@page import="step03_boardAdvancedEx.BoardAdvancedDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>replyDeletePro</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		ReplyDTO replyDTO = new ReplyDTO();
	
		String boardId = request.getParameter("boardId");
		replyDTO.setBoardId(Long.parseLong(boardId));
		replyDTO.setReplyId(Long.parseLong(request.getParameter("replyId")));
		replyDTO.setPasswd(request.getParameter("passwd"));
		
		if (BoardAdvancedDAO.getInstance().deleteReply(replyDTO)) {
	%>
			<script>
				alert("삭제 되었습니다.");
				location.href = "../board/boardDetail.jsp?boardId=<%=replyDTO.getBoardId()%>";
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