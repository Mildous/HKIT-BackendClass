package product.proc;

import java.util.Scanner;

import product.model.ProductDAO;
import product.model.ProductDTO;

public class ExampleInsert {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("Product's Name.. ");
		String productName = scanner.nextLine();
		System.out.print("Product's Price.. ");
		int productPrice = Integer.parseInt(scanner.nextLine());
		System.out.print("Product's Content.. ");
		String productContent = scanner.nextLine();
		System.out.print("Product's Vendor.. ");
		String vendor = scanner.nextLine();
		
		ProductDTO productDto = new ProductDTO(); //가방
		productDto.setProductName(productName);
		productDto.setProductPrice(productPrice);
		productDto.setProductContent(productContent);
		productDto.setVendor(vendor);
		
		ProductDAO productDao = new ProductDAO();
		int result = productDao.setInsert(productDto);
		
		if (result > 0) {
			System.out.println("complete..");
		} else {
			System.out.println("fail..");
		}
	}

}
