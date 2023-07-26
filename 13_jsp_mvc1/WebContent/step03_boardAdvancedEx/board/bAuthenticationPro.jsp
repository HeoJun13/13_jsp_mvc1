<%@page import="step03_boardAdvancedEx.BoardAdvancedDAO"%>
<%@page import="step03_boardAdvancedEx.MainBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		
		String boardId = request.getParameter("boardId");
	
		MainBoardDTO bainBoardDTO = new MainBoardDTO();
		bainBoardDTO.setBoardId(Long.parseLong(boardId));
		bainBoardDTO.setPasswd(request.getParameter("passwd"));
	
		String menu = request.getParameter("menu");
		
		if (BoardAdvancedDAO.getInstance().checkAuthorizedUser(bainBoardDTO)) {
	
			if (menu.equals("update")) {
	%>
				<script>
					location.href = "boardUpdate.jsp?boardId=" + <%=boardId%>;
				</script>
	<% 	
			}
			else if (menu.equals("delete")){
				response.sendRedirect("boardDelete.jsp?boardId=" + boardId);
			}
	
		}
		else {
	%>
			<script>
				alert("패스워드가 틀렸습니다.");
				history.go(-1);
			</script>
	<%				
		}
	%>	
</body>
</html>