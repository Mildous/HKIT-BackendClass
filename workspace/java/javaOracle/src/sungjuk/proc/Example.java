package sungjuk.proc;

import java.util.ArrayList;
import java.util.Scanner;

import sungjuk.model.SungjukDAO;
import sungjuk.model.SungjukDTO;

public class Example {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		while (true) {
			System.out.println("-- 성적관리 메뉴 --");
			System.out.println("(0)종료 (1)목록 (2)상세 (3)추가 (4)수정 (5)삭제");
			System.out.print("==> ");
			String menu = sc.nextLine();
			
			if (menu.equals("1")) {
				SungjukDAO dao = new SungjukDAO();
				ArrayList<SungjukDTO> list = dao.getSelectAll();
				
				for(int i=0; i<list.size(); i++) {
					SungjukDTO dto = list.get(i);
					dto.display("list");
				}
			} else if (menu.equals("2")) {
				SungjukDTO dto = new SungjukDTO();
				dto.input("detail");
				
				SungjukDAO dao = new SungjukDAO();
				SungjukDTO dto2 = dao.getSelectOne(dto);
				dto2.display("detail");
				
			} else if (menu.equals("3")) {
				SungjukDTO dto = new SungjukDTO();
				dto.input("insert");
				dto.cal();
				
				SungjukDAO dao = new SungjukDAO();
				int result = dao.setInsert04(dto);
				
			} else if (menu.equals("4")) {
				SungjukDTO dto = new SungjukDTO();
				dto.input("edit");
				dto.cal();
				
				SungjukDAO dao = new SungjukDAO();
				int result = dao.setUpdate(dto);
				
			} else if (menu.equals("5")) {
				SungjukDTO dto = new SungjukDTO();
				dto.input("delete");
				
				SungjukDAO dao = new SungjukDAO();
				int result = dao.setDelete(dto);
			} else {
				break;
			}
		}
		System.out.println("-- 프로그램 종료 --");
	}

}
