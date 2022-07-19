package product.proc;

import java.util.Scanner;

import product.model.ProductDAO;
import product.model.ProductDTO;

public class ExampleUpdate {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Product Code is.. ");
		int productCode = Integer.parseInt(scanner.nextLine());
		System.out.print("Product Price is.. ");
		int productPrice = Integer.parseInt(scanner.nextLine());
		System.out.print("Product content is.. ");
		String productContent = scanner.nextLine();
		System.out.print("Product vendor is.. ");
		String vendor = scanner.nextLine();
		
		ProductDTO productDto = new ProductDTO();
		productDto.setProductCode(productCode);
		productDto.setProductPrice(productPrice);
		productDto.setProductContent(productContent);
		productDto.setVendor(vendor);
		
		ProductDAO productDao = new ProductDAO();
		int result = productDao.setUpdate(productDto);
		if (result > 0) {
			System.out.println("complete..");
		} else {
			System.out.println("fail..");
		}

	}

}
