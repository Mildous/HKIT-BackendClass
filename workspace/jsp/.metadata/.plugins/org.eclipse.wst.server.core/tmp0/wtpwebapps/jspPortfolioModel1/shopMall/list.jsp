<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "_inc_top.jsp" %>

<%
	String searchField = "";
	String searchWord = "";
	int startPage = 1;
	int lastPage = 10;
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
%>

<h2>쇼핑몰 목록</h2>

<table border="0">

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
 	 						out.println("<img src='../img/image_not_supported.png'>");
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
									<td height="100">
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

<script>
function move(value1, value2) {
	location.href = 'main.jsp?menuGubun=' + value1 + '&productCode=' + value2;
}
</script>