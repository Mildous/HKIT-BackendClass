package member.proc;

import java.util.ArrayList;
import java.util.Scanner;

import member.model.MemberDAO;
import member.model.MemberDTO;

public class Example {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.println("-- 회원관리 메뉴 --");
			System.out.println("(0)종료 (1)목록 (2)상세 (3)추가 (4)수정 (5)삭제");
			System.out.print("==> ");
			String menu = sc.nextLine();
			
			if(menu.equals("1")) {
				MemberDAO dao = new MemberDAO();
				ArrayList<MemberDTO> list = dao.getSelectAll();
				
				for(int i=0; i<list.size(); i++) {
					MemberDTO dto = list.get(i);
					dto.display("list");
				}
				
			} else if(menu.equals("2")) {
				MemberDTO dto = new MemberDTO();
				dto.input("detail");
				
				MemberDAO dao = new MemberDAO();
				MemberDTO dto2 = dao.getSelectOne(dto);
				
				if(dto2.getMemberNo()!=0) {
					dto2.display("detail");
		        }else {
		        	System.out.println("존재하지 않는 회원번호 입니다.");
		        }
			} else if(menu.equals("3")) {
				MemberDTO dto = new MemberDTO();
				dto.input("insert");
				
				MemberDAO dao = new MemberDAO();
				int result = dao.setInsert(dto);
				
			} else if(menu.equals("4")) {
				MemberDTO dto = new MemberDTO();
				dto.input("edit");
				
				MemberDAO dao = new MemberDAO();
				int result = dao.setUpdate(dto);
				
			} else if(menu.equals("5")) {
				MemberDTO dto = new MemberDTO();
				dto.input("delete");
				
				MemberDAO dao = new MemberDAO();
				int result = dao.setDelete(dto);	
			} else {
				break;
			}
		}
		System.out.println("-- 프로그램 종료 --");
		
	}

}
