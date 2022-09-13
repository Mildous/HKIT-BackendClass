<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="_inc_top.jsp" %>

<%	
	String viewPasswd = request.getParameter("viewPasswd");
	if(viewPasswd == null || viewPasswd.trim().equals("")) {
		viewPasswd = "";
	}
	
	SubBoardDTO arguDto = new SubBoardDTO();
	arguDto.setNo(no);
	arguDto.setField(searchField);
	arguDto.setWord(searchWord);
	arguDto.setTbl(tbl);
	
	SubBoardDAO dao = new SubBoardDAO();
	dao.setUpdateHit(arguDto);
	SubBoardDTO dto = dao.getSelectOne(arguDto);
	
	if(dto.getNo() <= 0) {
		return;
	}
	
	String imsiPage = "viewPage";
	if(dto.getSecretGubun().equals("T")) {
		if(!dto.getPasswd().equals(viewPasswd)) {
			imsiPage = "viewPasswdPage";
		}
	}
	
%>
<%	if(imsiPage.equals("viewPasswdPage")) {	%>
	<form name="passwdForm">
	<input type="hidden" name="no" value="<%= no %>">
	<input type="hidden" name="searchField" value="<%= searchField %>">
	<input type="hidden" name="searchWord" value="<%= searchWord %>">
	<table>
		<tr>
			<td colspan="2" align="center" >
				<h2>비밀글입니다</h2>
			</td>
		</tr>
		<tr>
			<td align="center">
				비밀번호 : &nbsp;
				<input type="password" name="viewPasswd" id="view_passwd">
				<button type="button" onclick="passwdSubmit();">확인</button>
			</td>
		</tr>
	</table>
	</form>
	<script>
		function passwdSubmit() {
			passwdForm.action = "main.jsp?menuGubun=subBoard_view";
			passwdForm.method = "post";
			passwdForm.submit();
		}
	</script>
<%	} else { %>

<h2><%= imsiBoardTitle %> 게시글 상세보기</h2>
<table border="1" align="center" width="80%">
	<tr>
		<th>번호</th>
		<td><%= dto.getNum() %></td>
		<th>조회수</th>
		<td><%= dto.getHit() %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%= dto.getWriter() %></td>
		<th>이메일</th>
		<td><%= dto.getEmail() %></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><%= dto.getSubject() %></td>	
		<th>작성일</th>
		<td><%= dto.getRegiDate() %></td>
	</tr>
	<tr>
		<th>ip</th>
		<td colspan="3"><%= dto.getIp() %></td>	
	</tr>
		<tr>
		<th>공지글</th>
		<td><%= dto.getNoticeNo() %></td>	
		<th>비밀글</th>
		<td><%= dto.getSecretGubun() %></td>
	</tr>
	<tr>
		<th>첨부</th>
		<td colspan="3"><%= dto.getAttachInfo()%></td>
	</tr>	
	<tr>
		<th>내용</th>
		<td colspan="3" height="100">
			<%= dto.getContent().replace("\n", "<br>") %>
		</td>
	</tr>
</table>

<div style="padding-top: 20px; width: 80%; " align="right">
	|
	<a href="#" onClick="move('subBoard_insert', '<%= tbl %>', '<%= no %>');">답변글달기</a>
	|
	<a href="#" onClick="move('subBoard_list', '<%= tbl %>', '');">목록</a>
	|
	<a href="#" onClick="move('subBoard_write', '<%= tbl %>');">등록</a>
	|
	<a href="#" onClick="move('subBoard_update', '<%= tbl %>', '<%= dto.getNo() %>');">수정</a>
	|
	<a href="#" onClick="move('subBoard_delete', '<%= tbl %>', '<%= dto.getNo() %>');">삭제</a>
	|
</div>
<%	} %>
<script>
function move(value1, value2, value3) {
	location.href='main.jsp?menuGubun=' + value1 + "&tbl=" + value2 + '&no=' + value3 + '&searchField=<%= searchField %>&searchWord=<%= searchWord %>';
}

</script>

<div style="padding-top: 20px; width: 80%; " align="left">
	<table>
		<tr>
		<td width="100px">이전글</td>
	<%
		if((Object)dto.getPreNo() == null || dto.getPreNo() == 0) {
			out.println("<td>이전글이 없습니다..</td>");
		} else {
	%>
			<td><a href="#" onClick="move('subBoard_view', '<%= dto.getTbl() %>', '<%= dto.getPreNo() %>');"><%= dto.getPreSubject() %></a></td>
	<%		
		}
	%>	
		</tr>
		<tr>
		<td width="100px">다음글</td>
	<%
		if((Object)dto.getNxtNo() == null || dto.getNxtNo() == 0) {
			out.println("<td>다음글이 없습니다..</td>");
		} else {
	%>
			<td><a href="#" onClick="move('subBoard_view', '<%= dto.getTbl() %>', '<%= dto.getNxtNo() %>');"><%= dto.getNxtSubject() %></a></td>
	<%		
		}
	%>	
		</tr>
	</table>
</div>

<%	if(imsiPage.equals("viewPage")) { %>
	<a name="comment"></a>
	<div id="commentResult" style="margin: 20px 0px 20px 0px; width: 80%; " align="center"></div>
	
	
	<script>
	$(document).ready(function() {
		commentList();
	});
	
	function commentList() {
		var param = {
				"no" : <%= no %>
		}
		var url = "../subBoard/commentList.jsp";
		$.ajax({
			type: "post",
			data: param,
			url: url,
			success: function(data) {
				$("#commentResult").html(data);
			}
		});
	}
	</script>

<% } %>

