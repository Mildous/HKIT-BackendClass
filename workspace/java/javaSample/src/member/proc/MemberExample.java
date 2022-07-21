package member.proc;

import java.util.Scanner;

import member.model.MemberDAO;

public class MemberExample {

	public void memberExec() {
		
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.print("회원관리 - (1)목록 (2)상세 (3)추가 (4)수정 (5)삭제 (0)종료 : ");
			String menu = sc.nextLine();
			
			if(menu.equals("1")) {
				MemberDAO memberDao = new MemberDAO();
				memberDao.getSelectAll();
				
			} else if(menu.equals("2")) {
				MemberDAO memberDao = new MemberDAO();
				memberDao.getSelectOne();
				
			} else if(menu.equals("3")) {
				MemberDAO memberDao = new MemberDAO();
				memberDao.setInsert();
				
			} else if(menu.equals("4")) {
				MemberDAO memberDao = new MemberDAO();
				memberDao.setUpdate();
				
			} else if(menu.equals("5")) {
				MemberDAO memberDao = new MemberDAO();
				memberDao.setDelete();
				
			} else {
				break;
			}
		}
		System.out.println("회원관리 종료..");
	}
}
