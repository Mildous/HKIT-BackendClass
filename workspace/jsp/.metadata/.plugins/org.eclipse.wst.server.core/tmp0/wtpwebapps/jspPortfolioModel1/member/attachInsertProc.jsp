<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
	request.setCharacterEncoding("utf-8");

	String attachPath = "C:/Users/HKIT/COY/attach";
	String uploadPath = attachPath + request.getContextPath() + "/member";	// "/jspPortfolioModel1/member";
	int maxUpload = 1024 * 1024 * 100;	// 업로드 할 수 있는 최대 용량: 100mb
	String encoding = "utf-8";
	
	// MultipartRequest 인스턴스 생성 - WEB-INF/lib에 cos.jar 추가
	MultipartRequest multi = new MultipartRequest(
		request,
		uploadPath,	// 파일저장경로
		maxUpload,	// 용량
		encoding,	// 인코딩타입
		new DefaultFileRenamePolicy()	// 중복파일처리(동일파일명 업로드 시 뒤에 숫자가 붙음)
		);
	
	String id = multi.getParameter("id");
	String passwd = multi.getParameter("passwd");
	String passwdChk = multi.getParameter("passwdChk");
	String name = multi.getParameter("name");
	String phone = multi.getParameter("phone");
	String email = multi.getParameter("email");
	String jumin1 = multi.getParameter("jumin1");
	String jumin2 = multi.getParameter("jumin2");
	String juso1 = multi.getParameter("juso1");
	String juso2 = multi.getParameter("juso2");
	String juso3 = multi.getParameter("juso3");
	String juso4 = multi.getParameter("juso4");
	String grade = multi.getParameter("grade");
	
	String jumin = jumin1 + "-" + jumin2;
	
	if(juso4 == null || juso4.trim().equals("")) {
		juso4 = "-";
	}
	
	String attachInfo = "";
	try {
		Enumeration<String> files = multi.getFileNames();	// 전송한 전체 파일이름을 가져옴
		while(files.hasMoreElements()) {
			String tagName = "";
			String fileOriginName = "";
			String fileSavedName = "";
			String fileType = "";
			String fileSize = "";
			String fileExtName = "";	// .png .jpg .jpeg, .gif
			
			// form 태그에서 <input type="file" name="지정한 이름" /> 을 가져옴
			tagName = (String)files.nextElement();
			// input file name에 해당하는 실제 파일을 가져옴
			File fileObj = multi.getFile(tagName);
			
			if(fileObj != null) {	// 해당 tagName에 파일을 첨부했으면
				fileOriginName = multi.getOriginalFileName(tagName);
				fileSavedName = multi.getFilesystemName(tagName);
				fileType = multi.getContentType(tagName);
				fileSize = String.valueOf(fileObj.length());
				fileExtName = "";
			}
			
			out.println(fileOriginName + " / " + fileSavedName + " / " + fileType + " / " + fileSize + "<br>");
		}
	} catch(Exception e) {
		//e.printStackTrace();
	}
	
%>