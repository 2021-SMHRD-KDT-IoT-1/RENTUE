package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.model.DeviceDAO;
import com.model.DeviceDTO;

@WebServlet("/SelectServiceCon")
public class SelectServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String rent_id = request.getParameter("gg");
			String device_type = request.getParameter("gg2");
			DeviceDAO dao = new DeviceDAO();
			int num = 0;
			
			System.out.println(rent_id);
			System.out.println(device_type);
			
			JSONObject list = new JSONObject();
			ArrayList<DeviceDTO> cnt = dao.select(rent_id, device_type);
			for (DeviceDTO dto : cnt) {
				JSONObject obj = new JSONObject();
				obj.put("device_num", dto.getDevice_num());
				obj.put("rent_id", dto.getRent_id());
				obj.put("device_type", dto.getDevice_type());
				obj.put("rent_state", dto.getRent_state());
				obj.put("broken", dto.getBroken());
				list.put(num++ + "", obj);
			}
			//System.out.println(list);
			response.setContentType("application/json; charset=utf-8" );
			PrintWriter out = response.getWriter();
			out.print(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
