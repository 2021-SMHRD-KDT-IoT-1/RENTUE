package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DeviceDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	ArrayList<DeviceDTO> list = null;
	DeviceDTO dto = null;

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

	public int insert(DeviceDTO dto) {

		conn();

		String sql = "insert into Device values(device_num.nextval, ?, ?, ?, ?)";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getRent_id());
			psmt.setString(2, dto.getDevice_type());
			psmt.setString(3, dto.getRent_state());
			psmt.setString(4, dto.getBroken());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;

	}

	public int delete(String device_num) {
		conn();

		String sql = "delete from device where device_num = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, device_num);
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();

		}
		return cnt;

	}
	
	public String rent_state(int device_num) {
		String rent_state = null;
		conn();
		String sql = "select rent_state from Device where device_num = ?";

		try {

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, device_num);
		

			rs = psmt.executeQuery();

			if (rs.next()) {
				rent_state = rs.getString(1);				
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close();

		}
		return rent_state;

	}

	public String broken(int device_num) {
		String broken_state = null;
		conn();
		String sql = "select broken from Device where device_num = ?";

		try {

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, device_num);

			rs = psmt.executeQuery();

			if (rs.next()) {
				broken_state = rs.getString(1);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close();

		}
		return broken_state;

	}

	public ArrayList<DeviceDTO> select(String id) {
		
		
		list = new ArrayList<DeviceDTO>();
		conn();

		try {
			String sql = "select * from Device where rent_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {

				int device_num = rs.getInt(1);
				String rent_id = rs.getString(2);
				String device_type = rs.getString(3);
				String rent_state = rs.getString(4);
				String broken = rs.getString(5);

				dto = new DeviceDTO(device_num, rent_id, device_type, rent_state, broken);
				list.add(dto);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close();

		}

		return list;

	}

	public DeviceDTO selectOne(DeviceDTO dto) {
		conn();
		String sql = "select * from Device where device_num = ? ";

		try {

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getDevice_num());

			rs = psmt.executeQuery();

			if (rs.next()) {
				int device_num = rs.getInt(1);
				String rent_id = rs.getString(2);
				String device_type = rs.getString(3);
				String rent_state = rs.getString(4);
				String broken = rs.getString(5);

				dto = new DeviceDTO(device_num, rent_id, device_type, rent_state, broken);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close();

		}
		return dto;

	}

	}


