/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.65
 * Generated at: 2022-09-05 05:55:53 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.shopProduct;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import config.Pagenation;
import java.util.ArrayList;
import config.Util;
import product.model.dao.ProductDAO;
import product.model.dto.ProductDTO;
import java.net.Inet4Address;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/shopProduct/_inc_top.jsp", Long.valueOf(1662009602048L));
    _jspx_dependants.put("/shopProduct/../_include/inc_sessionChk.jsp", Long.valueOf(1661482669264L));
    _jspx_dependants.put("/shopProduct/../_include/inc_header.jsp", Long.valueOf(1662350101525L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("config.Util");
    _jspx_imports_classes.add("config.Pagenation");
    _jspx_imports_classes.add("product.model.dao.ProductDAO");
    _jspx_imports_classes.add("product.model.dto.ProductDTO");
    _jspx_imports_classes.add("java.net.Inet4Address");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	request.setCharacterEncoding("utf-8");

	String referer = request.getHeader("REFERER");
	String url = request.getRequestURL().toString();
	String uri = request.getRequestURI().toString();
	String path = request.getContextPath();
	String ip = Inet4Address.getLocalHost().getHostAddress();	// import java.net.Inet4Address;
/*	
	out.println("referer : " + referer + "<br>");
	out.println("url : " + url + "<br>");
	out.println("uri : " + uri + "<br>");
	out.println("ip : " + ip + "<br>");
*/	

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
	//System.out.println("--> " + folderName + " / " + fileName + " / " + includePage + "<br>");
	
	
	String imgDisplayPath = "";
	imgDisplayPath += request.getContextPath();
	imgDisplayPath += "/attach";
	imgDisplayPath += request.getContextPath();
		

      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");

	int sessionNo = 0;
	String sessionId = "";
	String sessionName = "";
	String sessionGrade = "";
	String sessionEmail = "";
	
	if(session.getAttribute("sessionNo") != null) {
		sessionNo = (Integer) session.getAttribute("sessionNo");
		sessionId = (String) session.getAttribute("sessionId");
		sessionName = (String) session.getAttribute("sessionName");
		sessionGrade = (String) session.getAttribute("sessionGrade");
		sessionEmail = (String) session.getAttribute("sessionEmail");
	}
	

      out.write("\r\n");
      out.write("\r\n");

	ProductDAO dao = null;
	ProductDTO dto = null;
	int productCode = 0;
	if( fileName.equals("regi") || fileName.equals("regiProc") || fileName.equals("view") || fileName.equals("edit") || fileName.equals("editProc") || fileName.equals("drop") || fileName.equals("dropProc")) {
		String productCode_ = request.getParameter("productCode");
		if(productCode_ == null || productCode_.trim().equals("")) {
			productCode_ = "0";
		}
		productCode = Integer.parseInt(productCode_);
		
		ProductDTO arguDto = new ProductDTO();
		arguDto.setProductCode(productCode);
			
		dao = new ProductDAO();	
		dto = dao.getSelectOne(arguDto);
	}
	
	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + request.getContextPath() + "/product";	// "/jspPortfolioModel1/product";
	int maxUpload = 1024 * 1024 * 100;	// 업로드 할 수 있는 최대 용량: 100mb
	String encoding = "UTF-8";

      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");

	// 검색
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	Util util = new Util();
	searchField = util.getNullBlankCheck(searchField, "");
	searchWord = util.getNullBlankCheck(searchWord, "");
	
	if(searchField == null || searchField.trim().equals("")) {
		searchField = "";
	}
	
	if(searchWord == null || searchWord.trim().equals("")) {
		searchWord = "";
	}
	
	dao = new ProductDAO();
	
	// ---------------- 페이징 처리 ----------------
	String pageNum_ = request.getParameter("pageNum");
	if(pageNum_ == null || pageNum_.trim().equals("")) {
		pageNum_ = "1";
	}
	int pageNum = Integer.parseInt(pageNum_);
	
	int totalRecord = dao.getTotalRecord(searchField, searchWord);
	int pageSize = 10;	// 한 페이지에 나타낼 레코드 개수
	int blockSize = 5;	// 출력할 블럭의 개수
	
	int block = (pageNum - 1) / pageSize;
	int jj = totalRecord - pageSize * (pageNum - 1);	//단지 화면에 보여질 일련번호..
	
	double totalPageDou = Math.ceil(totalRecord / (double)pageSize);
	int totalPage = (int)totalPageDou;
	
	int startRecord = pageSize * (pageNum - 1) + 1;
	int lastRecord = pageSize * pageNum;
	
	ArrayList<ProductDTO> list = dao.getSelectAll(searchField, searchWord, startRecord, lastRecord);
	String urlStr = "main.jsp?menuGubun=shopProduct_list";

      out.write("\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,-25\" />\r\n");
      out.write("\r\n");
      out.write("<h2>상품목록</h2>\r\n");
      out.write("<div style=\"padding: 5px 0px; width: 60%;\" align=\"left\">\r\n");
	if(searchField.equals("") || searchWord.equals("")) { 
      out.write("\r\n");
      out.write("	* 전체목록 (");
      out.print( totalRecord );
      out.write("건)\r\n");
	} else { 
      out.write("\r\n");
      out.write("	* 검색어 \"");
      out.print( searchWord );
      out.write("\"으/로 검색된 목록 (");
      out.print( totalRecord );
      out.write("건)\r\n");
	} 
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<table border=\"1\" width=\"60%\">\r\n");
      out.write("	<tr height=\"30px\">\r\n");
      out.write("		<th width=\"50px\">순번</th>\r\n");
      out.write("		<th width=\"50px\">제조사</th>\r\n");
      out.write("		<th>상품명</th>\r\n");
      out.write("		<th width=\"100px\">가격</th>\r\n");
      out.write("		<th width=\"120px\">등록일</th>\r\n");
      out.write("	</tr>\r\n");
 if(totalRecord == 0) { 
      out.write("\r\n");
      out.write("	<tr>\r\n");
      out.write("		<td colspan=\"8\" height=\"150px\" align=\"center\">등록된 상품이 없습니다..</td>\r\n");
      out.write("	</tr>\r\n");
 } 
      out.write('\r');
      out.write('\n');

	for(int i=0; i<list.size(); i++) {
		ProductDTO indexDto = list.get(i);

      out.write("\r\n");
      out.write("	<tr>\r\n");
      out.write("		<td align=\"center\">");
      out.print( jj );
      out.write("</td>\r\n");
      out.write("		<td align=\"center\">");
      out.print( indexDto.getVendorName() );
      out.write("</td>\r\n");
      out.write("		<td>\r\n");
      out.write("			<a href=\"#\" onClick=\"move('shopProduct_view', '");
      out.print( indexDto.getProductCode() );
      out.write("', '");
      out.print( searchField );
      out.write("', '");
      out.print( searchWord );
      out.write("');\" style=\"padding-left: 5px;\">\r\n");
      out.write("			");
      out.print( indexDto.getProductName() );
      out.write("</a>\r\n");
      out.write("			");
	if(indexDto.getAttachInfo() == null || indexDto.getAttachInfo().equals("-")) { 
      out.write("\r\n");
      out.write("			");
	} else { 
      out.write("\r\n");
      out.write("				<span class=\"material-symbols-outlined\">photo</span>\r\n");
      out.write("			");
	} 
      out.write("\r\n");
      out.write("		</td>\r\n");
      out.write("		<td align=\"center\">");
      out.print( indexDto.getProductPrice() );
      out.write("만원</td>\r\n");
      out.write("		<td align=\"center\">");
      out.print( indexDto.getRegiDate() );
      out.write("</td>\r\n");
      out.write("	</tr>\r\n");

	jj--;
	}

      out.write("\r\n");
      out.write("	<tr>\r\n");
      out.write("		<td colspan=\"5\" align=\"center\" style=\"padding: 20px 0px;\">\r\n");
      out.write("		<form name=\"searchForm\" method=\"post\" action=\"main.jsp?menuGubun=shopProduct_list\">\r\n");
      out.write("			<select name=\"searchField\">\r\n");
      out.write("				<option value=\"\">-- 선택 --</option>\r\n");
      out.write("				<option value=\"productName\" ");
 if(searchField.equals("productName")) { out.println("selected"); } 
      out.write(">상품명</option>\r\n");
      out.write("				<option value=\"vendorName\" ");
 if(searchField.equals("vendorName")) { out.println("selected"); } 
      out.write(">제조사</option>\r\n");
      out.write("			</select>\r\n");
      out.write("			<input type=\"text\" name=\"searchWord\" value=\"");
      out.print( searchWord );
      out.write("\">\r\n");
      out.write("			<button type=\"button\" onClick=\"submit()\">검색</button>\r\n");
      out.write("		</form> \r\n");
      out.write("		</td>\r\n");
      out.write("	</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<div style=\"padding-top: 20px; width: 60%;\" align=\"center\">\r\n");
      out.write("	");
      out.print( Pagenation.pagingStr(totalRecord, pageSize, blockSize, pageNum, urlStr, searchField, searchWord) );
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div style=\"padding-top: 10px; width: 60%;\" align=\"right\">\r\n");
      out.write("   |\r\n");
      out.write("   <a href=\"#\" onClick=\"move('shopProduct_list', '', '', '');\">목록</a>\r\n");
      out.write("   |\r\n");
      out.write("   <a href=\"#\" onClick=\"move('shopProduct_regi', '', '', '');\">등록</a>\r\n");
      out.write("   |\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("function move(value1, value2, searchField, searchWord) {\r\n");
      out.write("	var linkAddr = 'main.jsp?menuGubun=' + value1 + '&productCode=' + value2 + '&searchField=' + searchField + '&searchWord=' + searchWord;\r\n");
      out.write("	location.href = linkAddr;\r\n");
      out.write("}\r\n");
      out.write("</script>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
