<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	String vendorName = request.getParameter("vendorName");

	VendorDTO arguDto = new VendorDTO();
	arguDto.setVendorName(vendorName);
	arguDto.setVendorCode(vendorCode);
	
	dao = new VendorDAO();
	int result = dao.setUpdate(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href = 'main.jsp?menuGubun=shopVendor_list';</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 처리 중 오류가 발생하였습니다..');");
		out.println("location.href = 'main.jsp?menuGubun=shopVendor_edit&vendorCode=" + vendorCode + "';");
		out.println("</script>");
	}

%>