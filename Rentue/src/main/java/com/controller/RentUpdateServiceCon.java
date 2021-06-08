package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.CtDAO;
import com.model.CtDTO;
import com.model.RentDAO;
import com.model.RentDTO;

@WebServlet("/RentUpdateServiceCon")
public class RentUpdateServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String rent_name = request.getParameter("rent_name");
		String rent_num = request.getParameter("rent_num");
		String addr = request.getParameter("locations");
		String sel = request.getParameter("targetSel");

		System.out.println(id);
		System.out.println(pw);
		System.out.println(rent_name);
		System.out.println(rent_num);
		System.out.println(addr);
		System.out.println(sel);
		
		RentDTO dto = new RentDTO(id, pw, rent_name, rent_num, addr, sel);
		RentDAO dao = new RentDAO();
		int cnt = dao.update(dto);

		if (cnt > 0) {
			System.out.println("수정 성공");
			session.setAttribute("dto", dto);
		} else {
			System.out.println("수정 실패");
		}

	}

}
