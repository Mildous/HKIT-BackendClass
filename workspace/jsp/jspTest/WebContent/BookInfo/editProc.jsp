<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String infoNo_ = request.getParameter("infoNo");
	String subject = request.getParameter("subject");
	String authorNo_ = request.getParameter("authorNo");
	String created_ = request.getParameter("created");
	String profileNo_ = request.getParameter("profileNo");
	
	int infoNo = Integer.parseInt(infoNo_);
	int authorNo = Integer.parseInt(authorNo_);
	int profileNo = Integer.parseInt(profileNo_);
	Date created = Date.valueOf(created_);
	
	BookInfoDTO arguDto = new BookInfoDTO();
	arguDto.setInfoNo(infoNo);
	arguDto.setSubject(subject);
	arguDto.setAuthorNo(authorNo);
	arguDto.setCreated(created);
	arguDto.setProfileNo(profileNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	int result = dao.setUpdate(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href = 'view.jsp?infoNo=" + infoNo + "';</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 처리 중 오류가 발생하였습니다..');");
		out.println("location.href = 'edit.jsp?infoNo=" + infoNo + "';");
		out.println("</script>");
	}

%>