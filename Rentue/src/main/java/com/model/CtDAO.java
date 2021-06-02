package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CtDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	ArrayList<CtDTO> list = null;
	CtDTO dto = null;

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

	// 회원가입
	// api와 연동하여 주소 입력하면 자동으로 좌표 뽑는 로직 필요함
	public int join(CtDTO dto) {
		conn();

		try {

			String sql = "insert into ct_member values(?,?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCt_id());
			psmt.setString(2, dto.getCt_pw());
			psmt.setString(3, dto.getCt_name());
			psmt.setString(4, dto.getCt_addr());
			psmt.setDouble(5, dto.getLon());
			psmt.setDouble(6, dto.getLat());
		
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	// 로그인

	public CtDTO login(CtDTO dto) {
		CtDTO login_dto = null;
		conn();

		try {
			String sql = "select * from ct_member where ct_id = ? and ct_pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCt_id());
			psmt.setString(2, dto.getCt_pw());
			rs = psmt.executeQuery();

			if (rs.next()) {
				String ct_id = rs.getString(1);
				String ct_pw = rs.getString(2);
				String ct_name = rs.getString(3);
				String ct_addr = rs.getString(4);
				double lon = rs.getDouble(5);
				double lat = rs.getDouble(6);

				login_dto = new CtDTO(ct_id, ct_pw, ct_name, ct_addr, lon, lat);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return login_dto;

	}

	// Update
	// 좌표 입력 로직 추가 필요
	public int update(CtDTO dto) {
		conn();
		String sql = "update ct_member set ct_pw =? ,ct_addr=?  where ct_id=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCt_pw());
			psmt.setString(2, dto.getCt_addr());
			psmt.setString(3, dto.getCt_id());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return cnt;

	}

	public ArrayList<CtDTO> select() {
		list = new ArrayList<CtDTO>();
		conn();

		try {
			String sql = "select * from ct_member";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {

				
				String ct_id = rs.getString(1);
				String ct_pw = rs.getString(2);				
				String ct_name = rs.getString(3);				
				String ct_addr = rs.getString(4);
				double lon = rs.getDouble(5);
				double lat = rs.getDouble(6);

				dto = new CtDTO(ct_id, ct_pw, ct_name, ct_addr, lon, lat);
				list.add(dto);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close();

		}

		return list;

	}

	public CtDTO selectOne(CtDTO dto) {
		conn();
		String sql = "select * from ct_member where id = ? ";

		try {

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getCt_id());

			rs = psmt.executeQuery();

			if (rs.next()) {
			
				String ct_id = rs.getString(1);
				String ct_pw = rs.getString(2);				
				String ct_name = rs.getString(3);				
				String ct_addr = rs.getString(4);
				double lon = rs.getDouble(5);
				double lat = rs.getDouble(6);

				dto = new CtDTO(ct_id, ct_pw, ct_name, ct_addr, lon, lat);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close();

		}
		return dto;

	}

}


