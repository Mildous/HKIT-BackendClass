<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String profileNo_ = request.getParameter("profileNo");
	int profileNo = Integer.parseInt(profileNo_);
	
	BookProfileDTO arguDto = new BookProfileDTO();
	arguDto.setProfileNo(profileNo);
	
	BookProfileDAO dao = new BookProfileDAO();
	int result = dao.setDelete(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href = 'list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('삭제 처리 중 오류가 발생하였습니다..');");
		out.println("location.href = 'delete.jsp?profileNo=" + profileNo + "';");
		out.println("</script>");
	}

%>