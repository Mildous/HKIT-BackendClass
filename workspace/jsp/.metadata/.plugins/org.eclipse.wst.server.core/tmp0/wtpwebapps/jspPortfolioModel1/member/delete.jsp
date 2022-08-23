<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	MemberDTO arguDto = new MemberDTO();
	arguDto.setNo(no);
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getSelectOne(arguDto);
	
	if(dto.getNo() <= 0) {
		out.println("<script>alert('존재하지 않는 회원입니다.'); location.href='main.jsp?menuGubun=member_list';</script>");
		return;
	}
%>

<h2>회원삭제</h2>
<form name="deleteForm">
<input type="hidden" name="no" value="<%= dto.getNo() %>">
<table border="1" align="center" width="80%">
	<tr>
		<td>아이디</td>
		<td><%= dto.getId() %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%= dto.getName() %></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><%= dto.getPhone() %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%= dto.getEmail() %></td>
	</tr>
	<tr>
		<td>주민번호</td>
		<td><%= dto.getJumin().substring(0, 8) %>******</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>(<%= dto.getJuso1() %>) <%= dto.getJuso2() %> <%= dto.getJuso3() %> <%= dto.getJuso4() %></td>
	</tr>
	<tr>
		<td>회원등급</td>
		<td><%= dto.getGrade() %></td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
			<input type="hidden" name="attachInfo" value="<%= dto.getAttachInfo() %>">
			<%
				if(dto.getAttachInfo() == null || dto.getAttachInfo().equals("-")) {
					out.println("&nbsp;");
				} else {
					String[] imsiArray = dto.getAttachInfo().split(",");
					for(int j=0; j<imsiArray.length; j++) {
						String[] imsiArray2 = imsiArray[j].split("[|]");
							
						String imsiImgPath = "";
						imsiImgPath += request.getContextPath();
						imsiImgPath += "/attach";
						imsiImgPath += request.getContextPath();
						imsiImgPath += "/member/";
						imsiImgPath += imsiArray2[1];
							
						out.println("<img src='" + imsiImgPath + "' width='50' height='50'><br>" + imsiArray2[0] + " (" + imsiArray2[3] + ")<br>");
					}
				}
			%>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="drop();">삭제하기</button>
			<button type="button" onClick="location.href='main.jsp?menuGubun=member_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function drop() {
	if(confirm('삭제할까요?')) {
		document.deleteForm.action = "mainProc.jsp?menuGubun=member_deleteProc";
		document.deleteForm.method = "post";
		document.deleteForm.submit();
	}
}
</script>