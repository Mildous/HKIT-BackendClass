<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   
   String id=request.getParameter("id");
   String pw = request.getParameter("pw");
   String name = request.getParameter("name");
   String phone = request.getParameter("phone");
   String address = request.getParameter("address");
   String email = request.getParameter("email");
   
   
	if(id==null || id.trim().equals("")){
		out.print("<script>");
		out.print("alert('오류 발생')");
		out.print("location.href='list.jsp';");
		out.print("</script>");
		return;
	}
	
	String attachPath = "C:/JIJ/attach";
	String uploadPath = attachPath + "/testFile"+request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
			
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		String content="";
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();
			String[] array=data.split("[|]");
			
			if(array[0].equals(id)){
				content+="";
			}else{
				content+=data+"\n";
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
		//System.out.println();
	} catch(Exception e) {
		//e.printStackTrace();
		//System.out.println();
	}
%>