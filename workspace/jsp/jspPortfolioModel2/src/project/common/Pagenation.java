package project.common;

public class Pagenation {
	
	public static String pagingStr(int totalRecord, int pageSize, int blockSize, int pageNum, String urlStr,
									String searchField, String searchWord) {
		String pagingStr = "";
		
		// 전체 페이지 수 계산
		int totalPages = (int)(Math.ceil(((double) totalRecord / pageSize)));
		
		// '이전 페이지 블록 바로가기' 출력
		int pageTemp = (((pageNum - 1) / blockSize) * blockSize) + 1;
		if(pageTemp != 1) {
			pagingStr += "&nbsp;<a href='" + urlStr + "?pageNum=1&searchField=" 
					   + searchField + "&searchWord=" + searchWord + "'>[처음으로]</a>&nbsp;";
			pagingStr += "&nbsp;";
			pagingStr += "&nbsp;<a href='" + urlStr + "?pageNum=" + (pageTemp - 1) + "&searchField=" 
					   + searchField + "&searchWord=" + searchWord + "'>[이전]</a>&nbsp;&nbsp;&nbsp;";
		}
		// 각 페이지 번호 출력
		int blockCount = 1;
		while(blockCount <= blockSize && pageTemp <= totalPages) {
			if(pageTemp == pageNum) {
				// 현재 페이지는 링크를 걸지 않음
				pagingStr += "&nbsp;<font color='#660000'><b>" + pageTemp + "</b></font>&nbsp;";
			}else {
				pagingStr += "&nbsp;<a href='" + urlStr + "?pageNum=" + pageTemp + "&searchField=" 
						   + searchField + "&searchWord=" + searchWord + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		// '다음 페이지 블록 바로가기' 출력
		if(pageTemp <= totalPages) {
			pagingStr += "&nbsp;&nbsp;&nbsp;<a href='" + urlStr + "?pageNum=" + pageTemp + "&searchField=" 
					   + searchField + "&searchWord=" + searchWord + "'>[다음]</a>&nbsp;";
			pagingStr += "&nbsp;";
			pagingStr += "&nbsp;<a href='" + urlStr + "?pageNum=" + totalPages + "&searchField=" 
					   + searchField + "&searchWord=" + searchWord + "'>[맨끝으로]</a>&nbsp;";
		}
		return pagingStr;
	}
}