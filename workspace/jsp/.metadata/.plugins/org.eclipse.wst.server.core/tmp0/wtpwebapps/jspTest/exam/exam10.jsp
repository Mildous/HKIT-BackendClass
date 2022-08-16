<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam10.jsp</title>
</head>
<body>
	<h2>exam10.jsp</h2>
	<%-- 
	<%
	for(int i=2; i<10; i++) {
	%>
		<table border="1">
		<%
		for(int j=1; j<10; j++) {
			out.print("<tr>");
			out.print("<td>" + i + "</td><td>*</td><td>" + j + "</td><td>=</td><td>" + i*j + "</td>");
			out.print("</tr>");
		}
		%>
		</table>
		<hr>
	<%
	}
	%>
	--%>
<!-- ----------------------------------------------------------- -->
<!-- ----------------------------------------------------------- -->
<%
request.setCharacterEncoding("UTF-8");

	

String dan_ = request.getParameter("dan");
int dan = 0;
if(dan_ == null) {
	dan_ = "";
} else {
	dan = Integer.parseInt(dan_);
	if(dan>0) {
		out.print("<h2>< " + dan + "단 ></h2>");
		for(int i=dan; i<=dan; i++) {
			out.print("<table border='1'>");
				for(int j=1; j<10; j++) {
				out.print("<tr><td>" + i + "</td>");
				out.print("<td>*</td>");
				out.print("<td>" + j + "</td>");
				out.print("<td>=</td>");
				out.print("<td>" + i*j + "</td></tr>");
			}
			out.print("</table>");
		}
	}
}
%>
	<%
	if(dan==0) {
	%>
		<form name="exam10Form">
		단 입력 : <input type="text" name="dan" value="<%= dan_ %>">&nbsp;
		<button type="button" onClick="formSubmit();">확인</button><br>
		</form>
	<%
	}
	%>

<script>
function formSubmit() {
	document.exam10Form.action = "exam10.jsp";
	document.exam10Form.method = "post";
	document.exam10Form.submit();
}

</script>
</body>
</html>