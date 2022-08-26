<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	request.setCharacterEncoding("utf-8");

	String no_ = request.getParameter("no");
	String passwd = request.getParameter("passwd");
	//String attachInfo = request.getParameter("attachInfo");
	
	int no = Integer.parseInt(no_);
	
	BoardBasicDTO arguDto = new BoardBasicDTO();
	arguDto.setNo(no);
	arguDto.setPasswd(passwd);
	
	BoardBasicDAO dao = new BoardBasicDAO();
	int result = dao.setDelete(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='main.jsp?menuGubun=boardBasic_list';</script>");
		
	} else {
		String moveUrl = "main.jsp?menuGubun=boardBasic_delete&no=" + no;
		out.println("<script>");
		out.println("alert('삭제 중 오류가 발생했습니다.');");
		out.println("location.href='" + moveUrl + "';");
		out.println("</script>");
	}

%>