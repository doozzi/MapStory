package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class quizDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	quizDTO dto = null;
	
	public void db_conn() {
		try {
	
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "campus_k_0325_4";
			String db_pw = "smhrd4";
			
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		 	if(conn != null) {
		 		System.out.println("DB 연결성공");
			}else {
				System.out.println("DB 연결실패");
		 	}
		}catch (Exception e) {
				e.printStackTrace();			
		}
		
	}

	// DB
	public void db_close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
			
			System.out.println("DB CLOSE");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public quizDTO quizinfo(String quizid, String placeid) {
		db_conn();
		
		try {
			String sql = "select * from quizinfo where quiz = ? and placeid = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, quizid);
			psmt.setString(2, placeid);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String quiz = rs.getString(1);
				String pid = rs.getString(2);
				String quiz_type = rs.getString(3);
				String quiz_ex = rs.getString(4);
				String answer = rs.getString(5);
				String quiz_path = rs.getString(6);
				
				dto = new quizDTO(quiz, pid, quiz_type, quiz_ex, answer, quiz_path);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		
		return dto;
	}
}
