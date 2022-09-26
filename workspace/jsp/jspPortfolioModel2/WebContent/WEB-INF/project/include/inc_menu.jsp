<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>

<table align="center" width="90%">
	<tr>
		<td colspan="3" style="padding: 0px 10px 0px 10px;" align="left">
			<%-- Location : project > ${ folderName } > ${ fileName } --%>
			접속IP : ${ ip }
		</td>
		<td colspan="6" style="padding: 0px 10px 10px 10px" align="right">
		
			<c:choose>
				<c:when test="${ sessionScope.sessionNo == null || sessionScope.sessionNo == '' || sessionScope.sessionNo == 0 }">
					<a href="${ path }">로그인</a>
				</c:when>
				<c:otherwise>
					<a href="${ path }/member_servlet/member_edit.do">[회원수정</a>&nbsp;
					<a href="${ path }/member_servlet/member_drop.do">회원탈퇴]</a><br>
					${ sessionScope.sessionName }님, 반갑습니다.&nbsp;
					<a href="${ path }/noLogin_servlet/noLogin_logout.do">[로그아웃]</a>
					
				</c:otherwise>
			</c:choose>
		</td>
		<td>
		</td>
	</tr>
	<tr align="center">
		<td style="padding: 0px 10px;" id="home">
			<a href="${ path }/">HOME</a>
		</td>
		<td style="padding: 0px 10px;" id="member">
			<a href="${ path }/member_servlet/member_list.do">회원관리</a>
		</td>
		<td style="padding: 0px 10px;" id="memo">
			<a href="${ path }/memo_servlet/memo_list.do">메모장</a>
		</td>
		<td style="padding: 0px 10px;" id="guestBook">
			<a href="${ path }/guestBook_servlet/guestBook_list.do">방명록</a>
		</td>
		<td style="padding: 0px 10px;" id="board">
			<a href="${ path }/board_servlet/board_list.do">게시판</a>
		</td>
		<td style="padding: 0px 10px;" id="shopProduct">
			<a href="#">Mall(상품관리)</a>
		</td>
		<td style="padding: 0px 10px;" id="shopVendor">
			<a href="#">Mall(제조사)</a>
		</td>
		<td style="padding: 0px 10px;" id="shopMall">
			<a href="#">Mall(쇼핑몰)</a>
		</td>
		<td style="padding: 0px 10px;" id="chart">
			<a href="#">Chart</a>
		</td>
	</tr>
</table>