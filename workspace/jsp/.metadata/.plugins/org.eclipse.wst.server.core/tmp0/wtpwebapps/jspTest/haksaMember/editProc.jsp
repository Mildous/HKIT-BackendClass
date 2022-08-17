<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String hakbun_ = request.getParameter("hakbun");
	String phone = request.getParameter("phone");
	String parentPhone = request.getParameter("parentPhone");
	String addr1 = request.getParameter("post1");
	String addr2 = request.getParameter("post2");
	String addr3 = request.getParameter("post3");
	String addr4 = request.getParameter("post4");
	
	int hakbun = Integer.parseInt(hakbun_);
	
	if (addr4 == null || addr4.trim().equals("")) {
		addr4 = "-";
	}
	
	HaksaMemberDTO arguDto = new HaksaMemberDTO();
	arguDto.setHakbun(hakbun);
	arguDto.setPhone(phone);
	arguDto.setParentPhone(parentPhone);
	arguDto.setAddr1(addr1);
	arguDto.setAddr2(addr2);
	arguDto.setAddr3(addr3);
	arguDto.setAddr4(addr4);
	
	HaksaMemberDAO dao = new HaksaMemberDAO();
	int result = dao.setUpdate(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href = 'view.jsp?hakbun=" + hakbun + "';</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 처리 중 오류가 발생하였습니다..');");
		out.println("location.href = 'edit.jsp?hakbun=" + hakbun + "';");
		out.println("</script>");
	}
%>