<%@page import="subBoard.model.dto.SubBoardCommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="subBoard.model.dao.SubBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<%@ include file="../_include/inc_sessionChk.jsp" %>

<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	SubBoardDAO subBoardDao = new SubBoardDAO();
	ArrayList<SubBoardCommentDTO> list = subBoardDao.getCommentSelectAll(no);
%>

<table border="1" align="center" style="width: 100%; margin-bottom: 10px;">
	<tr>
		<td style="padding: 0 0 20px 0;" >
			proGubun : <span id="procGubun" style="display: ;">insertProc</span><br>
			no : <span id="no" style="display: ;"><%=no %></span><br>
			commentNo : <span id="commentNo" style="display: ;"></span><br>
			이름 : <input type="text" name="commentWriter" id="commentWriter" size="10" value="">
			비밀번호 : <input type="password" name="commentPasswd" id="commentPasswd" size="10" value=""><br>
			댓글 : <input type="text" name="commentContent" id="commentContent" value="" size="40">
			<button type="button" id="btnCommentSave">등록하기</button>
			<button type="button" id="btnCommentReset">초기화</button>
		</td>
	</tr>
</table>

<table border="0" align="center" style="width: 100%; padding: 10px 0px;">
<%	for(SubBoardCommentDTO dto : list) { %>
	<tr>
		<td style="padding: 10px 0 10px 0;">
			<table border="0" align="center" width="100%">
				<tr>
					<td><%= dto.getWriter() %>(<%= dto.getCommentNo() %>) &nbsp; <%= dto.getRegiDate() %></td>
					<td align="right">
						<a href="#comment" onclick="suntaek('updateProc', '<%= dto.getCommentNo() %>', '<%= dto.getWriter() %>', '<%= dto.getContent() %>', '수정하기')">수정</a> / 
						<a href="#comment" onclick="suntaek('deleteProc', '<%= dto.getCommentNo() %>', '<%= dto.getWriter() %>', '<%= dto.getContent() %>', '삭제하기')">삭제</a>
					</td>
				</tr>
				<tr>
					<td colspan="2"><%= dto.getContent().replaceAll("\n\r", "<br>") %></td>
				</tr>
			</table>
			<hr>
		</td>
	</tr>
<%	} %>
</table>

<input type="hidden" id="result">

<script>
$(document).ready(function(){
	$("#btnCommentSave").click(function(){
		commentSave();
	});
	$("#btnCommentReset").click(function(){
		commentReset();
	});
});

function commentSave() {
  	var param = {
  		"procGubun" : $("#procGubun").text(),
		"no" : $("#no").text(),
		"commentNo" : $("#commentNo").text(),
		"writer" : $("#commentWriter").val(),
		"passwd" : $("#commentPasswd").val(),
		"content" : $("#commentContent").val()
	}
	var url = "../subBoard/commentInsertProc.jsp";
	$.ajax({
		type: "post",
		data: param,
		url: url,
		success: function(data) {
			$("#result").val(data);
			if($("#result").val() == 1) {
				alert("성공");
			} else {
				alert("실패");
			}
			commentList();
		}
	});
}

function suntaek(value1, value2, value3, value4, value5) {
	$("#procGubun").text(value1);
	$("#commentNo").text(value2);
	$("#commentWriter").val(value3);
	$("#commentContent").val(value4);
	$("#btnCommentSave").text(value5);
}

function commentReset() {
	$("#procGubun").text('insert');
	$("#commentNo").text('');
	$("#commentWriter").val('');
	$("#commentContent").val('');
	$("#btnCommentSave").text('등록하기');
}
</script>