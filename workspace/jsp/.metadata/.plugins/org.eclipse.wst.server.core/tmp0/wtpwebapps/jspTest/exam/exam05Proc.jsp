<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 인코딩
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	
	out.println("name : " + name + "<br>");
	out.println("age : " + age + "<br>");
	out.println("gender : " + gender + "<br>");
	
%>
<form name="examForm">
<input type="text" name="name" value=<%= name %>>
<input type="text" name="age" value=<%= age %>>
<input type="text" name="gender" value=<%= gender %>>
</form>

<script>
	function formSubmit() {
		document.examForm.action = "exam05Result.jsp";
		document.examForm.method = "post";
		document.examForm.submit();
	}
	formSubmit();
</script>