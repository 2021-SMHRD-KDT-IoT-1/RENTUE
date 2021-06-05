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

@WebServlet("/DeleteServiceCon")
public class DeleteServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String num = request.getParameter("device_num");
		System.out.println(num);

		DeviceDAO dao = new DeviceDAO();
		int cnt = dao.delete(num);

		if (cnt > 0) {
			System.out.println("지우기 성공!");
		} else {
			System.out.println("지우기실패!");
		}
		response.sendRedirect("rent_main.jsp");

	}

}
