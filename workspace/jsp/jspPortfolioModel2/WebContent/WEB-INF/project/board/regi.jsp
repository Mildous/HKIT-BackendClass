<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<h2>게시글등록</h2>

<form name="DirForm" method="post" action="${ path }/board_servlet/board_regiProc.do" >
<%-- <input type="text" name="no" id="no" value="${ dto.no }"> --%>
<table border="1" align="center" width="80%">
	<tr>
		<td width="150px" align="center">작성자</td>
		<td>
			<input type="text" name="writer" id="writer" value="">
		</td>
	</tr>
	<tr>
		<td align="center">이메일</td>
		<td>
			<input type="text" name="email" id="email" value="">
		</td>
	</tr>
	<tr>
		<td align="center">비밀번호</td>
		<td>
			<input type="password" name="passwd" id="passwd" value="">
		</td>
	</tr>
	<tr>
		<td align="center">제목</td>
		<td>
			<input type="text" name="subject" id="subject" value="">
		</td>
	</tr>
	<tr>
		<td align="center">내용</td>
		<td>
			<textarea style="width: 300px; height: 140px;" name="content"></textarea>
		</td>
	</tr>
	<tr>
		<td align="center">공지글</td>
		<td>
			<input type="radio" name="noticeGubun" id="noticeGubun1" value="T">공지글 &nbsp;
			<input type="radio" name="noticeGubun" id="noticeGubun2" value="F" checked>공지글아님 &nbsp;
		</td>
	</tr>
	<tr>
		<td align="center">비밀글</td>
		<td>
			<input type="radio" name="secretGubun" id="secretGubun1" value="T">비밀글 &nbsp;
			<input type="radio" name="secretGubun" id="secretGubun2" value="F" checked>비밀글아님 &nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="submit">등록하기</button>
			<button type="button" onclick="location.href='${ path }/board_servlet/board_list'">목록으로</button>
		</td>
	</tr>
</table>
</form>