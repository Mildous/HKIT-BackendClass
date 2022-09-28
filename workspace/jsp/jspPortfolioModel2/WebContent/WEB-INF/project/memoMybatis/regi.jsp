<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<%@ include file="_inc_top.jsp" %>

<h2>메모등록(Mybatis)</h2>

<form name="DirForm" method="post" action="${ path }/memoMybatis_servlet/memoMybatis_regiProc.do" >
<table border="1" align="center" width="60%">
	<tr>
		<td width="150px" align="center">작성자</td>
		<td>
			<input type="text" name="writer" id="writer" value="">
		</td>
	</tr>
	<tr>
		<td align="center">내용</td>
		<td>
			<textarea style="width: 300px; height: 140px;" name="content"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="submit">등록하기</button>
			<button type="button" onclick="location.href='${ path }/memoMybatis_servlet/memoMybatis_list'">목록으로</button>
		</td>
	</tr>
</table>
</form>
