<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<h2>방명록등록</h2>

<form name="DirForm" method="post" action="${ path }/guestBook_servlet/guestBook_regiProc.do" >
<table border="1" align="center" width="60%">
	<tr>
		<td width="150px" align="center">이름</td>
		<td>
			<input type="text" name="name" id="name" value="">
		</td>
	</tr>
	<tr>
		<td align="center">이메일</td>
		<td>
			<input type="text" name="email" id="email" value="">
		</td>
	</tr>
	<tr>
		<td align="center">내용</td>
		<td>
			<textarea style="width: 300px; height: 140px;" name="content"></textarea>
		</td>
	</tr>
	<tr>
		<td align="center">비밀번호</td>
		<td>
			<input type="password" name="passwd" id="passwd" value="">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="submit">등록하기</button>
			<button type="button" onclick="location.href='${ path }/guestBook_servlet/guestBook_list'">목록으로</button>
		</td>
	</tr>
</table>
</form>