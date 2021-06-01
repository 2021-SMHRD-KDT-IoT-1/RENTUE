package com.controller;

import java.io.IOException;
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

@WebServlet("/LoginServiceCon")
public class LoginServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		String member = request.getParameter("member");
		String id = request.getParameter("id"); 
		String pw = request.getParameter("pw");
		
		HttpSession session = request.getSession();
		
		if(member.equals("Rent_member")) {
			RentDTO dto = new RentDTO(id, pw);
			RentDAO dao = new RentDAO();
			RentDTO login_dto = dao.login(dto);
			
			if(login_dto != null) {
				System.out.println("로그인 성공");
				//렌탈메인으로 보내기
				session.setAttribute("login_dto", login_dto);
			}
		}else if(member.equals("Ct_member")) {
			CtDTO dto = new CtDTO(id, pw);
			CtDAO dao = new CtDAO();
			CtDTO login_dto = dao.login(dto);
			
			if(login_dto != null) {
				System.out.println("로그인 성공");
				//관제소메인으로 보내기
				session.setAttribute("login_dto", login_dto);
			}
		}
		
	}

}
