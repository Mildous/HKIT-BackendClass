<%@page import="guestbook.model.dao.GuestBookDAO"%>
<%@page import="guestbook.model.dto.GuestBookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	String passwd = request.getParameter("passwd");
	
	GuestBookDTO arguDto = new GuestBookDTO();
	GuestBookDAO dao = new GuestBookDAO();
	
	arguDto.setNo(no);
	arguDto.setPasswd(passwd);
	
	int result = dao.setDelete(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='main.jsp?menuGubun=guestBook_list';</script>");
	} else {
		String moveUrl = "main.jsp?menuGubun=guestBook_delete&no=" + no;
		out.println("<script>");
		out.println("alert('삭제 중 오류가 발생했습니다.');");
		out.println("location.href='" + moveUrl + "';");
		out.println("</script>");
	}
%>