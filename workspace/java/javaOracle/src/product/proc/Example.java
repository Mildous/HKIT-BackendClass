package product.proc;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Scanner;

import product.model.ProductDAO;
import product.model.ProductDTO;

public class Example {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		while(true) {
			System.out.print("MENU\n0: 종료, 1: 목록, 2: 상세보기, 3: 입력, 4: 수정, 5: 삭제 ==> ");
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
