<%@page import="config.Pagenation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "_inc_top.jsp" %>

<%
	String searchField = "";
	String searchWord = "";
	int startPage = 1;
	int lastPage = 5;
	
	// ---------------- 페이징 처리 ----------------
	ProductDAO productDao = new ProductDAO();
	ArrayList<ProductDTO> list = productDao.getSelectAll(searchField, searchWord, startPage, lastPage);
	int productCounter = list.size();
	int cellCounter = 3; //가로로 배열할 상품의 갯수
	
	int imsiMok = productCounter / cellCounter;
	int imsiNa = productCounter % cellCounter;
	
	int rowCounter = 0;
	if (imsiNa > 0) {
		rowCounter = imsiMok + 1;
	} else {
		rowCounter = imsiMok;
	}
	int totalRecord = productDao.getTotalRecord(searchField, searchWord);
	int pageSize = 9;	// 한 페이지에 나타낼 레코드 개수
	int blockSize = 5;	// 출력할 블럭의 개수
			
	int block = (pageNum - 1) / pageSize;
	int jj = totalRecord - pageSize * (pageNum - 1);	//단지 화면에 보여질 일련번호..
			
	double totalPageDou = Math.ceil(totalRecord / (double)pageSize);
	int totalPage = (int)totalPageDou;
			
	int startRecord = pageSize * (pageNum - 1) + 1;
	int lastRecord = pageSize * pageNum;
	String urlStr = "main.jsp?menuGubun=shopMall_list";

%>

<h2>쇼핑몰 목록</h2><br>

<table border="1">

<% 
	int idx = 0;
	for (int i=0; i<rowCounter; i++) {
%>
		<tr>
			<%
				for (int j=0; j<cellCounter; j++) {
 					String idxExist = "X"; //상품이 없을 경우..
					if (idx < productCounter) {
						idxExist = "O"; //상품이 있을 경우..
					}
 					
 					int imsiCode = 0;
 					String imsiName = "";
 					int imsiPrice = 0;
 					String imsiImg = "";
 					
 					if (idxExist.equals("O")) {
 						ProductDTO dto = list.get(idx);
					
 	 					imsiCode = dto.getProductCode();
 	 					imsiName = dto.getProductName();
 	 					imsiPrice = dto.getProductPrice();
 	 					imsiImg = "";
 	 					
 	 					if(dto.getAttachInfo() == null || dto.getAttachInfo().equals("-")) {
 	 						imsiImg = "<img src='../img/image_not_supported.png'>";
 	 					} else {
 	 						String[] imsiArray = dto.getAttachInfo().split(",");
 	 						for(int k=0; k<imsiArray.length; k++) {
 	 							String[] imsiArray2 = imsiArray[k].split("[|]");
 	 								
 	 							String imsiImgPath = "";
 	 							imsiImgPath += request.getContextPath();
 	 							imsiImgPath += "/attach";
 	 							imsiImgPath += request.getContextPath();
 	 							imsiImgPath += "/product/";
 	 							imsiImgPath += imsiArray2[1];
 	 							
 	 							imsiImg = "<img src='" + imsiImgPath + "' width='200px'>";
 	 						}
 	 					}
 					}
			%>
					<td style="padding: 20px 20px;">

 						<% if (idxExist.equals("O")) { %>
							<table border="0" style="width: 200px;">
								<tr>
									<td height="100" align="center">
										<a href="#" onClick="move('shopMall_view', '<%= imsiCode %>');"><%= imsiImg %></a>
									</td>
								</tr>
								<tr>
									<td><%=imsiName %> (<%=imsiCode %>)</td>
								</tr>
								<tr>
									<td><%=imsiPrice %></td>
								</tr>
							</table>
						<% } else { %>
							&nbsp;
						<% } %>
						
					</td>
			<%
					idx++;
				}
			%>

		</tr>
<%
	}
%>

</table>

<div style="padding-top: 20px; width: 60%;" align="center">
	<%= Pagenation.pagingStr(totalRecord, pageSize, blockSize, pageNum, urlStr, searchField, searchWord) %>
</div>

<script>
function move(value1, value2) {
	location.href = 'main.jsp?menuGubun=' + value1 + '&productCode=' + value2;
}
</script>