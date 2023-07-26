<%@page import="step02_memberEx.MemberDTO"%>
<%@page import="step02_memberEx.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	
	            var fullRoadAddr = data.roadAddress; 
	            var extraRoadAddr = ''; 
	
	            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            if (data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            if (extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            if (fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('roadAddress').value = fullRoadAddr;
	            document.getElementById('jibunAddress').value = data.jibunAddress;
	          
	        }
	    }).open();
	}
</script>
<script>


	function sendData() {
		
		var birthY = document.getElementById("birthY").value;
		var birthM = document.getElementById("birthM").value;
		var birthD = document.getElementById("birthD").value;
		
		document.getElementById("birthDt").value = birthY + "-" + birthM + "-" + birthD;
		
	}


</script>
</head>
<body>
	
	<% 
		String memberId = (String)session.getAttribute("memberId");
		MemberDTO memberDTO = MemberDAO.getInstance().getMemberDetail(memberId);
		
		String birthY = memberDTO.getBirthDt().substring(0, 4);
		String birthM = memberDTO.getBirthDt().substring(5, 7);
		String birthD = memberDTO.getBirthDt().substring(8);
		
	%>
	
	<div align="center">
		<form action="updatePro.jsp" method="post" onsubmit="sendData();">
			<h3>정보 수정</h3>
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" id="memberId" name="memberId" value="<%=memberDTO.getMemberId()%>" readonly>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="passwd" value="<%=memberDTO.getPasswd()%>" ></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="memberNm" value="<%=memberDTO.getMemberNm()%>"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						남자 &nbsp;<input type="radio" name="sex" value="m" 
							<%
								if(memberDTO.getSex().equals("m")) {
							%>
									checked
							<% 
								}
							%>
						> &emsp;
						여자 &nbsp;<input type="radio" name="sex" value="f"
							<%
								if(memberDTO.getSex().equals("f")) {
							%>
									checked
							<% 
								}
							%>
						
						>
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						 <select id="birthY">
						 	<%
						 		for (int i = 2023; i >= 1920; i--) {
						 	%>
						 			<option 
						 				<%
						 					if (Integer.parseInt(birthY) == i) {
						 				%>
						 						selected
						 				<% 		
						 					} 
						 				%>
						 			><%=i %></option>
						 	<% 
						 		}
						 	%>
				        </select>년 
			          	<select id="birthM">
				          		<%
					          		String month = "1";
							 		for (int i = 1; i <= 12; i++) {
							 			
							 			if (i < 10) {
							 				month = "0"+ i;
							 			}
							 			else {
							 				month = i + "";
							 			}
						 			
						 	%>
									<option <%if (birthM.equals(month)) {%>    selected    <% } %> ><%=month %></option>
						 	<% 
								}	
						 	%>
				         </select>월
				         <select id="birthD">
				          	<%	
				          		String day = "1";
						 		for (int i = 1; i <= 31; i++) {
						 			if (i < 10) {
						 				day = "0"+ i;
						 			}
						 			else {
						 				day = i + "";
						 			}
						 			
						 	%>
									<option <%if (birthD.equals(day)) {%>    selected    <% } %> ><%=day %></option>
						 	<% 
								}	
						 	%>
				         </select>일
				         <input type="hidden" id="birthDt" name="birthDt"/>
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="text" name="hp" value="<%=memberDTO.getHp() %>"><br>
						SMS 소식을 수신합니다. <input type="checkbox" name="smsRecvAgreeYn" value="Y"
							<%
								if(memberDTO.getSmsRecvAgreeYn().equals("Y")) {
							%>
									checked
							<% 
								}
							%>
						>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="email" value="<%=memberDTO.getEmail() %>"><br>
						E-mail을 수신합니다.  <input type="checkbox" name="emailRecvAgreeYn" value="Y"
							<%
								if(memberDTO.getEmailRecvAgreeYn().equals("Y")) {
							%>
									checked
							<% 
								}
							%>
						
						>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						우편번호 : <input type="text" id="zipcode" name="zipcode" value="<%=memberDTO.getZipcode() %>">
						<input type="button" value="검색" onclick="execDaumPostcode();"> <br><br>
						도로명 주소 : <input type="text" id="roadAddress" name="roadAddress" value="<%=memberDTO.getRoadAddress() %>"><br>
						지번 주소 : <input type="text" id="jibunAddress" name="jibunAddress" value="<%=memberDTO.getJibunAddress() %>"><br>
						나머지 주소 : <input type="text" id="namujiAddress" name="namujiAddress" value="<%=memberDTO.getNamujiAddress() %>">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<button type="submit">수정하기</button>
					</td>
				</tr>
			</table>
		</form>		
	</div>
	
</body>
</html>