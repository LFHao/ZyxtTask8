package controller;

import java.awt.image.BufferedImage;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import twitterapi.TwitterSharePic;
import databeans.AuthResult;

public class AuthAction extends Action {
	public String getName() { return "auth.do"; }

	public String perform(HttpServletRequest request) {
		ArrayList<String> errors = new ArrayList<String>();
		request.setAttribute("errors", errors);
		
		try {
			AuthResult authRes = null;
			HttpSession session = request.getSession(true);
			if (request.getParameter("share") != null) {
				authRes = TwitterSharePic.getAccessResult();
				session.setAttribute("auth", authRes);			
				return "auth.jsp";			
			}
			
			String verifier = request.getParameter("verify");
			if (verifier == null || verifier.length() != 7) {
				errors.add("Verifier is invalid.");
				return "auth.jsp";
			}
			
			String status = request.getParameter("status");

			authRes = (AuthResult) session.getAttribute("auth");
			BufferedImage img = (BufferedImage) session.getAttribute("img");

			boolean res = TwitterSharePic.postTweetWithMedia(authRes, verifier, status, img);
			if (res == true) {
				session.setAttribute("auth", null);
				session.invalidate();
				return "succeed.jsp";
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}

		errors.add("Verification failed. Please try again.");
		return "auth.jsp";
	}

}
