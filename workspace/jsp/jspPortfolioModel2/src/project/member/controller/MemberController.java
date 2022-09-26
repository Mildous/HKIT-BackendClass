package project.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.common.Pagenation;
import project.common.Util;
import project.member.model.dao.MemberDAO;
import project.member.model.dto.MemberDTO;

@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
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
		
		String[] sessionArray = util.getSessionCheck(request);
		int sessionNo = Integer.parseInt(sessionArray[0]);
		String sessionId = sessionArray[1];
		String sessionName = sessionArray[2];
		
		if(sessionNo <= 0) {	// 로그인 안한 상태
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용바랍니다.');");
			out.println("location.href='" + path + "';");
			out.println("</script>");
			out.flush();
			out.close();
			return;
		}
		
		request.setAttribute("path", path);
		request.setAttribute("folderName", folderName);
		request.setAttribute("fileName", fileName);
		request.setAttribute("ip", ip);
		
		
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		String pageNum_ = request.getParameter("pageNum");
		int pageNum = util.getNumberCheck(pageNum_, 1);
		
		String imsiSearchYN = "Y";
		searchField = util.getNullBlankCheck(searchField);
		searchWord = util.getNullBlankCheck(searchWord);
		if(searchField.equals("") || searchWord.equals("")) {
			imsiSearchYN = "N";
			searchField = "";
			searchWord = "";
		}
		
		searchField = URLDecoder.decode(searchField, "UTF-8");
		searchWord = URLDecoder.decode(searchWord, "UTF-8");
		
		String searchQuery = "searchField=&searchWord=";
		if(imsiSearchYN.equals("Y")) {
			String imsisearchField = URLEncoder.encode(searchField, "UTF-8");
			String imsisearchWord = URLEncoder.encode(searchWord, "UTF-8");
			searchQuery = "searchField=" + imsisearchField + "&searchWord=" + imsisearchWord;
		}
		
		request.setAttribute("searchField", searchField);
		request.setAttribute("searchWord", searchWord);
		request.setAttribute("searchQuery", searchQuery);
		request.setAttribute("pageNum", pageNum);
		
		String forwardPage = "/WEB-INF/project/main/main.jsp";
		
		if(fileName.equals("list")) {
			
			MemberDTO dto = new MemberDTO();
			dto.setSearchField(searchField);
			dto.setSearchWord(searchWord);
			
			/* 페이징 처리 */
			int pageSize = 10;
			int blockSize = 5;
			MemberDAO dao = new MemberDAO();
		
			int totalRecord = dao.getTotalRecord(dto);
			
			int startRecord = pageSize * (pageNum - 1) + 1;
			int lastRecord = pageSize * pageNum;
			
			MemberDTO listDto = new MemberDTO();
			listDto.setStartRecord(startRecord);
			listDto.setLastRecord(lastRecord);
			listDto.setSearchField(searchField);
			listDto.setSearchWord(searchWord);
			
			ArrayList<MemberDTO> list = dao.getSelectAll(listDto);
			Map<String, Object> map = new HashMap<String, Object>();
			String pagingImg = Pagenation.pagingStr(totalRecord, pageSize, blockSize, pageNum, path + "/member_servlet/member_list.do", searchField, searchWord);
			
			map.put("pagingImg", pagingImg);
			map.put("totalRecord", totalRecord);
			map.put("pageSize", pageSize);
			map.put("pageNum", pageNum);
			
			request.setAttribute("list", list);
			request.setAttribute("map", map);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("view")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);

			if(no == 0) {
				if(sessionNo > 0) {
					no = sessionNo;
				} else {
					return;
				}
			}
			
			MemberDTO arguDto = new MemberDTO();
			arguDto.setNo(no);
			arguDto.setSearchField(searchField);
			arguDto.setSearchWord(searchWord);
			
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", dto);
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("regi")) {
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("edit")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);

			if(no == 0) {
				if(sessionNo > 0) {
					no = sessionNo;
				} else {
					return;
				}
			}

			MemberDTO arguDto = new MemberDTO();
			arguDto.setNo(no);
			arguDto.setSearchField(searchField);
			arguDto.setSearchWord(searchWord);
			
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", dto);
			
			request.getRequestDispatcher(forwardPage).forward(request, response);
			
		} else if(fileName.equals("drop")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);

			if(no == 0) {
				if(sessionNo > 0) {
					no = sessionNo;
				} else {
					return;
				}
			}
			
			MemberDTO arguDto = new MemberDTO();
			arguDto.setNo(no);
			arguDto.setSearchField(searchField);
			arguDto.setSearchWord(searchWord);
			
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", dto);
			
			request.getRequestDispatcher(forwardPage).forward(request, response);
		}
		
		// ==================== Process =====================
		
		if(fileName.equals("regiProc")) {
			String id = request.getParameter("id");
			String tempId = request.getParameter("tempId");
			String passwd = request.getParameter("passwd");
			String passwdChk = request.getParameter("passwdChk");
			String name = request.getParameter("name");
			String jumin1 = request.getParameter("jumin1");
			String jumin2 = request.getParameter("jumin2");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String postcode = request.getParameter("sample6_postcode");
			String address = request.getParameter("sample6_address");
			String detailAddress = request.getParameter("sample6_detailAddress");
			String extraAddress = request.getParameter("sample6_extraAddress");
			
			id = util.getNullBlankCheck(id);
			tempId = util.getNullBlankCheck(tempId);
			passwd = util.getNullBlankCheck(passwd);
			passwdChk = util.getNullBlankCheck(passwdChk);
			name = util.getNullBlankCheck(name);
			jumin1 = util.getNullBlankCheck(jumin1);
			jumin2 = util.getNullBlankCheck(jumin2);
			phone1 = util.getNullBlankCheck(phone1);
			phone2 = util.getNullBlankCheck(phone2);
			phone3 = util.getNullBlankCheck(phone3);
			email1 = util.getNullBlankCheck(email1);
			email2 = util.getNullBlankCheck(email2);
			postcode = util.getNullBlankCheck(postcode);
			address = util.getNullBlankCheck(address);
			detailAddress = util.getNullBlankCheck(detailAddress);
			extraAddress = util.getNullBlankCheck(extraAddress);
			
			int failCounter = 0;
			if(id.equals("")) { failCounter++; }
			if(tempId.equals("")) { failCounter++; }
			if(passwd.equals("")) { failCounter++; }
			if(passwdChk.equals("")) { failCounter++; }
			if(name.equals("")) { failCounter++; }
			if(jumin1.equals("")) { failCounter++; }
			if(jumin2.equals("")) { failCounter++; }
			if(phone1.equals("")) { failCounter++; }
			if(phone2.equals("")) { failCounter++; }
			if(phone3.equals("")) { failCounter++; }
			if(email1.equals("")) { failCounter++; }
			if(email2.equals("")) { failCounter++; }
			if(postcode.equals("")) { failCounter++; }
			if(address.equals("")) { failCounter++; }
			if(detailAddress.equals("")) { failCounter++; }
			if(extraAddress.equals("")) {
				extraAddress = "-";
			}
			
			if(!id.equals(tempId)) {
				failCounter++;
			}
			
			int imsiJumin1 = util.getNumberCheck(jumin1, 0);
			if(!(jumin1.length() == 6 && imsiJumin1 > 0)) {
				failCounter++;
			}
			
			int imsiJumin2 = util.getNumberCheck(jumin2, 0);
			if(!(jumin2.length() == 1 && imsiJumin2 > 0)) {
				failCounter++;
			}
			if(!(phone1.equals("010") || phone1.equals("011") || phone1.equals("016"))) {
				failCounter++;
			}
			
			int imsiPhone2 = util.getNumberCheck(phone2, 0);
			if(!(phone2.length() == 4 && imsiPhone2 >= 0)) {
				failCounter++;
			}
			
			int imsiPhone3 = util.getNumberCheck(phone3, 0);
			if(!(phone3.length() == 4 && imsiPhone3 >= 0)) {
				failCounter++;
			}
			
			if(failCounter > 0) {
				return;
			}
			
			if(!passwd.equals(passwdChk)) {
				return;
			}
			
			id = util.getCheckString(id);
			passwd = util.getCheckString(passwd);
			name = util.getCheckString(name);
			jumin1 = util.getCheckString(jumin1);
			jumin2 = util.getCheckString(jumin2);
			phone1 = util.getCheckString(phone1);
			phone2 = util.getCheckString(phone2);
			phone3 = util.getCheckString(phone3);
			email1 = util.getCheckString(email1);
			email2 = util.getCheckString(email2);
			postcode = util.getCheckString(postcode);
			address = util.getCheckString(address);
			detailAddress = util.getCheckString(detailAddress);
			extraAddress = util.getCheckString(extraAddress);
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setJumin1(jumin1);
			dto.setJumin2(jumin2);
			dto.setPhone1(phone1);
			dto.setPhone2(phone2);
			dto.setPhone3(phone3);
			dto.setEmail1(email1);
			dto.setEmail2(email2);
			dto.setPostcode(postcode);
			dto.setAddress(address);
			dto.setDetailAddress(detailAddress);
			dto.setExtraAddress(extraAddress);
			
			MemberDAO dao = new MemberDAO();
			int result = dao.setInsert(dto);
			/*
			int result = 0;
			for(int i=51; i<=100; i++) {
				dto.setId(id + i);
				dto.setPasswd(passwd);
				dto.setName(name + i);
				dto.setJumin1(jumin1);
				dto.setJumin2(jumin2);
				dto.setPhone1(phone1);
				dto.setPhone2(phone2);
				dto.setPhone3(phone3);
				dto.setEmail1(email1);
				dto.setEmail2(email2);
				dto.setPostcode(postcode);
				dto.setAddress(address);
				dto.setDetailAddress(detailAddress);
				dto.setExtraAddress(extraAddress);
				result = dao.setInsert(dto);
			}
			*/
			if(result > 0) {
				response.sendRedirect(path + "/member_servlet/member_list.do");
			} else {
				response.sendRedirect(path + "/member_servlet/member_regi.do");
			}
			
		} else if(fileName.equals("editProc")) {
			int no = Integer.parseInt(request.getParameter("no"));
			
			String passwd = request.getParameter("passwd");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String postcode = request.getParameter("sample6_postcode");
			String address = request.getParameter("sample6_address");
			String detailAddress = request.getParameter("sample6_detailAddress");
			String extraAddress = request.getParameter("sample6_extraAddress");
			
			no = util.getNumberCheck(no + "", 0);
			passwd = util.getNullBlankCheck(passwd);
			phone1 = util.getNullBlankCheck(phone1);
			phone2 = util.getNullBlankCheck(phone2);
			phone3 = util.getNullBlankCheck(phone3);
			email1 = util.getNullBlankCheck(email1);
			email2 = util.getNullBlankCheck(email2);
			postcode = util.getNullBlankCheck(postcode);
			address = util.getNullBlankCheck(address);
			detailAddress = util.getNullBlankCheck(detailAddress);
			extraAddress = util.getNullBlankCheck(extraAddress);
			
			int failCounter = 0;
			if(passwd.equals("")) { failCounter++; }
			if(phone1.equals("")) { failCounter++; }
			if(phone2.equals("")) { failCounter++; }
			if(phone3.equals("")) { failCounter++; }
			if(email1.equals("")) { failCounter++; }
			if(email2.equals("")) { failCounter++; }
			if(postcode.equals("")) { failCounter++; }
			if(address.equals("")) { failCounter++; }
			if(detailAddress.equals("")) { failCounter++; }
			if(extraAddress.equals("")) {
				extraAddress = "-";
			}
			
			if(no <= 0) {
				failCounter++;
			}
			
			if(!(phone1.equals("010") || phone1.equals("011") || phone1.equals("016"))) {
				failCounter++;
			}
			
			int imsiPhone2 = util.getNumberCheck(phone2, 0);
			if(!(phone2.length() == 4 && imsiPhone2 >= 0)) {
				failCounter++;
			}
			
			int imsiPhone3 = util.getNumberCheck(phone3, 0);
			if(!(phone3.length() == 4 && imsiPhone3 >= 0)) {
				failCounter++;
			}
			
			if(failCounter > 0) {
				return;
			}
			
			passwd = util.getCheckString(passwd);
			phone1 = util.getCheckString(phone1);
			phone2 = util.getCheckString(phone2);
			phone3 = util.getCheckString(phone3);
			email1 = util.getCheckString(email1);
			email2 = util.getCheckString(email2);
			postcode = util.getCheckString(postcode);
			address = util.getCheckString(address);
			detailAddress = util.getCheckString(detailAddress);
			extraAddress = util.getCheckString(extraAddress);
			
			MemberDTO dto = new MemberDTO();
			dto.setPasswd(passwd);
			dto.setPhone1(phone1);
			dto.setPhone2(phone2);
			dto.setPhone3(phone3);
			dto.setEmail1(email1);
			dto.setEmail2(email2);
			dto.setPostcode(postcode);
			dto.setAddress(address);
			dto.setDetailAddress(detailAddress);
			dto.setExtraAddress(extraAddress);
			dto.setNo(no);
			dto.setSearchField(searchField);
			dto.setSearchWord(searchWord);
			
			MemberDAO dao = new MemberDAO();
			MemberDTO returnDto = dao.getSelectOne(dto);
			
			if(!passwd.equals(returnDto.getPasswd())) {
				return;
			}

			int result = dao.setUpdate(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/member_servlet/member_view.do?no=" + no + "&" + searchQuery);
			} else {
				response.sendRedirect(path + "/member_servlet/member_edit.do?no=" + no + "&" + searchQuery);
			}
			
		} else if(fileName.equals("dropProc")) {
			int no = Integer.parseInt(request.getParameter("no"));
			String passwd = request.getParameter("passwd");
			
			no = util.getNumberCheck(no + "", 0);
			passwd = util.getNullBlankCheck(passwd);
			
			int failCounter = 0;
			if(passwd.equals("")) { failCounter++; }
			
			if(no <= 0) {
				failCounter++;
			}
			
			if(failCounter > 0) {
				return;
			}
			
			passwd = util.getCheckString(passwd);
			MemberDTO dto = new MemberDTO();			
			dto.setPasswd(passwd);
			dto.setNo(no);
			dto.setSearchField(searchField);
			dto.setSearchWord(searchWord);
			
			MemberDAO dao = new MemberDAO();
			MemberDTO returnDto = dao.getSelectOne(dto);
			
			if(!passwd.equals(returnDto.getPasswd())) {
				return;
			}

			int result = dao.setDelete(dto);
			
			if(result > 0) {
				response.sendRedirect(path + "/member_servlet/member_list.do?" + searchQuery);
			} else {
				response.sendRedirect(path + "/member_servlet/member_drop.do?no=" + no + "&" + searchQuery);
			}
		} else if(fileName.equals("search")) {
			
			//searchField = URLDecoder.decode(searchField, "UTF-8");
			//searchWord = URLDecoder.decode(searchWord, "UTF-8");
			
			
			String moveUrl = "";
			moveUrl += path + "/member_servlet/member_list.do?" + searchQuery;
			
			response.sendRedirect(moveUrl);
			
		} else if(fileName.equals("idCheck")) {
			String id = request.getParameter("id");
			id = util.getNullBlankCheck(id);
			
			MemberDAO dao = new MemberDAO();
			int result = dao.getIdCheckWin(id);
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
			return;
		
		} else if(fileName.equals("idCheckWin")) {
			request.setAttribute("imsiId", "");
			forwardPage = "/WEB-INF/project/member/idCheckWin.jsp";
			request.getRequestDispatcher(forwardPage).forward(request, response);
		
		} else if(fileName.equals("idCheckWinProc")) {
			String id = request.getParameter("id");
			id = util.getNullBlankCheck(id);
			
			MemberDAO dao = new MemberDAO();
			int result = dao.getIdCheckWin(id);
			
			String imsiId = id;
			String msg = "";
			if(result > 0) {
				imsiId = "";
				msg = "이미 존재하는 아이디 입니다.";
			} else {
				msg = "사용 가능한 아이디 입니다.";
			}
			request.setAttribute("id", id);
			request.setAttribute("msg", msg);
			request.setAttribute("imsiId", imsiId);
			
			forwardPage = "/WEB-INF/project/member/idCheckWin.jsp";
			request.getRequestDispatcher(forwardPage).forward(request, response);
		
		}
	}
}
