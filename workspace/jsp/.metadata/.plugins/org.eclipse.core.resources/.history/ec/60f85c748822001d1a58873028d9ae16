<%@page import="guestbook.model.dao.GuestBookDAO"%>
<%@page import="guestbook.model.dto.GuestBookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	String passwd = request.getParameter("passwd");
	String content = request.getParameter("content");
	
	GuestBookDTO arguDto = new GuestBookDTO();
	GuestBookDAO dao = new GuestBookDAO();
	
	arguDto.setNo(no);
	arguDto.setPasswd(passwd);
	arguDto.setContent(content);
	
	int result = dao.setUpdate(arguDto);
	
	if(result > 0) {
		String moveUrl = "main.jsp?menuGubun=guestBook_view&no=" + no;
		out.println("<script>location.href='" + moveUrl + "';</script>");
	} else {
		String moveUrl = "main.jsp?menuGubun=guestBook_edit&no=" + no;
		out.println("<script>");
		out.println("alert('수정 중 오류가 발생했습니다.');");
		out.println("location.href='" + moveUrl + "';");
		out.println("</script>");
	}
%>