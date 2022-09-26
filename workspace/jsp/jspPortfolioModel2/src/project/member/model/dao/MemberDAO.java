package project.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import project.common.DB;
import project.member.model.dto.MemberDTO;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int getTotalRecord(MemberDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "select count(*) counter from member where 1 = 1";
			
			if(param.getSearchField().equals("id")) {
				query += " and id like ? ";
			} else if(param.getSearchField().equals("name")) {
				query += " and name like ? ";
			} else if(param.getSearchField().equals("id_name")) {
				query += " and (id like ? or name like ?) ";
			}

			pstmt = conn.prepareStatement(query);
			
			if(param.getSearchField().equals("id")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("name")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("id_name")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setString(2, '%' + param.getSearchWord() + '%');
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("counter");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public ArrayList<MemberDTO> getSelectAll(MemberDTO param) {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		conn = DB.dbConn();
		try {
			String query = "select * from member where 1 = 1";
			
			if(param.getSearchField().equals("id")) {
				query += " and id like ? ";
			} else if(param.getSearchField().equals("name")) {
				query += " and name like ? ";
			} else if(param.getSearchField().equals("id_name")) {
				query += " and (id like ? or name like ?) ";
			}

			query += " order by no desc";
			
			String sql = "";
			sql += "select * from (select A.*, rownum rnum from (";
			sql += query;
			sql += ") A) where rnum >= ? and rnum <= ?";
			
			pstmt = conn.prepareStatement(sql);
			
			if(param.getSearchField().equals("id")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setInt(2, param.getStartRecord());
				pstmt.setInt(3, param.getLastRecord());
			} else if(param.getSearchField().equals("name")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setInt(2, param.getStartRecord());
				pstmt.setInt(3, param.getLastRecord());
			} else if(param.getSearchField().equals("id_name")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setString(2, '%' + param.getSearchWord() + '%');
				pstmt.setInt(3, param.getStartRecord());
				pstmt.setInt(4, param.getLastRecord());
			} else {
				pstmt.setInt(1, param.getStartRecord());
				pstmt.setInt(2, param.getLastRecord());
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setJumin1(rs.getString("jumin1"));
				dto.setJumin2(rs.getString("jumin2"));
				dto.setPhone1(rs.getString("phone1"));
				dto.setPhone2(rs.getString("phone2"));
				dto.setPhone3(rs.getString("phone3"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				dto.setPostcode(rs.getString("postcode"));
				dto.setAddress(rs.getString("address"));
				dto.setDetailAddress(rs.getString("detailAddress"));
				dto.setExtraAddress(rs.getString("extraAddress"));	
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
	
	public MemberDTO getSelectOne(MemberDTO param) {
		MemberDTO dto = new MemberDTO();
		conn = DB.dbConn();
		try {
			//String query = "select * from member where no = ?";
			String query = "";
			query += "select * from ( ";
			
			query += "select m.*, ";
			query += "LAG(no) OVER(order by no desc) preNo, ";
			query += "LAG(name) OVER(order by no desc) preName, ";
			query += "LEAD(no) OVER(order by no desc) nxtNo, ";
			query += "LEAD(name) OVER(order by no desc) nxtName ";
			
			query += " from member m  where 1 = 1 ";
			
			if(param.getSearchField().equals("id")) {
				query += " and id like ? ";
			} else if(param.getSearchField().equals("name")) {
				query += " and name like ? ";
			} else if(param.getSearchField().equals("id_name")) {
				query += " and (id like ? or name like ?) ";
			}
			
			query += "order by no desc";
			
			query += ") where no = ?";
			
			pstmt = conn.prepareStatement(query);
			
			int k = 0;
			if(param.getSearchField().equals("id")) {
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("name")) {
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("id_name")) {
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
			}
			
			pstmt.setInt(++k, param.getNo());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setJumin1(rs.getString("jumin1"));
				dto.setJumin2(rs.getString("jumin2"));
				dto.setPhone1(rs.getString("phone1"));
				dto.setPhone2(rs.getString("phone2"));
				dto.setPhone3(rs.getString("phone3"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				
				dto.setPostcode(rs.getString("postcode"));
				dto.setAddress(rs.getString("address"));
				dto.setDetailAddress(rs.getString("detailAddress"));
				dto.setExtraAddress(rs.getString("extraAddress"));
				
				dto.setRegiDate(rs.getDate("regiDate"));
				
				dto.setPreNo(rs.getInt("preNo"));
				dto.setPreName(rs.getString("preName"));
				dto.setNxtNo(rs.getInt("nxtNo"));
				dto.setNxtName(rs.getString("nxtName"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public int setInsert(MemberDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "insert into member values (seq_member.nextval, ";
			query += " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ";
			query += " ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getId());
			pstmt.setString(2, param.getPasswd());
			pstmt.setString(3, param.getName());
			pstmt.setString(4, param.getJumin1());
			pstmt.setString(5, param.getJumin2());
			pstmt.setString(6, param.getPhone1());
			pstmt.setString(7, param.getPhone2());
			pstmt.setString(8, param.getPhone3());
			pstmt.setString(9, param.getEmail1());
			pstmt.setString(10, param.getEmail2());
			pstmt.setString(11, param.getPostcode());
			pstmt.setString(12, param.getAddress());
			pstmt.setString(13, param.getDetailAddress());
			pstmt.setString(14, param.getExtraAddress());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(MemberDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "update member set ";
			query += " phone1 = ?, phone2 = ?, phone3 = ?, email1 = ?, email2 = ?, ";
			query += " postcode = ?, address = ?, detailAddress = ?, extraAddress = ? ";
			query += " where no = ? and passwd = ? ";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getPhone1());
			pstmt.setString(2, param.getPhone2());
			pstmt.setString(3, param.getPhone3());
			pstmt.setString(4, param.getEmail1());
			pstmt.setString(5, param.getEmail2());
			pstmt.setString(6, param.getPostcode());
			pstmt.setString(7, param.getAddress());
			pstmt.setString(8, param.getDetailAddress());
			pstmt.setString(9, param.getExtraAddress());
			pstmt.setInt(10, param.getNo());
			pstmt.setString(11, param.getPasswd());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(MemberDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "delete from member where no = ? and passwd = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getNo());
			pstmt.setString(2, param.getPasswd());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int getIdCheckWin(String id) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "select no from member where id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("no");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public MemberDTO getLogin(String id, String passwd) {
		MemberDTO dto = new MemberDTO();
		conn = DB.dbConn();
		try {
			String query = "select no, id, name from member where id = ? and passwd = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}

}
