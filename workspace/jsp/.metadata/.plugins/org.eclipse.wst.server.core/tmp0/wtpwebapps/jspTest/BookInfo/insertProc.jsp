
<%@page import="java.sql.Date"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	
	String subject = request.getParameter("subject");
	String authorNo_ = request.getParameter("authorNo");
	String created_ = request.getParameter("created");
	String profileNo_ = request.getParameter("profileNo");
	
	int authorNo = Integer.parseInt(authorNo_);
	Date created = Date.valueOf(created_);
	int profileNo = Integer.parseInt(profileNo_);
	
	BookInfoDTO arguDto = new BookInfoDTO();
	arguDto.setSubject(subject);
	arguDto.setAuthorNo(authorNo);
	arguDto.setCreated(created);
	arguDto.setProfileNo(profileNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	int result = dao.setInsert(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href = 'list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 처리 중 오류가 발생하였습니다..');");
		out.println("location.href = 'insert.jsp';");
		out.println("</script>");
	}
	
%>