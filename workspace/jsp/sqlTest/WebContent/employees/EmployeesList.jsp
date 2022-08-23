<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="employees.EmployeesDAO"%>
<%@page import="employees.EmployeesDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	EmployeesDAO dao = new EmployeesDAO();
	EmployeesDTO result = dao.viewStevenKing();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Steven King의 정보 출력</title>
</head>
<body>

<h2>Steven King의 정보</h2>
	<table border="1">
		<tr>
			<th>employee_id</th>
			<th>name</th>
			<th>email</th>
			<th>phone_number</th>
			<th>hire_date</th>
			<th>job_id</th>
			<th>salary</th>
			<th>commission_pct</th>
			<th>manager_id</th>
			<th>department_id</th>
		</tr>
		<tr>
			<td><%= result.getEmployee_id() %></td>
			<td><%= result.getFirst_name() %> <%= result.getLast_name() %></td>
			<td><%= result.getEmail() %></td>
			<td><%= result.getPhone_number() %></td>
			<td><%= result.getHire_date() %></td>
			<td><%= result.getJob_id() %></td>
			<td><%= result.getSalary() %></td>
			<td><%= result.getCommission_pct() %></td>
			<td><%= result.getManager_id() %></td>
			<td><%= result.getDepartment_id() %></td>
		</tr>
	</table>
</body>
</html>