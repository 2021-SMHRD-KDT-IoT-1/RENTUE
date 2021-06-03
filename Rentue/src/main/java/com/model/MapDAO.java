package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class MapDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
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
			if (rs != null) {
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
	
	public JSONObject search(double x, double y) {
		JSONObject list = new JSONObject();
		conn();
		
		try {
			String sql = "SELECT ROWNUM, x.ct_id, x.ct_name\r\n"
					+ "FROM (SELECT a.ct_id, a.ct_name, (6371 * acos( cos( RADIANS(?)) * cos( RADIANS(lat))\r\n"
					+ "	* cos( RADIANS(lon) - RADIANS(?))\r\n"
					+ "	+ sin( RADIANS(?)) * sin( RADIANS(lat)))) AS distance\r\n"
					+ "FROM ct_member a\r\n"
					+ "ORDER BY distance) x\r\n"
					+ "WHERE ROWNUM<=3";
			psmt = conn.prepareStatement(sql);
			
			psmt.setDouble(1, y);
			psmt.setDouble(2, x);
			psmt.setDouble(3, y);
			
			rs = psmt.executeQuery();

			while (rs.next()) {

				String ct_id = rs.getString(2);
				String ct_name = rs.getString(3);
				
				
				list.put(ct_id, ct_name);
				
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close();

		}

		return list;
	}
	
}
