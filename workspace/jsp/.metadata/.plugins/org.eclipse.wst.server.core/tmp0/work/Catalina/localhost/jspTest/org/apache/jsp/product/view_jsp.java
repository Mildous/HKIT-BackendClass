/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.65
 * Generated at: 2022-08-04 08:20:45 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Date;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public final class view_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/product/../include/inc_dbinfo.jsp", Long.valueOf(1659595048863L));
    _jspx_dependants.put("/product/../include/inc_menu.jsp", Long.valueOf(1659596237013L));
    _jspx_dependants.put("/product/../include/inc_bottom.jsp", Long.valueOf(1659507634328L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("java.sql.PreparedStatement");
    _jspx_imports_classes.add("java.sql.DriverManager");
    _jspx_imports_classes.add("java.sql.Date");
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
      out.write('\r');
      out.write('\n');

	String dbDriver = "oracle.jdbc.driver.OracleDriver";
	String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
	String dbId = "jspTest";
	String dbPw = "1234";
 
      out.write('\r');
      out.write('\n');

	String arg1_ = request.getParameter("arg1");

	if(arg1_ == null || arg1_.trim().equals("")) {
		out.println("<script>");
		out.println("alert('정상적인 접속이 아닙니다.');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
		return;
	}
	
	int arg1 = Integer.parseInt(arg1_);
	int pCode = 0;
	String pName = "";
	int pPrice = 0;
	String pContent = "";
	String pCategory = "";
	String pVendor = "";
	Date regiDate;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int result = 0;
	try {
		Class.forName(dbDriver);
		conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
		System.out.println("오라클 접속 성공..");
		//-------------------------------------------------------
		String sql = "select * from product where productCode = ?";
		
		pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, arg1);
	    rs = pstmt.executeQuery();
	    if(rs.next()) {
	    	pCode = rs.getInt("productCode");
	    	pName = rs.getString("productName");
	    	pPrice = rs.getInt("productPrice");
	    	pContent = rs.getString("productContent");
	    	pCategory = rs.getString("productCategory");
	    	pVendor = rs.getString("vendor");
	    	regiDate = rs.getDate("regiDate");
	}
		//-------------------------------------------------------
	} catch (Exception e) {
//		e.printStackTrace();
		System.out.println("오라클 접속 실패..");
	} finally {
		if (rs != null) { rs.close(); }
		if (pstmt != null) { pstmt.close(); }
		if (conn != null) { conn.close(); }
		System.out.println("오라클 접속 해제..");
	}

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>상품상세보기</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<table border=\"1\" width=\"80%\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("	<td height=\"100px;\" align=\"center\">\r\n");
      out.write("<!-- 상단 메뉴 시작 -->\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	|\r\n");
      out.write("	<a href=\"/jspTest\">Home</a>\r\n");
      out.write("	|\r\n");
      out.write("	<a href=\"../member.list.jsp\">회원관리</a>\r\n");
      out.write("	|\r\n");
      out.write("	<a href=\"../product/list.jsp\">급여관리</a>\r\n");
      out.write("	|\r\n");
      out.write("	<a href=\"#\">상품관리</a>\r\n");
      out.write("	|\r\n");
      out.write("	<a href=\"#\">재고관리</a>\r\n");
      out.write("	|\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("	</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("	<td height=\"300px;\" align=\"center\">\r\n");
      out.write("	<h2>상품상세보기</h2>\r\n");
      out.write("\r\n");
      out.write("		<table border=\"1\" align=\"center\" width=\"50%\">\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td>상품코드</td>\r\n");
      out.write("				<td>");
      out.print( pCode );
      out.write("</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td>상품명</td>\r\n");
      out.write("				<td>");
      out.print( pName );
      out.write("</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td>상품가격</td>\r\n");
      out.write("				<td>");
      out.print( pPrice );
      out.write("</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td>상품설명</td>\r\n");
      out.write("				<td>");
      out.print( pContent );
      out.write("</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td>카테고리</td>\r\n");
      out.write("				<td>");
      out.print( pCategory );
      out.write("</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td>제조사</td>\r\n");
      out.write("				<td>");
      out.print( pVendor );
      out.write("</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("\r\n");
      out.write("		</table>\r\n");
      out.write("		\r\n");
      out.write("		<div style=\"border: 0px solid blue; width: 50%; margin-top: 10px;\" align=\"right\">\r\n");
      out.write("		|\r\n");
      out.write("		<a href=\"#\" onClick=\"move('list.jsp');\">목록</a>\r\n");
      out.write("		|\r\n");
      out.write("		<a href=\"#\" onClick=\"move('insert.jsp');\">등록</a>\r\n");
      out.write("		|\r\n");
      out.write("		<a href=\"#\" onClick=\"move('edit.jsp', '");
      out.print( pCode);
      out.write("');\">수정</a>\r\n");
      out.write("		|\r\n");
      out.write("		<a href=\"#\" onClick=\"move('delete.jsp', '");
      out.print( pCode);
      out.write("');\">삭제</a>\r\n");
      out.write("		|\r\n");
      out.write("		</div>\r\n");
      out.write("\r\n");
      out.write("	</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("	<td height=\"100px;\" align=\"center\">\r\n");
      out.write("		");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	Copyright 1900-2022 by localhost Co.LTD All Right Reserved.\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("	</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<script>\r\n");
      out.write("function move(value1, value2) {\r\n");
      out.write("	location.href = value1 + \"?arg1=\" + value2;\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
