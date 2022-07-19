package product.proc;

import java.util.Scanner;

import product.model.ProductDAO;
import product.model.ProductDTO;


public class ExampleDelete {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("Product Code is.. ");
		int productCode = Integer.parseInt(sc.nextLine());
		
		
		ProductDTO productDto = new ProductDTO();
		productDto.setProductCode(productCode);
		
		int result = 0;
		ProductDAO productDao = new ProductDAO();
		result = productDao.setDelete(productDto);
		
		if (result > 0) {
			System.out.println("complete..");
		} else {
			System.out.println("fail..");
		}

	}

}
