<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 인코딩
	request.setCharacterEncoding("UTF-8");
	
	String[] array = new String[2];
	
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
	
	String p1 = "";
	p1 += id + "/" + pw + "/" + name + "/" + nick + "/" + jumin1 +
			"/" + jumin2 + "/" + tel1 + "/" + tel2 + "/" + tel3 +
			"/" + addr + "/" + email + "/" + email2;
	
	String id2 = request.getParameter("id2");
	String pw2 = request.getParameter("pw2");
	String name2 = request.getParameter("name2");
	String nick2 = request.getParameter("nick2");
	String jumin12 = request.getParameter("num11");
	String jumin22 = request.getParameter("num21");
	String tel12 = request.getParameter("tel11");
	String tel22 = request.getParameter("tel21");
	String tel32 = request.getParameter("tel31");
	String addr2 = request.getParameter("addr2");
	String email12 = request.getParameter("email1");
	String email22 = request.getParameter("email21");
	
	String p2 = "";
	p2 += id2 + "/" + pw2 + "/" + name2 + "/" + nick2 + "/" + jumin12 +
			"/" + jumin22 + "/" + tel12 + "/" + tel22 + "/" + tel32 +
			"/" + addr2 + "/" + email12 + "/" + email22;
	
	String p3 = p1 + "|" + p2;
	
	array[0] = p1;
	array[1] = p2;
%>	

<%= p1 %>
<hr>
<%= p2 %>
<hr>
<%= p3 %>
<hr>
<%= array.length%> / <%= array[0] %> / <%= array[1] %>