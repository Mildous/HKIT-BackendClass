<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_04_readLineFile.jsp</title>
</head>
<body>

<h2>파일 읽기</h2>

<%
	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + "/testFile/aaa";
	String uploadFile = uploadPath + "/test01.txt";
	
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		out.println("이름\t국어\t영어\t수학\t과학\t역사\t총점\t평균\t등급<br>");
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();
			//data = data.replace("\n", "<br>");
			String[] imsiArray = data.split(",");
			
			String name = imsiArray[0];
			int kor = Integer.parseInt(imsiArray[1]);
			int eng = Integer.parseInt(imsiArray[2]);
			int mat = Integer.parseInt(imsiArray[3]);
			int sci = Integer.parseInt(imsiArray[4]);
			int his = Integer.parseInt(imsiArray[5]);
			
			int tot = kor + eng + mat + sci + his;
			double avg = tot/5.0;
			
			String grade = "가";
			if(avg >= 90) {
				grade = "수";
			} else if(avg >= 80) {
				grade = "우";
			} else if(avg >= 70) {
				grade = "미";
			} else if(avg >= 60) {
				grade = "양";
			}
			
			String msg = "";
			msg += name + "&nbsp;";
			msg += kor + "&nbsp;";
			msg += eng + "&nbsp;";
			msg += mat + "&nbsp;";
			msg += sci + "&nbsp;";
			msg += his + "&nbsp;";
			msg += tot + "&nbsp;";
			msg += avg + "&nbsp;";
			msg += grade + "&nbsp;<br>";
			
			out.println(msg);
			//out.println(data + "<br>");
		}
		sReader.close();
	} catch(Exception e) {
		//e.printStackTrace();
	}
%>

</body>
</html>