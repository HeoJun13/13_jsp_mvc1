<%@page import="step01_boardEx.BoardDAO"%>
<%@page import="step01_boardEx.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bAuthentication</title>
</head>
<body>
	<%
		String menu = request.getParameter("manu");
		long boardId = Long.parseLong(request.getParameter("boardId"));
		BoardDTO boardDTO = BoardDAO.getInstance().getBoardDetail(boardId);
	
	%>
	
	<div align="center"> 
		<h3>사용자 인증</h3>
		<form action="bAuthenticationPro.jsp" method="post">
			<table border="1">
				<tr>
					<td>작성자</td>
					<td><%=boardDTO.getWriter() %></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=boardDTO.getEnrollDt() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><%=boardDTO.getSubject() %></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="password"></td>
					<td></td>
				</tr>
			</table>
			<p>
				<input type= "hidden" name="menu" value="<%=menu %>>">
				<input type="hidden" name="boardId" value="<%=boardDTO.getBoardId() %>">
				<input type="submit" value="인증" />
				<input type="button" onclick="location.href='bList.jsp'" value="목록보기" />
			</p>
		</form>
	</div>

</body>
</html>