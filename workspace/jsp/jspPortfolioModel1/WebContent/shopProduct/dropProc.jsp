<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<%
	ProductDTO arguDto = new ProductDTO();
	arguDto.setProductCode(dto.getProductCode());
	
	ProductDTO removeFile = new ProductDTO();
	removeFile.setProductCode(dto.getProductCode());
	ProductDTO returnResult = dao.getSelectOne(removeFile);
	String attachInfo = returnResult.getAttachInfo();

	int result = dao.setDelete(arguDto);

	if(result > 0) {
		out.println("<script>location.href='main.jsp?menuGubun=shopProduct_list';</script>");
		String attachPath = "C:/Users/HKIT/COY/attach";
		String uploadPath = attachPath + request.getContextPath() + "/product";
		
		String[] imsiArray01 = attachInfo.split(",");
		for(int i=0; i<imsiArray01.length; i++) {
			String[] imsiArray02 = imsiArray01[i].split("[|]");
			String uploadFile = uploadPath + "/" + imsiArray02[1];
			java.io.File f = new java.io.File(uploadFile);
			f.delete();
		}
	} else {
		out.println("<script>");
		out.println("alert('삭제 중 오류가 발생했습니다.');");
		out.println("location.href='main.jsp?menuGubun=shopProduct_drop&productCode=" + dto.getProductCode());
		out.println("</script>");
	}
%>