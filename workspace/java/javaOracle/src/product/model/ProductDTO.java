package product.model;

import java.sql.Date;
import java.util.Scanner;

public class ProductDTO {//한 사람분의 레코드를 저장
	private int productCode;
	private String productName;
	private int productPrice;
	private String productContent;
	private String vendor;
	private Date regiDate;
	
	public void dataInput(String div) {
		Scanner sc = new Scanner(System.in);
		if(div.equals("detail") || div.equals("edit") || div.equals("delete")) {
			System.out.print("상품코드 : ");
			this.productCode = Integer.parseInt(sc.nextLine());
		}
		if(div.equals("insert") || div.equals("edit")) {
			if(!div.equals("edit")) {
				System.out.print("상품명 : ");
				this.productName = sc.nextLine();
			}
			
			System.out.print("가격 : ");
			this.productPrice = Integer.parseInt(sc.nextLine());
			System.out.print("설명 : ");
			this.productContent = sc.nextLine();
			System.out.print("제조사 : ");
			this.vendor = sc.nextLine();
		}
	}
	
	public void display(String div) {
		String msg = "";
		msg += productCode + "\t";
		msg += productName + "\t";
		msg += productPrice + "\t";
		
		if(div.equals("detail")) {
			msg += productContent + "\t";
			msg += vendor + "\t";
		}
		msg += regiDate;
		System.out.println(msg);
	}
	
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public String getVendor() {
		return vendor;
	}
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}

}
