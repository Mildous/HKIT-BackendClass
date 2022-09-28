<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:if test="${ sessionScope.sessionNo == null || sessionScope.sessionNo == '' || sessionScope.sessionNo == 0 }">
	<script>
		alert('로그인 후 이용바랍니다.');
		location.href = '${ path }';
	</script>
</c:if>