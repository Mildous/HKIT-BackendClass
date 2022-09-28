package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProductDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int setInsert(ProductDTO param) {
		int result = 0;
		conn = Db.dbConn();
		try {
			String query = "insert into product values (seq_p_no.nextval, ?, ?, ?) ";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getCate());
			pstmt.setString(2, param.getPname());
			pstmt.setInt(3, param.getPrice());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			Db.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
