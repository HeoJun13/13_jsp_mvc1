<%@page import="step01_boardEx.BoardDTO"%>
<%@page import="step01_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bUpdate</title>
<script src="../ckeditor/ckeditor.js"></script>
</head>
<body>

	<% 
	
		long boardId = Long.parseLong(request.getParameter("boardId"));
		BoardDTO boardDTO = BoardDAO.getInstance().getBoardDetail(boardId);
	
	%>

	<div align="center">
		<h3>게시글 수정</h3>
		<form action="bUpdatePro.jsp" method="post" >
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
					<td><input type="text" size="70" name="subject" value="<%=boardDTO.getSubject()%>"></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td>
						<textarea rows="10" cols="60" name="content"><%=boardDTO.getContent() %></textarea>
						<script>CKEDITOR.replace("content");</script>
					</td>
				</tr>
			</table>
			<p>
				<input type="hidden"  name="boardId" value="<%=boardId%>">
				<input type="submit" value="수정하기" />
				<input type="button" onclick="location.href='bList.jsp'" value="목록보기" />
			</p>
		</form>
	</div>


</body>
</html>