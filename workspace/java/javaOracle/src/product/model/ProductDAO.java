package product.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DB;

public class ProductDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<ProductDTO> getSelectAll() {
		ArrayList<ProductDTO> list = new ArrayList<>();
		try {
			conn = DB.dbConn();
			String sql = "Select productCode, productName, productPrice, regiDate from product order by productCode desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProductCode(rs.getInt("productCode"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				//dto.setProductContent(rs.getString("productContent"));
				//dto.setVendor(rs.getString("vendor"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public ProductDTO getSelectOne(ProductDTO paramDto) {	//Parameter
		ProductDTO dto = new ProductDTO();
		try {
			conn = DB.dbConn();
			String sql = "select * from product where productCode = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getProductCode());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setProductCode(rs.getInt("productCode"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				dto.setProductContent(rs.getString("productContent"));
				dto.setVendor(rs.getString("vendor"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
				
			} else {
				System.out.println("You entered it incorrectly...");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(ProductDTO paramDto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//-----------------------------------
			String sql = "insert into product values (seq_product.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getProductName());
			pstmt.setInt(2, paramDto.getProductPrice());
			pstmt.setString(3, paramDto.getProductContent());
			pstmt.setString(4, paramDto.getVendor());
			result = pstmt.executeUpdate();
			//-----------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(ProductDTO paramDto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//-----------------------------------
			String sql = "update product set productPrice = ?, productContent = ?, vendor = ? where productCode = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getProductPrice());
			pstmt.setString(2, paramDto.getProductContent());
			pstmt.setString(3, paramDto.getVendor());
			pstmt.setInt(4, paramDto.getProductCode());
			
			result = pstmt.executeUpdate();
			//-----------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(ProductDTO paramDto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//-----------------------------------
			String sql = "delete from product where productCode = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getProductCode());
			result = pstmt.executeUpdate();
			//-----------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
