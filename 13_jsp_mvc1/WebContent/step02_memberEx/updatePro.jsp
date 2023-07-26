<%@page import="step02_memberEx.MemberDTO"%>
<%@page import="step02_memberEx.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePro</title>
</head>
<body>
	
	<% 
	
		request.setCharacterEncoding("utf-8");
	
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberId(request.getParameter("memberId"));
		memberDTO.setMemberNm(request.getParameter("memberNm"));
		memberDTO.setPasswd(request.getParameter("passwd"));
		memberDTO.setSex(request.getParameter("sex"));
		memberDTO.setBirthDt(request.getParameter("birthDt"));
		memberDTO.setHp(request.getParameter("hp"));
		if (request.getParameter("smsRecvAgreeYn") == null) memberDTO.setSmsRecvAgreeYn("N");								// 체크박스가 선택이 안되어있으면 N 지정
		else										  		memberDTO.setSmsRecvAgreeYn(request.getParameter("smsRecvAgreeYn"));    // 체크박스가 선택이 되어있으면 Y지정
		memberDTO.setEmail(request.getParameter("email"));
		if (request.getParameter("emailRecvAgreeYn") == null) memberDTO.setEmailRecvAgreeYn("N");								// 체크박스가 선택이 안되어있으면 N 지정
		else 												  memberDTO.setEmailRecvAgreeYn(request.getParameter("emailRecvAgreeYn"));	// 체크박스가 선택이 되어있으면 Y지정						
		memberDTO.setZipcode(request.getParameter("zipcode"));
		memberDTO.setRoadAddress(request.getParameter("roadAddress"));
		memberDTO.setJibunAddress(request.getParameter("jibunAddress"));
		memberDTO.setNamujiAddress(request.getParameter("namujiAddress"));
	
		MemberDAO.getInstance().updateMember(memberDTO);
	
	%>
	
	<script>
		alert("수정 되었습니다.");
		location.href = "detail.jsp";
	</script>
	
</body>
</html>