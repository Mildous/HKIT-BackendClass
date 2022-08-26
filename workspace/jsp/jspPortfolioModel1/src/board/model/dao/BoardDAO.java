package board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.model.dto.BoardDTO;
import config.DB;

public class BoardDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<BoardDTO> getSelectAll() {
		ArrayList<BoardDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String query = "selest * from board order by no desc";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
				dto.setTbl(rs.getString("tbl"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				dto.setParentNo(rs.getInt("parentNo"));
				dto.setHit(rs.getInt("hit"));
				dto.setIp(rs.getString("ip"));
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setSecretGubun(rs.getString("secretGubun"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setAttachInfo(rs.getString("attachInfo"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
			
		}
		return list;
	}
	
	public BoardDTO getSelectOne(BoardDTO param) {
		BoardDTO dto = new BoardDTO();
		conn = DB.dbConn();
		try {
			String query = "selest * from board where no = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
				dto.setTbl(rs.getString("tbl"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				dto.setParentNo(rs.getInt("parentNo"));
				dto.setHit(rs.getInt("hit"));
				dto.setIp(rs.getString("ip"));
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setSecretGubun(rs.getString("secretGubun"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setAttachInfo(rs.getString("attachInfo"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
			
		}
		return dto;
	}

	public int setInsert(BoardDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "insert into board values (seq_board.nextval, "
						 + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
						 + "?, ?, ?, ?, ?, ?, sysdate, ?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getNum());
			pstmt.setString(2, param.getTbl());
			pstmt.setString(3, param.getWriter());
			pstmt.setString(4, param.getSubject());
			pstmt.setString(5, param.getContent());
			pstmt.setString(6, param.getEmail());
			pstmt.setString(7, param.getPasswd());
			pstmt.setInt(8, param.getRefNo());
			pstmt.setInt(9, param.getStepNo());
			pstmt.setInt(10, param.getLevelNo());
			pstmt.setInt(11, param.getParentNo());
			pstmt.setInt(12, param.getHit());
			pstmt.setString(13, param.getIp());
			pstmt.setInt(14, param.getMemberNo());
			pstmt.setInt(15, param.getNoticeNo());
			pstmt.setString(16, param.getSecretGubun());
			pstmt.setString(17, param.getAttachInfo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(BoardDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "update board set "
						 + "subject = ?, "
						 + "content = ?, "
						 + "email = ?, "
						 + "noticeNo = ?, "
						 + "secretGubun = ?, "
						 + "attachInfo = ? "
						 + "where no = ? and passwd = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getSubject());
			pstmt.setString(2, param.getContent());
			pstmt.setString(3, param.getEmail());
			pstmt.setInt(4, param.getNoticeNo());
			pstmt.setString(5, param.getSecretGubun());
			pstmt.setString(6, param.getAttachInfo());
			pstmt.setInt(7, param.getNo());
			pstmt.setString(8, param.getPasswd());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);	
		}
		return result;
	}
	
	public int setDelete(BoardDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "delete from board where no = ?, passwd = ?";
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

}
