package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<DTO> getList() {
		ArrayList<DTO> list = new ArrayList<DTO>();
		conn = Db.dbConn();
		try {
			String query = "select * from member";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DTO dto = new DTO();
				dto.setId(rs.getString(1));
				dto.setPwd(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setPhone(rs.getString(4));
				dto.setJob(rs.getString(5));
				list.add(dto);
			}
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			Db.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public int setInsert(DTO param) {
		int result = 0;
		conn = Db.dbConn();
		try {
			String query = "insert into member values (?, ?, ?, ?, ?) ";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getId());
			pstmt.setString(2, param.getPwd());
			pstmt.setString(3, param.getName());
			pstmt.setString(4, param.getPhone());
			pstmt.setString(5, param.getJob());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			Db.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
