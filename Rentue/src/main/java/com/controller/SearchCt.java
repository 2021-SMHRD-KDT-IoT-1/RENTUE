package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.model.MapDAO;



@WebServlet("/SearchCt")
public class SearchCt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		double x = Double.parseDouble(request.getParameter("x"));
		double y = Double.parseDouble(request.getParameter("y"));
		
		System.out.println(x);
		System.out.println(y);
		
		MapDAO dao = new MapDAO();
		
		JSONObject list = dao.search(x, y);
		
//		JSONArray jsonArray = new JSONArray();
//		if(list != null) {
//			for(int i=0; i<list.size(); i++) {
//				jsonArray.add(i, list.get(i));
//			}
//		}
//		
		//System.out.println(list.toString());
	
		response.setContentType("application/json; charset=utf-8" );
	
		PrintWriter out = response.getWriter();
		out.print(list);
		
	}

}
