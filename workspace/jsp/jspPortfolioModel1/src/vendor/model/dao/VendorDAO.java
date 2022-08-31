package vendor.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import vendor.model.dto.VendorDTO;

public class VendorDAO {
	
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
			String query = "select count(*) Rcounter from vendor ";
			if(searchValue.equals("O")) {
					query += " where " + searchField + " like '%" + searchWord + "%' ";
			}
			query += " order by vendorCode desc";
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
	
	public ArrayList<VendorDTO> getSelectAll(String searchField, String searchWord, int startRecord, int lastRecord) {
		ArrayList<VendorDTO> list = new ArrayList<>();
		String searchValue = "";
		if(!searchField.trim().equals("") || !searchWord.trim().equals("")) {
			searchValue = "O";
		}
		conn = DB.dbConn();
		try {
			String query = "select * from ( "
						 + "	select A.*, rownum rNum from ( "
						 + "		select * from vendor ";
			if(searchValue.equals("O")) {
					query += " where " + searchField + " like '%" + searchWord + "%' ";
			}
			query += "	order by vendorCode desc ) A ";
			query += ") where rNum between ? and ? ";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRecord);
			pstmt.setInt(2, lastRecord);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				VendorDTO dto = new VendorDTO();
				dto.setVendorCode(rs.getInt("vendorCode"));
				dto.setVendorName(rs.getString("vendorName"));
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
	
	public VendorDTO getSelectOne(VendorDTO param) {
		VendorDTO dto = new VendorDTO();
		conn = DB.dbConn();
		try {
			String query = "select * from vendor where vendorCode = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getVendorCode());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setVendorCode(rs.getInt("vendorCode"));
				dto.setVendorName(rs.getString("vendorName"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}

	public int setInsert(VendorDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "insert into vendor values (seq_vendor.nextval, ?, sysdate)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getVendorName());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(VendorDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "update vendor set vendorName = ? where vendorCode = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getVendorName());
			pstmt.setInt(2, param.getVendorCode());

			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);	
		}
		return result;
	}
	
	public int setDelete(VendorDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "delete from vendor where vendorCode = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getVendorCode());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
