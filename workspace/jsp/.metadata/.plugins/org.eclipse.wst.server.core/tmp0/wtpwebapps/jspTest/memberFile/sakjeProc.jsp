<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("arg1");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("tel");
	String address = request.getParameter("addr");
	String email = request.getParameter("email");
	
	
	if(id == null || id.trim().equals("")) {
		out.println("<script>");
		out.println("alert('정상적인 접속이 아닙니다.');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
		return;
	}
	
	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + "/testFile/jspTest";
	String uploadFile = uploadPath + "/member.txt";
			
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		String content = "";		
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();
			String[] imsiArray = data.split(",");
			
			if(imsiArray[0].equals(id)) {
				content += id + "," + pw + "," + name + "," + phone + "," + address + "," + email + "\n";
			} else {
				content += data + "\n";
			}
		}
		try {
			FileWriter fw = new FileWriter(uploadFile);
			fw.write(content);
			fw.close();
			out.print("<script>");
			out.print("location.href='list.jsp';");
			out.print("</script>");
		} catch(Exception e) {
			out.print("<script>");
			out.print("alert('저장실패')");
			out.print("location.href='chuga.jsp';");
			out.print("</script>");
		}	
		
		sReader.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>

<a href="#" onclick="movePage();">[목록 페이지로]</a>