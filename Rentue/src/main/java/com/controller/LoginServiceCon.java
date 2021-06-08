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
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("EUC-KR");
		
		String member = request.getParameter("member");
		String id = request.getParameter("id"); 
		String pw = request.getParameter("pw");
		
		System.out.println(id);
		System.out.println(pw);
		
	
		if(id.equals("admin")&&pw.equals("123")) {
			System.out.println("관리자 로그인");
		}else if(member.equals("Rent_member")) {
			
			RentDTO dto = new RentDTO(id, pw);
			RentDAO dao = new RentDAO();
			RentDTO login_dto = dao.login(dto);
			
			if(login_dto != null) {
				//렌탈메인으로 보내기
				System.out.println("로그인 성공");
				session.setAttribute("dto", login_dto);
			}else {
				System.out.println("로그인 실패");
				try { 
					response.getWriter().write("loginFail"); 
				} catch (IOException e) { 
					e.printStackTrace(); 
				}
			}
		}else if(member.equals("Ct_member")) {
			CtDTO dto = new CtDTO(id, pw);
			CtDAO dao = new CtDAO();
			CtDTO login_dto = dao.login(dto);
			
			if(login_dto != null) {
				//관제소메인으로 보내기
				System.out.println("로그인 성공");
				session.setAttribute("dto", login_dto);
			}else {
				System.out.println("로그인 실패");
				try { 
					response.getWriter().write("loginFail"); 
				} catch (IOException e) { 
					e.printStackTrace(); 
				}
			}
		}else {
			System.out.println("실패");
			try { 
				response.getWriter().write("loginFail"); 
			} catch (IOException e) { 
				e.printStackTrace(); 
			}
		}
	
		
	}

}
