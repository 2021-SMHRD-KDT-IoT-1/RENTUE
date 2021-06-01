package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RentDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	ArrayList<RentDTO> list = null;
	RentDTO dto = null;

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
	public int join(RentDTO dto) {
		conn();

		try {

			String sql = "insert into rent_member values(?,null,?,?,?,?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getRent_id());
			psmt.setString(2, dto.getRent_pw());
			psmt.setString(3, dto.getRent_name());
			psmt.setString(4, dto.getRent_num());
			psmt.setString(5, dto.getRent_addr());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	// 로그인

	public RentDTO login(RentDTO dto) {
		RentDTO login_dto = null;
		conn();

		try {
			String sql = "select * from rent_member where Rent_id = ? and Rent_pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getRent_id());
			psmt.setString(2, dto.getRent_pw());
			rs = psmt.executeQuery();

			if (rs.next()) {
				String rent_id = rs.getString(1);
				String rent_pw = rs.getString(2);
				String rent_name = rs.getString(3);
				String rent_num = rs.getString(4);
				String rent_addr = rs.getString(5);

				login_dto = new RentDTO(rent_id, rent_pw, rent_name, rent_num, rent_addr);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return login_dto;

	}

	// Update
	public int update(RentDTO dto) {
		conn();
		String sql = "update rent_member set rent_pw =? ,rent_name=?, rent_num=?, rent_addr=? where rent_id=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getRent_pw());
			psmt.setString(2, dto.getRent_name());
			psmt.setString(3, dto.getRent_num());
			psmt.setString(4, dto.getRent_addr());
			psmt.setString(5, dto.getRent_id());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return cnt;

	}

	public ArrayList<RentDTO> select() {
		list = new ArrayList<RentDTO>();
		conn();

		try {
			String sql = "select * from rent_member";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String rent_id = rs.getString(1);
				String ct_id = rs.getString(2);
				String rent_pw = rs.getString(3);
				String rent_name = rs.getString(4);
				String rent_num = rs.getString(5);
				String rent_addr = rs.getString(6);

				dto = new RentDTO(rent_id, ct_id, rent_pw, rent_name, rent_num, rent_addr);
				list.add(dto);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close();

		}

		return list;

	}

	public RentDTO selectOne(RentDTO dto) {
		conn();
		String sql = "select * from rent_member where rent_id = ? ";

		try {

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getRent_id());

			rs = psmt.executeQuery();

			if (rs.next()) {
				String rent_id = rs.getString(1);
				String ct_id = rs.getString(2);
				String rent_pw = rs.getString(3);
				String rent_name = rs.getString(4);
				String rent_num = rs.getString(5);
				String rent_addr = rs.getString(6);

				dto = new RentDTO(rent_id, ct_id, rent_pw, rent_name, rent_num, rent_addr);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close();

		}
		return dto;

	}

}
