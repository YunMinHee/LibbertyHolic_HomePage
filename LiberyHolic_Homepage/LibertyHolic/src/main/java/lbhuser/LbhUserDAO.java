package lbhuser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LbhUserDAO {

		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		public  LbhUserDAO () {
			try {
				String dbURL = "jdbc:mysql://localhost:3306/LBHBBS?useSSL=false";
				String dbId ="root";
				String dbPassword ="root";
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL, dbId, dbPassword);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public int login(String userID, String userPassword) {
			String SQL ="SELECT userPassword FROM LBHUSER WHERE userID =? ";
			
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString(1).equals(userPassword)) 
						return 1; // 로그인 성공
					else
						return 0; // 비밀번호 없음
				}
				return -1 ; // 존재하지 않는 아이디
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -2; // 데이터베이스 오류
		}
		public int join(LbhUser user) {
			String SQL ="INSERT INTO LBHUSER VALUES(?, ?, ?, ?, ?)";
			try {
				pstmt =conn.prepareStatement(SQL);
				pstmt.setString(1, user.getUserID());
				pstmt.setString(2, user.getUserPassword());
				pstmt.setString(3, user.getUserName());
				pstmt.setString(4, user.getUserGender());
				pstmt.setString(5, user.getUserEmail());
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace(); 
			}
			return -1; // 데이터베이스 오류
		}		
}
