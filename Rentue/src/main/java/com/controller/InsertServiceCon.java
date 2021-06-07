package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.CtDAO;
import com.model.CtDTO;
import com.model.DeviceDAO;
import com.model.DeviceDTO;
import com.model.RentDAO;
import com.model.RentDTO;

@WebServlet("/InsertServiceCon")
public class InsertServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("EUC-KR");

		String targetSel = request.getParameter("targetSel");
		RentDTO dto = (RentDTO) session.getAttribute("dto");
		String rent_id = dto.getRent_id();

		DeviceDAO dao = new DeviceDAO();

		if (dto != null) {

			int cnt = dao.insert(rent_id, targetSel);

			if (cnt > 0) {

				System.out.println("추가 성공!");
				response.sendRedirect("rent_main.jsp");

			} else {

				System.out.println("추가 실패 ? ");
				response.sendRedirect("intro_main.jsp");
			}

		}

	}

}
