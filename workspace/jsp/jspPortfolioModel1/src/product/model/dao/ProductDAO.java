package product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import product.model.dto.ProductDTO;

public class ProductDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int getTotalRecord(String searchField, String searchWord) {
		int result = 0;
		String searchValue = "";
		if(!searchField.trim().equals("") || !searchWord.trim().equals("")) {
			searchValue = "O";
		}
		conn = DB.dbConn();
		try {
			String query = "select count(*) Rcounter from product p ";
			if(searchValue.equals("O")) {
				if(searchField.equals("vendorName")) {
					query += " , vendor v "
						   + " where v.vendorCode = p.vendorCode and v.vendorName like upper ('%" + searchWord + "%') ";
				} else {
					query += " where " + searchField + " like upper ('%" + searchWord + "%') ";
				}
			}
			query += " order by productCode desc";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("Rcounter");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public ArrayList<ProductDTO> getSelectAll(String searchField, String searchWord, int startRecord, int lastRecord) {
		ArrayList<ProductDTO> list = new ArrayList<>();
		String searchValue = "";
		if(!searchField.trim().equals("") || !searchWord.trim().equals("")) {
			searchValue = "O";
		}
		conn = DB.dbConn();
		try {
			String query = "select * from ( "
						 + "	select A.*, ("
						 + "		select vendorName from vendor v where v.vendorCode = A.vendorCode) vendorName, "
						 + "		rownum rNum from ( select p.* from product p ";
			if(searchValue.equals("O")) {
				if(searchField.equals("vendorName")) {
					query += " , vendor v "
						   + " where v.vendorCode = p.vendorCode and v.vendorName like upper ('%" + searchWord + "%') ";
				} else {
					query += " where " + searchField + " like upper ('%" + searchWord + "%') ";
				}
			}
			query += "	order by productCode desc ) A ";
			query += ") where rNum between ? and ? ";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRecord);
			pstmt.setInt(2, lastRecord);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProductCode(rs.getInt("productCode"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				dto.setVendorCode(rs.getInt("vendorCode"));
				dto.setVendorName(rs.getString("vendorName"));
				dto.setAttachInfo(rs.getString("attachInfo"));
				dto.setRegiDate(rs.getDate("regiDate"));
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public ProductDTO getSelectOne(ProductDTO param) {
		ProductDTO dto = new ProductDTO();
		conn = DB.dbConn();
		try {
			String query = "select p.*, ( "
						 + "	select vendorName from vendor v where v.vendorCode = p.vendorCode) vendorName "
						 + "from product p where productCode = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getProductCode());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setProductCode(rs.getInt("productCode"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				dto.setVendorCode(rs.getInt("vendorCode"));
				dto.setVendorName(rs.getString("vendorName"));
				dto.setAttachInfo(rs.getString("attachInfo"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}

	public int setInsert(ProductDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "insert into product values (seq_product.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getProductName());
			pstmt.setInt(2, param.getProductPrice());
			pstmt.setInt(3, param.getVendorCode());
			pstmt.setString(4, param.getAttachInfo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(ProductDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "update product set productPrice = ? where productCode = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getProductPrice());
			pstmt.setString(2, param.getAttachInfo());
			pstmt.setInt(3, param.getProductCode());

			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);	
		}
		return result;
	}
	
	public int setDelete(ProductDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "delete from product where productCode = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getProductCode());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
