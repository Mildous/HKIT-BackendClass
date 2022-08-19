<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String> list = new ArrayList<>();
	for(int i=1; i<=3; i++) {
		String name;
		int kor;
		int eng;
		int mat;
		String imsi;
		
		if(i == 1) {
			name = "홍길동";
			kor = 90;
			eng = 80;
			mat = 70;
		} else if(i == 2) {
			name = "이성순";
			kor = 99;
			eng = 88;
			mat = 77;
		} else {
			name = "장천용";
			kor = 100;
			eng = 100;
			mat = 100;
		}
		imsi = name + "|" + kor + "|" + eng + "|" + mat;
		list.add(imsi);
	}
	out.print(list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test08.jsp</title>
</head>
<body>
	<h2>test08.jsp</h2>
	<table>
	<tr>
			<td>이름</td>
			<td>국어</td>
			<td>영어</td>
			<td>수학</td>
		</tr>
		<%
		int korTot = 0;
		int engTot = 0;
		int matTot = 0;
		
		for(int i=0; i<list.size(); i++) {
			String[] imsiArray02 = list.get(i).split("/");
			String name = imsiArray02[0];
			String kor_ = imsiArray02[1];
			String eng_ = imsiArray02[2];
			String mat_ = imsiArray02[3];
			
			int kor = Integer.parseInt(kor_);
			int eng = Integer.parseInt(eng_);
			int mat = Integer.parseInt(mat_);
		%>
		<tr>
			<td><%= name %></td>
			<td><%= kor %></td>
			<td><%= eng %></td>
			<td><%= mat %></td>	
		</tr>
		<%
		}
		%>
	</table>
	
</body>
</html>