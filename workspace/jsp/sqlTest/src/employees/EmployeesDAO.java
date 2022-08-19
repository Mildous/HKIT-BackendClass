package employees;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmployeesDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public EmployeesDTO viewStevenKing() {
		
		EmployeesDTO dto = new EmployeesDTO();
		
		try {
			String dbDriver = "oracle.jdbc.driver.OracleDriver";
		    String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
		    String dbId = "hr";
		    String dbPw = "1234";
		      
		    Class.forName(dbDriver);
		    conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
		    System.out.println("오라클 접속 성공..");
		    
			String sql = "select * from employees where first_name = 'Steven' and last_name = 'King'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setEmployee_id(rs.getInt("employee_id"));
				dto.setFirst_name(rs.getString("first_name"));
				dto.setLast_name(rs.getString("last_name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone_number(rs.getString("phone_number"));
				dto.setHire_date(rs.getDate("hire_date"));
				dto.setJob_id(rs.getString("job_id"));
				dto.setSalary(rs.getInt("salary"));
				dto.setCommission_pct(rs.getDouble("commission_pct"));
				dto.setManager_id(rs.getInt("manager_id"));
				dto.setDepartment_id(rs.getInt("department_id"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) { rs.close(); }
			    if (pstmt != null) { pstmt.close(); }
			    if (conn != null) { conn.close(); }
			    System.out.println("오라클 접속 해제..");
			} catch(Exception e) {
				e.printStackTrace();
			}	
		}
		return dto;
	}
}