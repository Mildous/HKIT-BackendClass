<%@page import="guestbook.model.dao.GuestBookDAO"%>
<%@page import="guestbook.model.dto.GuestBookDTO"%>
<%@page import="config.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../_include/inc_sessionChk.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	Util util = new Util();

	String name = request.getParameter("name");
	name = util.getNullBlankCheck(name, "");
	name = util.getCheckString(name);
	
	String passwd = request.getParameter("passwd");
	passwd = util.getNullBlankCheck(passwd, "");
	passwd = util.getCheckString(passwd);
	
	String email = request.getParameter("email");
	email = util.getNullBlankCheck(email, "");
	email = util.getCheckString(email);
	
	String content = request.getParameter("content");
	content = util.getNullBlankCheck(content, "");
	content = util.getCheckString(content);
	
	GuestBookDTO arguDto = new GuestBookDTO();
	GuestBookDAO dao = new GuestBookDAO();
	
	arguDto.setName(name);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	arguDto.setContent(content);
	arguDto.setMemberNo(sessionNo);
	
	int result = dao.setInsert(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='main.jsp?menuGubun=guestBook_list';</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 중 오류가 발생했습니다.');");
		out.println("location.href='main.jsp?menuGubun=guestBook_insert';)");
		out.println("</script>");
	}
%>