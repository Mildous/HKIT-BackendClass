package product.proc;

import java.sql.Date;
import java.util.ArrayList;

import product.model.ProductDAO;
import product.model.ProductDTO;

public class ExampleList {

	public static void main(String[] args) {
		ProductDAO productDao = new ProductDAO();
		ArrayList<ProductDTO> list = productDao.getSelectAll();
		
		for(int i=0; i<list.size(); i++) {
			ProductDTO productDto = list.get(i);
			int productCode = productDto.getProductCode();
			String productName = productDto.getProductName();
			int productPrice = productDto.getProductPrice();
			String productContent = productDto.getProductContent();
			String vendor = productDto.getVendor();
			Date regiDate = productDto.getRegiDate();
			
			System.out.println("productCode : " + productCode);
			System.out.println("productName : " + productName);
			System.out.println("productPrice : " + productPrice);
			System.out.println("productContent : " + productContent);
			System.out.println("vendor : " + vendor);
			System.out.println("regiDate : " + regiDate);
			System.out.println("------------------------------------");
		}
	}
}
