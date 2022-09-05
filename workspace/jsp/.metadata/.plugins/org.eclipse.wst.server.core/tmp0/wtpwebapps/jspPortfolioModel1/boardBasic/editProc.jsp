<%@page import="config.Util"%>
<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	Util util = new Util();
	request.setCharacterEncoding("utf-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	String subject = request.getParameter("subject");
	subject = util.getNullBlankCheck(subject, "");
	subject = util.getCheckString(subject);
	
	//String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	content = util.getNullBlankCheck(content, "");
	content = util.getCheckString(content);
	
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	
	
	BoardBasicDTO arguDto = new BoardBasicDTO();
	arguDto.setNo(no);
	arguDto.setSubject(subject);
	//arguDto.setWriter(writer);
	arguDto.setContent(content);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	
	BoardBasicDAO dao = new BoardBasicDAO();
	int result = dao.setUpdate(arguDto);
	
	if(result > 0) {
		String moveUrl = "main.jsp?menuGubun=boardBasic_view&no=" + no;
		out.println("<script>location.href='" + moveUrl + "';</script>");
	} else {
		String moveUrl = "main.jsp?menuGubun=boardBasic_edit&no=" + no;
		out.println("<script>");
		out.println("alert('수정 중 오류가 발생했습니다.');");
		out.println("location.href='" + moveUrl + "';");
		out.println("</script>");
	}
%>