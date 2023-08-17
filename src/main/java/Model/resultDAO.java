package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class resultDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	int cnt = 0;
	resultDTO dto = null;

	public void db_conn() {
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "campus_k_0325_4";
			String db_pw = "smhrd4";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);
			if (conn != null) {
				System.out.println("DB 연결성공");
			} else {
				System.out.println("DB 연결실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void db_close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();

			System.out.println("DB CLOSE");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int insertData(resultDTO dto) {
		db_conn();

		try {

			String sql = "insert into result values(?,?,?,?,?,sysdate)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getNickname());
			psmt.setString(2, dto.getPlaceid());
			psmt.setString(3, dto.getQuiz());
			psmt.setString(4, dto.getQuiz_set());
			psmt.setInt(5, dto.getScore());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}

		return cnt;
	}
	
	public ArrayList<String> resultinfo(String nick) {
		ArrayList<String> list = new ArrayList<String>();
		db_conn();

		try {
			
			String sql = "select quiz from result where nickname = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nick);
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				String quiz = rs.getString(1);

				list.add(quiz);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return list;
	}
}