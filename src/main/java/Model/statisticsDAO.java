package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class statisticsDAO {

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
	
	
	public ArrayList<statisticsDTO> statistics() {
		db_conn();
		
		String[] ages = {"10대", "20대", "30대", "40대", "50대", "60대이상"}; 
		
		HashMap<String, Integer> age_cnt = new HashMap<String, Integer>(); 
		
		ArrayList<statisticsDTO> list = new ArrayList<statisticsDTO>(); 

		try {
			
			for(int i = 0; i < ages.length; i++) {
				String sql = "select count(*) from userdata where age=?";
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, ages[i]);
		
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int cnt = rs.getInt(1);
					
					age_cnt.put(ages[i], cnt);
					
					statisticsDTO dto = new statisticsDTO(ages[i], cnt);
					list.add(dto);
				}	
			}	
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db_close();
		}
		return list;

	}
	
	public ArrayList<reviewDTO> review() {
		db_conn();
		
		String[] ages = {"10대", "20대", "30대", "40대", "50대", "60대이상"}; // db 에서 추출
		String[] reviews = {"매우 도움이 됐다.", "어느정도 도움이 됐다.", "보통이다.", "별로 도움이 안됐다.", "전혀 도움이 안됐다."};
		
		HashMap<String, Integer> age_cnt = new HashMap<String, Integer>(); // age_cnt.get("10대") = 50 // "20대" 9 
		HashMap<String, Integer> review_cnt = new HashMap<String, Integer>();
		ArrayList<reviewDTO> list2 = new ArrayList<reviewDTO>(); 

		try {
			
			for(int i = 0; i < reviews.length; i++) {
				String sql = "select count(*) from userdata where review=?";
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, reviews[i]);
		
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int cnt = rs.getInt(1);
					
					review_cnt.put(reviews[i], cnt);
					
					reviewDTO dto = new reviewDTO(reviews[i],cnt);
					list2.add(dto);
				}
		
			}			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db_close();
		}return list2;
	}
	
	public ArrayList<cityDTO> city() {
		db_conn();
		String[] city = {"서울특별시","광주광역시","인천광역시","부산광역시","대전광역시","울산광역시","대구광역시","경기도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","강원도","제주도"};
		
		HashMap<String, Integer> city_cnt = new HashMap<String, Integer>();
		ArrayList<cityDTO> list3 = new ArrayList<cityDTO>();
		try {
			for(int i = 0; i < city.length ; i++) {
				String sql = "select count(*) from userdata where city=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, city[i]);
				rs = psmt.executeQuery();
				while(rs.next()) {
					int cnt = rs.getInt(1);
					city_cnt.put(city[i], cnt);
					cityDTO dto = new cityDTO(city[i],cnt);
					list3.add(dto);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db_close();
		}return list3;
	}
	
	public ArrayList<letterDTO> prevletter(){
		db_conn();
		
		ArrayList<letterDTO> list4 = new ArrayList<letterDTO>();
		try {
			String sql = "select prevletter, count(*) cnt from userdata where not prevletter is null group by prevletter";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String letter = rs.getString("prevletter");
				int cnt = rs.getInt("cnt");
				
				letterDTO dto = new letterDTO(letter, cnt);
				
				list4.add(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db_close();
		}
		return list4;
	}
	
	public ArrayList<letterDTO> nextletter(){
		db_conn();
		
		ArrayList<letterDTO> list4 = new ArrayList<letterDTO>();
		try {
			String sql = "select nextletter, count(*) cnt from userdata where not prevletter is null group by nextletter";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String letter = rs.getString("nextletter");
				int cnt = rs.getInt("cnt");
				
				letterDTO dto = new letterDTO(letter, cnt);
				
				list4.add(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db_close();
		}
		return list4;
	}
}

