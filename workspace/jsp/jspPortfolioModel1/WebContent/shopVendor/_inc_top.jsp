<%@page import="java.util.ArrayList"%>
<%@page import="config.Util"%>
<%@page import="vendor.model.dao.VendorDAO"%>
<%@page import="vendor.model.dto.VendorDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<%@ include file="../_include/inc_sessionChk.jsp" %>

<%
	VendorDAO dao = null;
	VendorDTO dto = null;
	int vendorCode = 0;
	if( fileName.equals("regi") || fileName.equals("regiProc") || fileName.equals("edit") || fileName.equals("editProc") || fileName.equals("drop") || fileName.equals("dropProc")) {
		String vendorCode_ = request.getParameter("vendorCode");
		if(vendorCode_ == null || vendorCode_.trim().equals("")) {
			vendorCode_ = "0";
		}
		vendorCode = Integer.parseInt(vendorCode_);
		
		VendorDTO arguDto = new VendorDTO();
		arguDto.setVendorCode(vendorCode);
			
		dao = new VendorDAO();	
		dto = dao.getSelectOne(arguDto);
	}
		
%>
