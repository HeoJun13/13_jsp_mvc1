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
	
		String menu = request.getParameter("menu");
		long boardId = Long.parseLong(request.getParameter("boardId"));
		MainBoardDTO mainBoardDTO = BoardAdvancedDAO.getInstance().getBoardDetail(boardId);
	
	%>
	
	<div align="center"> 
		<h3>사용자 인증</h3>
		<form action="bAuthenticationPro.jsp" method="post">
			<table border="1">
				<tr>
					<td>작성자</td>
					<td><%=mainBoardDTO.getWriter()%></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=mainBoardDTO.getEnrollDt()%></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><%=mainBoardDTO.getSubject()%></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="passwd"></td>
				</tr>
			</table>
			<p>
				<input type="hidden" name="boardId" value="<%=mainBoardDTO.getBoardId()%>" /> 
				<input type="hidden" name="menu" value="<%=menu%>" /> 
				<input type="submit" value="인증" />
				<input type="button" onclick="location.href='boardList.jsp'" value="목록보기" />
			</p>
		</form>
	</div>

</body>
</html>