<%@page import="step02_memberEx.MemberDAO"%>
<%@page import="step02_memberEx.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro</title>
</head>
<body>

	<% 
		
		request.setCharacterEncoding("utf-8");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberId(request.getParameter("memberId"));
		memberDTO.setPasswd(request.getParameter("passwd"));
		
		if (MemberDAO.getInstance().loginMember(memberDTO)) {
			
			session.setAttribute("memberId", request.getParameter("memberId"));
			
	%>
			<script>
				alert("로그인 되었습니다.");
				location.href = "detail.jsp";
			</script>
	<% 		
		}
		else {
	%>
			<script>
				alert("아이디와 비밀번호를 확인하세요.");
				history.go(-1);
			</script>
	<% 		
		}
	%>

</body>
</html>