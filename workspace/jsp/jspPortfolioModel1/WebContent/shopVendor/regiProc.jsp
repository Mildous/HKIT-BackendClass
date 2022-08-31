<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	String vendorName = request.getParameter("vendorName");
	
	Util util = new Util();
	
	int failCounter = 0;
	
	vendorName = util.getNullBlankCheck(vendorName, "");
	vendorName = util.getCheckString(vendorName);
	if(vendorName.length() <= 0) { failCounter++; }

	if(failCounter > 0) {
		out.println("<script>");
		out.println("alert('입력값이 정확하지 않습니다.');");
		out.println("location.href = 'main.jsp?menuGubun=shopVendor_regi';");
		out.println("</script>");
		return;
	}
	
	dao = new VendorDAO();
	
	VendorDTO arguDto = new VendorDTO();
	arguDto.setVendorName(vendorName);
	
	int result = dao.setInsert(arguDto);
	
	String ment = "";
	String addr = "";
	if(result > 0) {
		addr = "main.jsp?menuGubun=shopVendor_list";
	} else {
		ment = "등록 중 오류가 발생했습니다.";
		addr = "main.jsp?menuGubun=shopVendor_regi";
	}
	
	out.println("<script>");
	if(result < 0) {
		out.println("alert('" + ment + "')");
	}
	out.println("location.href='" + addr + "';");
	out.println("</script>");
	
%>