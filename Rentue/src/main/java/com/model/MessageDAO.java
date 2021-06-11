package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MessageDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
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
	
	public int insert(MessageDTO dto) {

		conn();


		String sql = "insert into contact values(message_num.nextval, ?, ?, ?)";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getRent_id());
			psmt.setString(2, dto.getMsg_title());
			psmt.setString(3, dto.getMsg_text());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;

	}
	
	public ArrayList<MessageDTO> select() {
		ArrayList<MessageDTO> list = new ArrayList<MessageDTO>();
		conn();

		try {
			String sql = "select * from contact order by msg_num desc";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();

			while (rs.next()) {

				int msg_num = rs.getInt(1);
				String rent_id = rs.getString(2);
				String msg_title = rs.getString(3);
				String msg_text = rs.getString(4);

				MessageDTO dto = new MessageDTO(msg_num, rent_id, msg_title, msg_text);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;

	}
	
}
