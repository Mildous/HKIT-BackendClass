<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<%@ include file="../../_include/inc_menu.jsp" %>

<h2>디렉토리 목록 및 삭제</h2>

<form name="imsiForm">
<input type="hidden" name="fileInfo"style="width: 500px;">
</form>

<c:set var="k" value="${ k = 0 }" />
<c:forEach var="fileFolderName" items="${ list }" varStatus="loop">
	<input type="hidden" name="box_${ k }" id="box_${ k }" value="${ fileFolderName.substring(3) }" style="width: 500px;">
	<a href="#" onclick="del('box_${ k }');">[삭제]</a> : ${ fileFolderName.substring(3) }<hr>
	<c:set var="k" value="${ k = k + 1 }" />
</c:forEach>

<script>
function del(value1) {
	if(confirm('정말 삭제할까요?')) {
		var info = document.getElementById(value1).value;
		document.imsiForm.fileInfo.value = info;
		
		document.imsiForm.action = "${ path }/test10Proc";
		document.imsiForm.method = "post";
		document.imsiForm.submit();
	}
}
</script>

</body>
</html>