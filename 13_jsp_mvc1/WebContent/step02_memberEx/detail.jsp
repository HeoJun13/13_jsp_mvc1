
<%@page import="step02_memberEx.MemberDAO"%>
<%@page import="step02_memberEx.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<script>

	function deleteMember() {
		
		if (confirm("정말로 탈퇴하시겠습니까?")) {
			location.href = "deleteMember";
		}
		
	}
	
</script>
</head>
<body>

	<% 
		String memberId = (String)session.getAttribute("memberId");
		MemberDTO memberDTO = MemberDAO.getInstance().getMemberDetail(memberId);
	%>
	
	<div align="center">
		<h3><%=memberDTO.getMemberNm() %>님 회원정보조회</h3>
		<p>
			<a href="logout.jsp">로그아웃</a>&emsp;
			<a href="update.jsp">수정하기</a>&emsp;
			<a href="delete.jsp">탈퇴하기</a>
		</p>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><%=memberDTO.getMemberId() %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=memberDTO.getMemberNm() %></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<%
						if (memberDTO.getSex().equals("m")) {
					%>
							남자
					<% 		
						}
						else {
					%>
							여자
					<% 		
						}
					%>
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><%=memberDTO.getBirthDt() %></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<%=memberDTO.getHp() %>
					<%
						if (memberDTO.getSmsRecvAgreeYn().equals("Y")) {
					%>
							(문자 수신동의)
					<% 
						}
						else {
					%>
							(문자 수신 비동의)
					<% 
						}
					%>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<%=memberDTO.getEmail() %>
					<%
						if (memberDTO.getEmailRecvAgreeYn().equals("Y")) {
					%>
							(메일 수신동의)
					<% 
						}
						else {
					%>
							(메일 수신 비동의)
					<% 
						}
					%>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					우편번호 : <%=memberDTO.getZipcode() %><br>
					도로명 주소 : <%=memberDTO.getRoadAddress() %><br>
					지번 주소 : <%=memberDTO.getJibunAddress() %> <br>
					나머지 주소 : <%=memberDTO.getNamujiAddress() %>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>