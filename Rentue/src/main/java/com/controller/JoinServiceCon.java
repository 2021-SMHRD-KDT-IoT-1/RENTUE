package com.controller;

import java.io.IOException;
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
		
		request.setCharacterEncoding("EUC-KR");
		String member = request.getParameter("member");
		String id = request.getParameter("id"); 
		String pw = request.getParameter("pw"); 
		String rent_name = request.getParameter("rent_name"); 
		String rent_num = request.getParameter("rent_num"); 
		String addr = request.getParameter("addr"); 
		
		int cnt = 0;
		if(member.equals("Rent_member")) {
			RentDTO dto = new RentDTO(id, pw, rent_name, rent_num, addr);
			RentDAO dao = new RentDAO();
			cnt = dao.join(dto);
		}else if(member.equals("Ct_member")) {
			CtDTO dto = new CtDTO(id, pw, addr);
			CtDAO dao = new CtDAO();
			cnt = dao.join(dto);
		}
		
		if(cnt>0) {
			System.out.println("회원가입 성공");
			response.sendRedirect("login.html");
		}else {
			System.out.println("회원가입 실패");
			response.sendRedirect("join.jsp");
		}
	}

}
