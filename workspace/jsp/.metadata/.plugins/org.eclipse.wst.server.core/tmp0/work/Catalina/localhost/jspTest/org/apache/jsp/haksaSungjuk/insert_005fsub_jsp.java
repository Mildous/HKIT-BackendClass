/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.65
 * Generated at: 2022-08-17 06:54:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.haksaSungjuk;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import haksaSihum.model.dto.HaksaSihumDTO;
import haksaSihum.model.dao.HaksaSihumDAO;
import haksaMember.model.dto.HaksaMemberDTO;
import haksaMember.model.dao.HaksaMemberDAO;
import haksaSungjuk.model.dto.HaksaSungjukDTO;
import haksaSungjuk.model.dao.HaksaSungjukDAO;
import java.util.ArrayList;

public final class insert_005fsub_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("haksaSungjuk.model.dto.HaksaSungjukDTO");
    _jspx_imports_classes.add("haksaMember.model.dao.HaksaMemberDAO");
    _jspx_imports_classes.add("haksaMember.model.dto.HaksaMemberDTO");
    _jspx_imports_classes.add("haksaSungjuk.model.dao.HaksaSungjukDAO");
    _jspx_imports_classes.add("haksaSihum.model.dto.HaksaSihumDTO");
    _jspx_imports_classes.add("haksaSihum.model.dao.HaksaSihumDAO");
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
      out.write("<h2>성적등록</h2>\r\n");
      out.write("\r\n");
      out.write("<form name=\"DirForm\">\r\n");
      out.write("<table border=\"1\" width=\"50%\" align=\"center\">\r\n");
      out.write("	<tr>		\r\n");
      out.write("		<th>이름</th>\r\n");
      out.write("		<td>\r\n");
      out.write("			");

				HaksaMemberDAO memberDao = new HaksaMemberDAO();
				ArrayList<HaksaMemberDTO> mList = memberDao.getSelectAll();
			
      out.write("\r\n");
      out.write("			<select name=\"hakbun\">\r\n");
      out.write("				<option value=\"\" selected>-- 선택하세요 --</option>\r\n");
      out.write("				");

					for(int i=0; i<mList.size(); i++) {
						HaksaMemberDTO dto = mList.get(i);
						
						String selectedValue = "";
						if(dto.getHakbun() == 0) {
							selectedValue = "selected";
						}
				
      out.write("\r\n");
      out.write("				<option value=\"");
      out.print( dto.getHakbun() );
      out.write('"');
      out.write('>');
      out.print( dto.getName() );
      out.write("</option>\r\n");
      out.write("				");

					}
				
      out.write("\r\n");
      out.write("			</select>\r\n");
      out.write("		</td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>시험명</th>\r\n");
      out.write("		<td>\r\n");
      out.write("			");

				HaksaSihumDAO sihumDao = new HaksaSihumDAO();
				ArrayList<HaksaSihumDTO> sList = sihumDao.getSelectAll();
			
      out.write("\r\n");
      out.write("			<select name=\"sihumNo\">\r\n");
      out.write("				<option value=\"\" selected>-- 선택하세요 --</option>\r\n");
      out.write("				");

					for(int i=0; i<sList.size(); i++) {
						HaksaSihumDTO dto = sList.get(i);
						
						String selectedValue = "";
						if(dto.getSihumNo() == 0) {
							selectedValue = "selected";
						}
				
      out.write("\r\n");
      out.write("				<option value=\"");
      out.print( dto.getSihumNo() );
      out.write('"');
      out.write('>');
      out.print( dto.getSihumName() );
      out.write("</option>\r\n");
      out.write("				");

					}
				
      out.write("\r\n");
      out.write("			</select>\r\n");
      out.write("		</td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>국어점수</th>\r\n");
      out.write("		<td><input type=\"text\" name=\"kor\" id=\"kor\"></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>영어점수</th>\r\n");
      out.write("		<td><input type=\"text\" name=\"eng\" id=\"eng\"></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>수학점수</th>\r\n");
      out.write("		<td><input type=\"text\" name=\"mat\" id=\"mat\"></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>과학점수</th>\r\n");
      out.write("		<td><input type=\"text\" name=\"sci\" id=\"sci\"></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>역사점수</th>\r\n");
      out.write("		<td><input type=\"text\" name=\"his\" id=\"his\"></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<td colspan=\"2\" align=\"center\">\r\n");
      out.write("			<button type=\"button\" onClick=\"formSubmit();\">저장하기</button>\r\n");
      out.write("			<button type=\"button\" onClick=\"location.href='list.jsp';\">목록으로</button>\r\n");
      out.write("		</td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("function formSubmit() {\r\n");
      out.write("	if(confirm('저장하시겠습니까?')) {\r\n");
      out.write("		document.DirForm.action = \"insertProc.jsp\";\r\n");
      out.write("		document.DirForm.method = \"post\";\r\n");
      out.write("		document.DirForm.submit();\r\n");
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
