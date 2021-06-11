package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MessageDAO;
import com.model.MessageDTO;

@WebServlet("/MessageServiceCon")
public class MessageServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String message = request.getParameter("message");
		
		System.out.println(email);
		System.out.println(title);
		System.out.println(message);
		
		MessageDTO dto = new MessageDTO(email, title, message);
		MessageDAO dao = new MessageDAO();
		int cnt = dao.insert(dto);
		
		if(cnt>0) {
			System.out.println("메시지 전송 성공");
		}else {
			System.out.println("메시지 전송 실패");
		}
		
	}

}
