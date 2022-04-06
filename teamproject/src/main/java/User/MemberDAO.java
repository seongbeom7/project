package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import Bbs.Bbs;

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
		String sql = "update MEMBER SET mem_id = ?, mem_password = ?, mem_name = ?, mem_birth = ?, mem_gender = ?, mem_registerdate = now()  where mem_phone = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMem_id());
			pstmt.setString(2, member.getMem_password());
			pstmt.setString(3, member.getMem_name());
			pstmt.setString(4, member.getMem_birth());
			pstmt.setString(5, member.getMem_gender());
			pstmt.setString(6, phone_format(member.getMem_phone()));			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//인증번호 보내기
	public int phoneconfirmation(String mem_phone) {
		String sql = "select mem_confirmation from MEMBER where mem_phone = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phone_format(mem_phone));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String sql1 = "update MEMBER SET mem_confirmation = ? where mem_phone = ? ";
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, excuteGenerate());
				pstmt.setString(2, phone_format(mem_phone));
				return pstmt.executeUpdate();
			}else{
				String sql2 = "insert into MEMBER(mem_phone, mem_confirmation) values(?,?)";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, phone_format(mem_phone));
				pstmt.setString(2, excuteGenerate());
				return pstmt.executeUpdate();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
		
	//휴대폰 인증하기
	public int phonecon(String mem_phone ) {
		String sql = "insert into MEMBER(mem_phone, mem_confirmation) values(?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_phone);
			pstmt.setString(2, excuteGenerate());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	//인증번호 다시 받기
	public int re_phonecon(String mem_phone) {
		String sql = "update MEMBER SET mem_confirmation = ? where mem_phone = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, excuteGenerate());
			pstmt.setString(2, mem_phone);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -3;
	}
	
	//랜덤 생성
	public String excuteGenerate() {
        Random random = new Random(System.currentTimeMillis());

        int range = (int)Math.pow(10,6);
        int trim = (int)Math.pow(10, 6-1);
        int result = random.nextInt(range)+trim;

        if(result>range){
            result = result - trim;
        }

        return String.valueOf(result);
    }
	
	public int confirmationCheck(String mem_phone, String mem_confirmation) {
		String sql = "select mem_confirmation from MEMBER where mem_phone = ?";
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, phone_format(mem_phone));
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString(1).equals(mem_confirmation)) {
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
	
	//휴대전화 포맷팅
	public String phone_format(String number) { 
		String regEx = "(\\d{3})(\\d{3,4})(\\d{4})"; 
		return number.replaceAll(regEx, "$1-$2-$3"); 
	}
	
	
}
