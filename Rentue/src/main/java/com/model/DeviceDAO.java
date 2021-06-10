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

	public int insert(String rent_id, String targetSel) {

		conn();


		String sql = null;
		if (targetSel.equals("A")) {
			sql = "insert into Device(device_num, rent_id, device_type) values(handi_num.nextval, ?, 'A')";
		} else  
			sql = "insert into Device(device_num, rent_id, device_type) values(device_num.nextval, ?, 'B')";


		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, rent_id);

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
	
	public int state_update(String device_num) {
		
		conn();

		try {
			String sql = 
			"update device "
			+ "set rent_state = (case when rent_state='T' then 'F' else 'T' end)"
			+ "where device_num = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, device_num);
		

		cnt= psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}

	public int broken_update(String device_num) {
		
		conn();

		try {

			String sql = "update device set broken = (case when broken = 'T' then 'F' else 'T' end) where device_num= ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1,device_num);

			

			cnt= psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}

	public ArrayList<DeviceDTO> select(String id, String device_typet) {
		
		
		list = new ArrayList<DeviceDTO>();
		conn();

		try {
			String sql = "select * from Device ";
			if (id != null) {
				sql = sql.concat("where rent_id=? ");
				if (device_typet != null) {
					sql = sql.concat("and device_type=? ");
				}
			}
			sql = sql.concat("order by device_num asc");
			psmt = conn.prepareStatement(sql);
			if (id != null) {
				sql = sql.concat("where rent_id=? ");
				psmt.setString(1, id);
				if (device_typet != null) {
					sql = sql.concat("and device_type=?");
					psmt.setString(2, device_typet);
				}
			}
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


