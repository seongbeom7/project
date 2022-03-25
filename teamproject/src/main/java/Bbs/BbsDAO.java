package Bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class BbsDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mariadb://58.229.253.250:3306/student14";
			String dbID = "student14";
			String dbPassword = "1234!!";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int getNext() {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		String sql = "select bbs_idx from BBS order by bbs_idx desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	
	public ArrayList<Bbs> getList(int pageNumber){
		String sql = "select * from BBS where bbs_idx < ? and bbs_available = 1 order by bbs_idx desc limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbs_idx(rs.getInt(1));
				bbs.setBbs_title(rs.getString(2));
				bbs.setMem_id(rs.getString(3));
				bbs.setBbs_date(rs.getString(4));
				bbs.setBbs_content(rs.getString(5));
				bbs.setBbs_available(rs.getInt(6));
				list.add(bbs);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//하나의 게시글을 보는 메소드
		public Bbs getBbs(int bbs_idx) {
			String sql = "select * from BBS where bbs_idx = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bbs_idx);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					Bbs bbs = new Bbs();
					bbs.setBbs_idx(rs.getInt(1));
					bbs.setBbs_title(rs.getString(2));
					bbs.setMem_id(rs.getString(3));
					bbs.setBbs_date(rs.getString(4));
					bbs.setBbs_content(rs.getString(5));
					bbs.setBbs_available(rs.getInt(6));
					return bbs;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	
	
	//페이징 처리 메소드
		public boolean nextPage(int pageNumber) {
			String sql = "select * from BBS where bbs_idx < ? and bbs_available = 1";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return true;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return false;
		}
	
		//글쓰기 메소드
		public int write(String bbs_title, String mem_id, String bbs_content) {
			String sql = "insert into BBS values(?, ?, ?, now(), ?, ?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, bbs_title);
				pstmt.setString(3, mem_id);
				pstmt.setString(4, bbs_content);
				pstmt.setInt(5, 1); //글의 유효번호
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		
		//게시글 수정 메소드
		public int update(int bbs_idx, String bbs_title, String bbs_content) {
			String sql = "update BBS set bbs_title = ?, bbs_content = ? where bbs_idx = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bbs_title);
				pstmt.setString(2, bbs_content);
				pstmt.setInt(3, bbs_idx);
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		
		//게시글 삭제 메소드
		public int delete(int bbs_idx) {
			//실제 데이터를 삭제하는 것이 아니라 게시글 유효숫자를 '0'으로 수정한다
			String sql = "update BBS set bbs_available = 0 where bbs_idx = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bbs_idx);
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류 
		}
	
}
