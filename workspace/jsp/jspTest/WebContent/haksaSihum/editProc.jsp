<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String sihumNo_ = request.getParameter("sihumNo");
	String sihumDate_ = request.getParameter("sihumDate");
	
	int sihumNo = Integer.parseInt(sihumNo_);
	Date sihumDate = Date.valueOf(sihumDate_);
	
	HaksaSihumDTO arguDto = new HaksaSihumDTO();
	arguDto.setSihumNo(sihumNo);
	arguDto.setSihumDate(sihumDate);
	
	HaksaSihumDAO dao = new HaksaSihumDAO();
	int result = dao.setUpdate(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href = 'list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 처리 중 오류가 발생하였습니다..');");
		out.println("location.href = 'edit.jsp?sihumNo=" + sihumNo + "';");
		out.println("</script>");
	}
	
%>