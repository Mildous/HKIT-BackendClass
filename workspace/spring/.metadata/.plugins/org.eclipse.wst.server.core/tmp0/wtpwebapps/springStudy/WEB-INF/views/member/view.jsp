<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
</head>
<body>

<%@include file="../_include/inc_menu.jsp" %>

<h2>${ title }</h2>
<table border="1">
	<tr>
       <td>아이디 : </td>
       <td>${ dto.id }</td>
    </tr>
    <tr>
       <td>이름 : </td>
       <td>${ dto.name }</td>
    </tr>
    <tr>
       <td>연락처 : </td>
       <td>${ dto.phone }</td>
    </tr>
    <tr>
       <td>이메일 : </td>
       <td>${ dto.email }</td>
    </tr>
    <tr>
       <td>주민번호 : </td>
       <td>${ dto.jumin }</td>
    </tr>
    <tr>
       <td>주소 : </td>
          <td>(#{ dto.juso1 }) #{ dto.juso2 } #{ dto.juso3 } #{ dto.juso4 }</td>
    </tr>
    <tr>
       <td>회원등급 : </td>
       <td>#{ dto.grade }</td>
    </tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onclick="move('edit', '${ dto.no }');">수정</button>
			<button type="button" onclick="move('drop', '${ dto.no }');">삭제</button>
			<button type="button" onclick="move('list', '');">목록</button>
		</td>
	</tr>
</table>

<script>
function move(value1, value2) {
	location.href='${ path }/member/' + value1 + '?no=' + value2;
}

</script>


</body>
</html>