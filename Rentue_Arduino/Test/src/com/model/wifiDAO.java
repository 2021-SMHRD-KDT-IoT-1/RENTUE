package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class wifiDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	wifiDTO dto = null;
	ArrayList<wifiDTO> list = null;

	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void close() {
		try {
			if(rs != null) {
				rs.close();
			}	
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int insertwifi(wifiDTO dto) {
		
		conn();
		
		String sql = "insert into wifi values(?, ?, ?, sysdate)";
	
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getChars());
			psmt.setString(2, dto.getFlon());
			psmt.setString(3, dto.getFlat());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
		
	}
public ArrayList<wifiDTO> select() {
		
		list = new ArrayList<wifiDTO>();
		conn();
		
		try {
			String sql = "select * from wifi";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
			

				String flon = rs.getString(1);
				String flat = rs.getString(2);
				String chars = rs.getString(3);
				String w_date = rs.getString(4);
				
				dto = new wifiDTO(flon, flat, chars, w_date);
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
public wifiDTO selectOne() {
	
	conn();
	
	try {
		String sql = "select * from ( select * from wifi order by w_date desc ) where rownum = 1";
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		
		while(rs.next()) {
		

			String flon = rs.getString(1);
			String flat = rs.getString(2);
			String chars = rs.getString(3);
			String w_date = rs.getString(4);
			
			dto = new wifiDTO(flon, flat, chars, w_date);
			
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close();
	}
	
	return dto;
}

}
