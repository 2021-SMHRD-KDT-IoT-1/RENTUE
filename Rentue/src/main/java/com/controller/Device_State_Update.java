package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.DeviceDAO;
import com.model.DeviceDTO;

@WebServlet("/Device_State_Update")
public class Device_State_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");

		HttpSession session = request.getSession();

		String num = request.getParameter("device_num");
		System.out.println(num);

		DeviceDAO dao = new DeviceDAO();
		int cnt = dao.state_update(num);

		if (cnt > 0) {
			System.out.println("수정 성공!");
			response.sendRedirect("rent_main.jsp");
		} else {
			System.out.println("수정 실패!");
			response.sendRedirect("rent_main.jsp");
		}

	}

}
