package project.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.Inet4Address;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Util {
	
	public String[] getSeverInfo(HttpServletRequest req) throws UnknownHostException {
		String referer = req.getHeader("REFERER");
		if(referer == null || referer.trim().equals("")) {
			referer = "";
		}
		
		String path = req.getContextPath();
		String url = req.getRequestURL().toString();
		String uri = req.getRequestURI().toString();
		String ip = Inet4Address.getLocalHost().getHostAddress();
		
		String ip6 = req.getHeader("X-Forwarded-For");  
        if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
        	ip6 = req.getHeader("Proxy-Client-IP");  
        }  
        if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
        	ip6 = req.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
        	ip6 = req.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
        	ip6 = req.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
        	ip6 = req.getRemoteAddr();  
        }
        

		String[] imsiUriArray = uri.split("/");
		String imsiUriFileName = imsiUriArray[imsiUriArray.length-1];
		imsiUriFileName = imsiUriFileName.replace(".do", "");
		
		

		String folderName="";
		String fileName="";
		if(!path.equals("/"+imsiUriFileName)) {
	     String[] imsiArray=imsiUriFileName.split("_");
	     folderName=imsiArray[0];
	     fileName=imsiArray[1];
		}
		
		String[] array = new String[8];
		array[0] = referer;
		array[1] = path;
		array[2] = url;
		array[3] = uri;
		array[4] = ip;
		array[5] = ip6;
		array[6] = folderName;
		array[7] = fileName;
		
		return array;
	}
	
	public String[] getSessionCheck(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int sessionNo = 0;
		String sessionId = "";
		String sessionName = "";
		
		if(session.getAttribute("sessionNo") != null) {
			sessionNo = (Integer)session.getAttribute("sessionNo");
		}
		
		if(session.getAttribute("sessionId") != null) {
			sessionId = (String)session.getAttribute("sessionId");
		}
		
		if(session.getAttribute("sessionName") != null) {
			sessionName = (String)session.getAttribute("sessionName");
		}
		String[] result = new String[3];
		result[0] = sessionNo + "";
		result[1] = sessionId;
		result[2] = sessionName;
		return result;
	}
	
	public String getCheckString(String str) {
		String result = "";
		result = str;
		result = result.replace(">", "&gt;");
		result = result.replace("<", "&lt;");
		result = result.replace("\"", "&quot;");
		result = result.replace("'", "&apos;");
		result = result.replace("&", "&amp;");
		return result;
	}
	
	public String getNullBlankCheck(String str) {
		String result = str;
		
		if(result == null || result.trim().equals("")) {
			result = "";
		}
		
		return result;
	}
	
	public int getNumberCheck(String str, int defaultStr) {
		int result = 0;
		String temp = str;
		
		if(temp == null || temp.trim().equals("")) {
			temp = "-";
		}
		
		for(int i=0; i<=9; i++) {
			temp = temp.replace(i + "", "");
		}
/*
 * 		try {
 * 			Double.parseDouble(str);
 * 			return Integer.parseInt(str);
 * 		} catch(Exception e) {
 * 			return Integer.parseInt(str);
 * 		}
 */
		if(temp.equals("")) { //숫자로만 구성된..
			result = Integer.parseInt(str);
		} else {
			result = defaultStr;
		}
		return result;
	}
	
	public int[] getCalendar() {
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		//System.out.println("현재 시각은 " + year + "년 " + month + "월 " + day + "일 " + hour + ":" + minute + ":" + second + " 입니다.");
		
		int[] result = new int[6];
		result[0] = year;
		result[1] = month;
		result[2] = day;
		result[3] = hour;
		result[4] = minute;
		result[5] = second;
		
		return result;
	}
	
	public String getDateTime() {
		int[] intResult = getCalendar();
		String result = "";
		
		
		int imsi = 0;
		result += intResult[0];
		
		for(int i=1; i<intResult.length; i++) {
			imsi = intResult[i];
			
			if(imsi < 10) {
				result += "0" + imsi;
			} else {
				result += imsi;
			}
		}
		
		return result;
	}
	public String createUuid() {
		return UUID.randomUUID().toString();
	}
	
	
}
