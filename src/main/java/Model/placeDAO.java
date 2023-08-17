package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class placeDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	int cnt = 0;
	userDTO info = null;
	
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
	
	public ArrayList<placeDTO> placeinfo() {
		ArrayList<placeDTO> list = new ArrayList<placeDTO>();
		db_conn();
		
		try {
			
			String sql = "select * from placeinfo";
				 
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				String placeid = rs.getString(1);
				String quiz = rs.getString(2);
				String explanation = rs.getString(3);
				String latitude = rs.getString(4);
				String longitude = rs.getString(5);
				String path = rs.getString(6);
				
				placeDTO dto = new placeDTO(placeid, quiz, explanation, latitude, longitude, path);
				
				list.add(dto);
			}
			
			}catch (Exception e) {
				e.printStackTrace();	
			}finally {
				db_close();
			}return list;
	
	}
	
	
}
