<%@page import="member.DAO"%>
<%@page import="member.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String job = request.getParameter("job");
	
	DTO dto = new DTO();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setName(name);
	dto.setPhone(phone);
	dto.setJob(job);
	
	DAO dao = new DAO();
	int result = dao.setInsert(dto);
	
	if(result > 0) {
		out.println("<script>");
		out.println("alert('등록 성공');");
		out.println("location.href = 'join.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 실패..');");
		out.println("location.href = 'join.jsp';");
		out.println("</script>");
	}

%>