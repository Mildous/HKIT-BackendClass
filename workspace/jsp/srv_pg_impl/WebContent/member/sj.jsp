<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적등록</title>
</head>
<body>
<h2>성적등록</h2>
<form name="sjForm" method="post" action="sjProc.jsp">
<table border="1">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" /></td>
	</tr>
	<tr>
		<td>시험</td>
		<td>
			<input type="radio" name="sname" value="중간고사" />중간고사&nbsp;
			<input type="radio" name="sname" value="기말고사" />기말고사
		</td>
	</tr>
	<tr>
		<td>1.동물이 아닌 것은? (20점)</td>
		<td>
			<input type="radio" name="mun_1" value="1" />신발&nbsp;
			<input type="radio" name="mun_1" value="2" />여우&nbsp;
			<input type="radio" name="mun_1" value="3" />늑대&nbsp;
			<input type="radio" name="mun_1" value="4" />까치&nbsp;
		</td>
	</tr>
	<tr>
		<td>2.먹을 수 없는 것은? (20점)</td>
		<td>
			<input type="radio" name="mun_2" value="1" />우유&nbsp;
			<input type="radio" name="mun_2" value="2" />오일&nbsp;
			<input type="radio" name="mun_2" value="3" />식빵&nbsp;
			<input type="radio" name="mun_2" value="4" />콜라&nbsp;
		</td>
	</tr>
	<tr>
		<td>3.용도가 다른 것은? (20점)</td>
		<td>
			<input type="radio" name="mun_3" value="1" />구두&nbsp;
			<input type="radio" name="mun_3" value="2" />샌들&nbsp;
			<input type="radio" name="mun_3" value="3" />우의&nbsp;
			<input type="radio" name="mun_3" value="4" />짚신&nbsp;
		</td>
	</tr>
	<tr>
		<td>4.student의 의미는? (20점)</td>
		<td>
			<input type="radio" name="mun_4" value="1" />의사&nbsp;
			<input type="radio" name="mun_4" value="2" />군인&nbsp;
			<input type="radio" name="mun_4" value="3" />선생&nbsp;
			<input type="radio" name="mun_4" value="4" />학생&nbsp;
		</td>
	</tr>
	<tr>
		<td>5.한글을 창제한 왕은? (20점)</td>
		<td>
			<input type="radio" name="mun_5" value="1" />성종&nbsp;
			<input type="radio" name="mun_5" value="2" />문종&nbsp;
			<input type="radio" name="mun_5" value="3" />세종&nbsp;
			<input type="radio" name="mun_5" value="4" />세조&nbsp;
		</td>
	</tr>
</table>
<button type="submit">확인</button>
</form>
</body>
</html>