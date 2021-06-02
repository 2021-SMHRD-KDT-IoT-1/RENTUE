package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.CtDAO;
import com.model.CtDTO;
import com.model.RentDAO;
import com.model.RentDTO;

@WebServlet("/JoinServiceCon")
public class JoinServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("UTF-8");
		String member = request.getParameter("member");
		String id = request.getParameter("id"); 
		String pw = request.getParameter("pw"); 
		String rent_name = request.getParameter("rent_name"); 
		String rent_num = request.getParameter("rent_num"); 
		String addr = request.getParameter("locations");
		String sel = request.getParameter("targetSel");
		double x = Double.parseDouble(request.getParameter("x"));
		double y = Double.parseDouble(request.getParameter("y"));
		
		System.out.println(member);
		System.out.println(id);
		System.out.println(pw);
		System.out.println(rent_name);
		System.out.println(rent_num);
		System.out.println(addr);
		System.out.println(sel);
		System.out.println(x);
		System.out.println(y);
		
		int cnt = 0;
		if(member.equals("Rent_member")) {
			RentDTO dto = new RentDTO(id, pw, rent_name, rent_num, addr, sel);
			RentDAO dao = new RentDAO();
			cnt = dao.join(dto);
		}else if(member.equals("Ct_member")) {
			CtDTO dto = new CtDTO(id, pw, rent_name, addr, x, y);
			CtDAO dao = new CtDAO();
			cnt = dao.join(dto);
		}
		
		
		if(cnt>0) {
			System.out.println("회원가입 성공");
			response.sendRedirect("intro.jsp");
		}else {
			System.out.println("회원가입 실패");
			response.sendRedirect("join.jsp");
		}
	}

}
