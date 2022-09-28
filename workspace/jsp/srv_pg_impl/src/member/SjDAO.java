package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SjDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<SjDTO> getList() {
		ArrayList<SjDTO> list = new ArrayList<SjDTO>();
		conn = Db.dbConn();
		try {
			String query = "select * from sj order by name asc";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SjDTO dto = new SjDTO();
				dto.setName(rs.getString(1));
				dto.setSname(rs.getString(2));
				dto.setMun_1(rs.getInt(3));
				dto.setMun_2(rs.getInt(4));
				dto.setMun_3(rs.getInt(5));
				dto.setMun_4(rs.getInt(6));
				dto.setMun_5(rs.getInt(7));
				dto.setMun_ox_1(rs.getString(8));
				dto.setMun_ox_2(rs.getString(9));
				dto.setMun_ox_3(rs.getString(10));
				dto.setMun_ox_4(rs.getString(11));
				dto.setMun_ox_5(rs.getString(12));
				dto.setJumsu(rs.getInt(13));
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			Db.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public int setInsert(SjDTO param) {
		int result = 0;
		conn = Db.dbConn();
		try {
			String query = "insert into sj values (?, ?, ?, ?, ?, ";
				  query += "?, ?, ?, ?, ?, ?, ?, ?) ";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getName());
			pstmt.setString(2, param.getSname());
			pstmt.setInt(3, param.getMun_1());
			pstmt.setInt(4, param.getMun_2());
			pstmt.setInt(5, param.getMun_3());
			pstmt.setInt(6, param.getMun_4());
			pstmt.setInt(7, param.getMun_5());
			pstmt.setString(8, param.getMun_ox_1());
			pstmt.setString(9, param.getMun_ox_2());
			pstmt.setString(10, param.getMun_ox_3());
			pstmt.setString(11, param.getMun_ox_4());
			pstmt.setString(12, param.getMun_ox_5());
			pstmt.setInt(13, param.getJumsu());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			Db.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
