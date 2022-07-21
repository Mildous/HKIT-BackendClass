package product.proc;

import java.util.Scanner;

import product.model.ProductDAO;



public class ProductExample {

	public void productExec() {
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.print("상품관리 - (1)목록 (2)상세 (3)추가 (4)수정 (5)삭제 (0)종료 : ");
			String menu = sc.nextLine();
			
			if(menu.equals("1")) {
				ProductDAO productDao = new ProductDAO();
				productDao.getSelectAll();
				
			} else if(menu.equals("2")) {
				ProductDAO productDao = new ProductDAO();
				productDao.getSelectOne();
				
			} else if(menu.equals("3")) {
				ProductDAO productDao = new ProductDAO();
				productDao.setInsert();
				
			} else if(menu.equals("4")) {
				ProductDAO productDao = new ProductDAO();
				productDao.setUpdate();
				
			} else if(menu.equals("5")) {
				ProductDAO productDao = new ProductDAO();
				productDao.setDelete();
				
			} else {
				break;
			}
		}
		System.out.println("상품관리 종료..");

	}
}
