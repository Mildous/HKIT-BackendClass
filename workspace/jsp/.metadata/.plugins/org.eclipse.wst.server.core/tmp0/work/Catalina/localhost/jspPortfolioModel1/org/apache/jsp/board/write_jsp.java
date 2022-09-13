/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.65
 * Generated at: 2022-08-31 01:05:54 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import config.Util;
import board.model.dao.BoardDAO;
import board.model.dto.BoardDTO;
import java.net.Inet4Address;

public final class write_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/board/../_include/inc_header.jsp", Long.valueOf(1661305685415L));
    _jspx_dependants.put("/board/_inc_top.jsp", Long.valueOf(1661842898975L));
    _jspx_dependants.put("/board/../_include/inc_sessionChk.jsp", Long.valueOf(1661482669264L));
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
    _jspx_imports_classes.add("board.model.dao.BoardDAO");
    _jspx_imports_classes.add("java.net.Inet4Address");
    _jspx_imports_classes.add("java.util.ArrayList");
    _jspx_imports_classes.add("board.model.dto.BoardDTO");
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

      out.write('\r');
      out.write('\n');
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

	BoardDAO dao = null;
	BoardDTO dto = null;
	int no = 0;
	
	String pageTitle = "";
	String pageSubject = "";
	String pageContent = "";
	//String searchField = "";
	//String searchWord = "";
	
	if( fileName.equals("write") || fileName.equals("writeProc") || fileName.equals("view") || fileName.equals("edit") || fileName.equals("editProc") || fileName.equals("delete") || fileName.equals("deleteProc")) {
		String no_ = request.getParameter("no");
		//searchField = request.getParameter("searchField");
		//searchWord = request.getParameter("searchWord");
		if(no_ == null || no_.trim().equals("")) {
			no_ = "0";
		}
		no = Integer.parseInt(no_);
		
		BoardDTO arguDto = new BoardDTO();
		arguDto.setNo(no);
		
		dao = new BoardDAO();
	
		if(fileName.equals("view")) {
			dao.setUpdateHit(arguDto); 
		}
		
		dto = dao.getSelectOne(arguDto);
		
		if(fileName.equals("write")) {
			pageTitle = "답변글 작성";
			pageSubject = dto.getSubject();
			pageContent = dto.getContent();
			if(dto.getNo() == 0) {
				pageTitle = "게시글 작성";
				pageSubject = "";
				pageContent = "";
			}
		}
	}
	

      out.write("\r\n");
      out.write("\r\n");
      out.write("<h2>게시글 작성</h2>\r\n");
      out.write("\r\n");
      out.write("<form name=\"WriteForm\">\r\n");
      out.write("<input type=\"hidden\" name=\"no\" id=\"no\" value=\"");
      out.print( dto.getNo() );
      out.write("\">\r\n");
      out.write("<table border=\"1\">\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>작성자</th>\r\n");
      out.write("		<td><input type=\"text\" name=\"writer\" id=\"writer\" value=\"\"></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>이메일</th>\r\n");
      out.write("		<td><input type=\"text\" name=\"email\" id=\"email\" value=\"\"></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>비밀번호</th>\r\n");
      out.write("		<td><input type=\"password\" name=\"passwd\" id=\"passwd\" value=\"\"></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>제목</th>\r\n");
      out.write("		<td><input type=\"text\" name=\"subject\" id=\"subject\" value=\"");
      out.print( pageSubject );
      out.write("\"></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>내용</th>\r\n");
      out.write("		<td><textarea name=\"content\" id=\"content\" style=\"width:300px; height: 100px;\">");
      out.print( pageContent );
      out.write("</textarea></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>공지글</th>\r\n");
      out.write("		<td>\r\n");
      out.write("			<input type=\"radio\" name=\"noticeGubun\" id=\"noticeGubun1\" value=\"T\">공지글 &nbsp;\r\n");
      out.write("			<input type=\"radio\" name=\"noticeGubun\" id=\"noticeGubun2\" value=\"F\" checked>공지글아님 &nbsp;\r\n");
      out.write("		</td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>비밀글</th>\r\n");
      out.write("		<td>\r\n");
      out.write("			<input type=\"radio\" name=\"secretGubun\" id=\"secretGubun1\" value=\"T\">비밀글 &nbsp;\r\n");
      out.write("			<input type=\"radio\" name=\"secretGubun\" id=\"secretGubun2\" value=\"F\" checked>비밀글아님 &nbsp;\r\n");
      out.write("		</td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<td colspan=\"2\" align=\"center\">\r\n");
      out.write("			<button type=\"button\" onClick=\"save();\">저장하기</button>\r\n");
      out.write("			<button type=\"button\" onClick=\"location.href='main.jsp?menuGubun=board_list';\">목록으로</button>\r\n");
      out.write("		</td>\r\n");
      out.write("	</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("function save() {\r\n");
      out.write("	if(confirm('등록하시겠습니까?')) {\r\n");
      out.write("		document.WriteForm.action = \"mainProc.jsp?menuGubun=board_writeProc\";\r\n");
      out.write("		document.WriteForm.method = \"post\";\r\n");
      out.write("		document.WriteForm.submit();\r\n");
      out.write("	}\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
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
