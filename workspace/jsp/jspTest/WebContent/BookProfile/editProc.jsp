<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String profileNo_ = request.getParameter("profileNo");
	String profile = request.getParameter("profile");
	int profileNo = Integer.parseInt(profileNo_);
	
	BookProfileDTO arguDto = new BookProfileDTO();
	arguDto.setProfileNo(profileNo);
	arguDto.setProfile(profile);
	
	BookProfileDAO dao = new BookProfileDAO();
	int result = dao.setUpdate(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href = 'list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 처리 중 오류가 발생하였습니다..');");
		out.println("location.href = 'edit.jsp?profileNo=" + profileNo + "';");
		out.println("</script>");
	}

%>