package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import java.awt.image.BufferedImage;

import databeans.Pictures;

public class ImageAction extends Action {
	public String getName() {
		return "image.do";
	}

	public String perform(HttpServletRequest request) {
		String id = request.getParameter("id");
		ArrayList<String> errors = new ArrayList<String>();
		
		if (id == null || Integer.valueOf(id) < 0 || Integer.valueOf(id) >= Pictures.getSize()) {
			errors.add("Invalid image id.");
			return "searchresult.jsp";
		}
		
		BufferedImage img = Pictures.getPic(Integer.valueOf(id));
		request.setAttribute("img", img);
		return "image";
	}
}
