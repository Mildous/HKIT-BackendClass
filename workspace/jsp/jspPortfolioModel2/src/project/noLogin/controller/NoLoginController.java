package project.noLogin.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.common.Util;
import project.member.model.dao.MemberDAO;
import project.member.model.dto.MemberDTO;

@WebServlet("/noLogin_servlet/*")
public class NoLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Util util = new Util();
		
		String[] serverInfo = util.getSeverInfo(request);
		String referer = serverInfo[0];
		String path = serverInfo[1];
		String url = serverInfo[2];
		String uri = serverInfo[3];
		String ip = serverInfo[4];
		String ip6 = serverInfo[5];
		String folderName = serverInfo[6];
		String fileName = serverInfo[7];
		
		request.setAttribute("referer", referer);
		request.setAttribute("path", path);
		request.setAttribute("folderName", folderName);
		request.setAttribute("fileName", fileName);
		request.setAttribute("ip", ip);
		
		String forwardPage = "/WEB-INF/project/main/main.jsp";
		
		if(fileName.equals("login")) {
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("loginProc")) {
			String id = request.getParameter("user_id");
			String passwd = request.getParameter("user_pw");
			
			id = util.getNullBlankCheck(id);
			passwd = util.getNullBlankCheck(passwd);
			
			id = util.getCheckString(id);
			passwd = util.getCheckString(passwd);
			
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.getLogin(id, passwd);
			
			String msg = "아이디 또는 비밀번호가 다릅니다.\\n다시 이용해주세요..";
			//if(dto.getNo() == 0 || dto.getId() == null || dto.getName() == null ) {
			if(dto.getNo() > 0) {
				msg = "정상적으로 로그인되었습니다.";
				HttpSession session = request.getSession();
				session.setMaxInactiveInterval(1*60);	//초 단위
				
				session.setAttribute("sessionNo", dto.getNo());
				session.setAttribute("sessionId", dto.getId());
				session.setAttribute("sessionName", dto.getName());
			}
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + msg + "');");
			out.println("location.href='" + path + "';");
			out.println("</script>");
			out.flush();
			out.close();
			return;
			
		} else if(fileName.equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그아웃되었습니다.\\n즐거운 하루 되세요..');");
			out.println("location.href='" + path + "';");
			out.println("</script>");
			out.flush();
			out.close();
			return;
		}
	}
	
}
