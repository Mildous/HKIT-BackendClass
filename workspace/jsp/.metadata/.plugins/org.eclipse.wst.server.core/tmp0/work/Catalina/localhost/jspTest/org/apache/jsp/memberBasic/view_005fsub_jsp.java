/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.65
 * Generated at: 2022-08-11 03:35:08 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.memberBasic;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import memberBasic.MemberBasicDTO;
import memberBasic.MemberBasicDAO;

public final class view_005fsub_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("memberBasic.MemberBasicDTO");
    _jspx_imports_classes.add("memberBasic.MemberBasicDAO");
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

	String no_ = request.getParameter("no");

	int failCounter = 0;	
	if(no_ == null || no_.trim().equals("")) {
		failCounter++;
	}
	
	int no = 0;
	try {
		no = Integer.parseInt(no_);
	} catch(Exception e) {
		//e.printStackTrace();
		no = 0;
	}
	
	if(no <= 0) {
		failCounter++;
	}
	
	if(failCounter > 0) {
		out.println("<script>");
		out.println("alert('정상적인 접속이 아닙니다');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
		return;
	}
	MemberBasicDTO arguDto = new MemberBasicDTO();
	arguDto.setNo(no);
	MemberBasicDAO dao = new MemberBasicDAO();
	MemberBasicDTO resultDto = dao.getSelectOne(arguDto);
	

      out.write("\r\n");
      out.write("\r\n");
      out.write("<h2>회원상세보기</h2>\r\n");
      out.write("	<table border=\"1\" width=\"80%\">\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td>아이디</td>\r\n");
      out.write("			<td>");
      out.print( resultDto.getId() );
      out.write("</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td>이름</td>\r\n");
      out.write("			<td>");
      out.print( resultDto.getName() );
      out.write("</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td>연락처</td>\r\n");
      out.write("			<td>");
      out.print( resultDto.getPhone() );
      out.write("</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td>이메일</td>\r\n");
      out.write("			<td>");
      out.print( resultDto.getEmail() );
      out.write("</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td>주민번호</td>\r\n");
      out.write("			<td>");
      out.print( resultDto.getJumin().substring(0, 7) );
      out.write("******</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td>주소</td>\r\n");
      out.write("			<td>\r\n");
      out.write("				(");
      out.print( resultDto.getJuso1() );
      out.write(')');
      out.write(' ');
      out.print( resultDto.getJuso2() );
      out.write(' ');
      out.print( resultDto.getJuso3() );
      out.write(' ');
      out.print( resultDto.getJuso4() );
      out.write("\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td>등록일</td>\r\n");
      out.write("			<td>");
      out.print( resultDto.getRegiDate() );
      out.write("</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("	</table>	\r\n");
      out.write("	<div style=\"border: 0px solid blue; width: 80%; margin-top: 10px;\" align=\"right\">\r\n");
      out.write("	|\r\n");
      out.write("	<a href=\"#\" onClick=\"move('list.jsp', '');\">목록</a>\r\n");
      out.write("	|\r\n");
      out.write("	<a href=\"#\" onClick=\"move('chuga.jsp', '');\">등록</a>\r\n");
      out.write("	|\r\n");
      out.write("	<a href=\"#\" onClick=\"move('sujung.jsp', '");
      out.print( no );
      out.write("');\">수정</a>\r\n");
      out.write("	|\r\n");
      out.write("	<a href=\"#\" onClick=\"move('sakje.jsp', '");
      out.print( no );
      out.write("');\">삭제</a>\r\n");
      out.write("	|\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("function move(value1, value2) {\r\n");
      out.write("	location.href = value1 + '?no=' + value2;\r\n");
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