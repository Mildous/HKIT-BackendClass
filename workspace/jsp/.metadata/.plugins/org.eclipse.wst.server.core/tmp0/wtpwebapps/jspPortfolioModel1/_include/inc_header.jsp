<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String path = request.getContextPath();

	String menuGubun = request.getParameter("menuGubun");

	if(menuGubun == null || menuGubun.trim().equals("")) {
		menuGubun = "member_list";

/*		out.println("<script>");
		out.println("location.href='error.jsp?errorCode=001';");
		out.println("</script>");
*/
		return;
	}
	
	String[] imsiMenuGubunArray = menuGubun.split("_");
	String folderName = imsiMenuGubunArray[0];
	String fileName = imsiMenuGubunArray[1];
	String includePage = "../" + folderName + "/" + fileName + ".jsp";
		
%>