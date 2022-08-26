<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	request.setCharacterEncoding("utf-8");

	String no_ = request.getParameter("no");
	String passwd = request.getParameter("passwd");
	//String attachInfo = request.getParameter("attachInfo");
	
	int no = Integer.parseInt(no_);
	
	MemberDTO arguDto = new MemberDTO();
	arguDto.setNo(no);
	arguDto.setPasswd(passwd);
	
	MemberDAO dao = new MemberDAO();
	
	
	MemberDTO imsiDto = new MemberDTO();
	imsiDto.setNo(no);
	MemberDTO resultDto = dao.getSelectOne(imsiDto);
	String attachInfo = resultDto.getAttachInfo();
	
	
	int result = dao.setDelete(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='main.jsp?menuGubun=member_list';</script>");
		
		//파일 삭제 처리..
		String attachPath = "C:/Users/HKIT/COY/attach";
		String uploadPath = attachPath + request.getContextPath() + "/member";
		
		String[] imsiArray01 = attachInfo.split(",");
		for(int i=0; i<imsiArray01.length; i++) {
			String[] imsiArray02 = imsiArray01[i].split("[|]");
			String uploadFile = uploadPath + "/" + imsiArray02[1];
			java.io.File f = new java.io.File(uploadFile);
			f.delete();
		}
		
	} else {
		String moveUrl = "main.jsp?menuGubun=member_delete&no=" + no;
		out.println("<script>");
		out.println("alert('삭제 중 오류가 발생했습니다.');");
		out.println("location.href='" + moveUrl + "';");
		out.println("</script>");
	}

%>