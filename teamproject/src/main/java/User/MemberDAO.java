package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
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
	public int login(String mem_id, String mem_password) {
		String sql = "select mem_password from MEMBER where mem_id = ?";
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mem_id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString(1).equals(mem_password)) {
						return 1;
					}else
						return 0;
				}
				return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	public int join(Member member) {
		String sql = "insert into MEMBER(mem_id,mem_password,mem_name,mem_birth,mem_gender,mem_phone, mem_registerdate) values(?, ?, ?, ?, ?, ?, now())";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMem_id());
			pstmt.setString(2, member.getMem_password());
			pstmt.setString(3, member.getMem_name());
			pstmt.setString(4, member.getMem_birth());
			pstmt.setString(5, member.getMem_gender());
			pstmt.setString(6, member.getMem_phone());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}
