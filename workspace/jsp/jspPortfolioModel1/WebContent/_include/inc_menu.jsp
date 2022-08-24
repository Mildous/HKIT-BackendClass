<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<%@ include file="../_include/inc_sessionChk.jsp" %>

<style>
#aStyle {
	text-decoration-line: none;
	color: inherit;
}
a:link {
  color : black;
}
a:visited {
  color : #002B5B;
}
a:hover {
  color : #D1512D;
}
a:active {
  color : green;
}

.bgHover:hover	{
	background-color: white;
	transition: background-color 1s;
	border-radius: 50px;
}
</style>

<table align="center" width="80%">
	<tr>
		<td colspan="7" align="right" style="padding: 0px 10px 10px 0px;">
		
		<%	if(sessionNo == 0) { %>
				<a href="main.jsp?menuGubun=noLogin_login">[로그인]</a>
		<%	} else { %>
				<%= sessionGrade %> <%= sessionName %>님 환영합니다. 
				<a href="main.jsp?menuGubun=noLogin_logout">[로그아웃]</a>
		<%	}  %>
			
		</td>
	</tr>
	<tr>
		<td align="center" style="padding: 10px;" id="home" class="bgHover">
			<a href="<%= path %>">Home</a>
		</td>
		<td align="center" style="padding: 10px;" id="member" class="bgHover">
			<a href="<%= path %>/main/main.jsp?menuGubun=member_list" >회원관리</a>
		</td>
		<td align="center" style="padding: 10px;" id="memo" class="bgHover">
			<a href="<%= path %>/main/main.jsp?menuGubun=memo_list" >메모장</a>
		</td>
		<td align="center" style="padding: 10px;" id="guestBook" class="bgHover">
			<a href="<%= path %>/main/main.jsp?menuGubun=guestBook_list" >방명록</a>
		</td>
		<td align="center" style="padding: 10px;" id="boardBasic" class="bgHover">
			<a href="<%= path %>/main/main.jsp?menuGubun=boardBasic_list" >게시판(B)</a>
		</td>
		<td align="center" style="padding: 10px;" id="menu3">
			메뉴4
		</td>
		<td align="center" style="padding: 10px;" id="menu4">
			메뉴5
		</td>
	</tr>
</table>

<script>
function applyMenuId() {
	$("#<%= folderName %>").css("background-color", "#F7F6F2");
	$("#<%= folderName %>").css("border-radius", "50px");
}
applyMenuId();
</script>