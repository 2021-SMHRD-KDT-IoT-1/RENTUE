package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.model.DeviceDAO;

@WebServlet("/SelectDeviceState")
public class SelectDeviceState extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String device_id = request.getParameter("device_id");
			DeviceDAO dao = new DeviceDAO();
			JSONObject list = new JSONObject();
			String state = dao.selectDeviceState(device_id);
			list.put("state", state);
			response.setContentType("application/json; charset=utf-8" );
			PrintWriter out = response.getWriter();
			out.print(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
