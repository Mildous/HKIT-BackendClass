package product.proc;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Scanner;

import product.model.ProductDAO;
import product.model.ProductDTO;

public class ProductExample {

	public void exec() {
		Scanner scanner = new Scanner(System.in);
		
		while(true) {
			System.out.println("──────────────── 상품관리 ────────────────");
			System.out.println("(1)목록 (2)상세 (3)추가 (4)수정 (5)삭제");
			System.out.println("(기타) 이전 메뉴..");
			System.out.print("==> ");
			String menu = scanner.nextLine();
			
			if (menu.equals("1")) {
				ProductDAO productDao = new ProductDAO();
				ArrayList<ProductDTO> list = productDao.getSelectAll();
				
				for(int i=0; i<list.size(); i++) {
					ProductDTO productDto = list.get(i);
					productDto.display("list");
				}
			} else if (menu.equals("2")) {
				ProductDTO productDto = new ProductDTO();
				productDto.dataInput("detail");
						
				ProductDAO productDao = new ProductDAO();
				ProductDTO dto = productDao.getSelectOne(productDto); //argument
				
				dto.display("detail");
			} else if (menu.equals("3")) {
				ProductDTO productDto = new ProductDTO(); //가방
				productDto.dataInput("insert");
				
				ProductDAO productDao = new ProductDAO();
				int result = productDao.setInsert(productDto);

			} else if (menu.equals("4")) {
				ProductDTO productDto = new ProductDTO();
				productDto.dataInput("edit");
				
				ProductDAO productDao = new ProductDAO();
				int result = productDao.setUpdate(productDto);
			} else if (menu.equals("5")) {
				ProductDTO productDto = new ProductDTO();
				productDto.dataInput("delete");
				
				ProductDAO productDao = new ProductDAO();
				int result = productDao.setDelete(productDto);
			} else {
				break;
			}
		}

	}

}
