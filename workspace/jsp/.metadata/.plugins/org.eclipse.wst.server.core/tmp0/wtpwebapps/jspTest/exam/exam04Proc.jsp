<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 인코딩
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String jumin1 = request.getParameter("num1");
	String jumin2 = request.getParameter("num2");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String addr = request.getParameter("addr");
	String email = request.getParameter("email");
	String email2 = request.getParameter("email2");
	String gender = request.getParameter("gender");
	
	out.println(id + "<br>");
	out.println(pw + "<br>");
	out.println(name + "<br>");
	out.println(nick + "<br>");
	out.println(jumin1 + "-" + jumin2 + "<br>");
	out.println(tel1 + "-" + tel2 + "-" + tel3 + "<br>");
	out.println(addr + "<br>");
	out.println(email + "@" + email2 + "<br>");
	out.println(gender + "<br>");
	
%>	
	<a href="exam04Result.jsp?id=<%= id %>&name=<%= name %>">완료 페이지로 이동</a>
	
<script>
function move() {
	location.href = "exam04Result.jsp?id=<%= id %>&name=<%= name %>";
}

move();
</script>