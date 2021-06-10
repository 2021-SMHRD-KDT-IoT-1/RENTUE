package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.DeviceDAO;

@WebServlet("/InsertDeviceServiceCon")
public class InsertDeviceServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");

		String rent_id = request.getParameter("rent_id");
		String targetSel = request.getParameter("targetSel");

		DeviceDAO dao = new DeviceDAO();

		int cnt = dao.insert(rent_id, targetSel);

		if (cnt > 0) {

			System.out.println("추가 성공!");

		} else {

			System.out.println("추가 실패 ? ");
		}

	}

}
