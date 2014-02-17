package controller;

import java.awt.image.BufferedImage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import twitterapi.TwitterSharePic;
import databeans.AuthResult;

public class AuthAction extends Action {
	public String getName() { return "auth.do"; }

	public String perform(HttpServletRequest request) {
		try {
			AuthResult authRes = null;
			HttpSession session = request.getSession(true);
			if (request.getParameter("share") != null) {
				authRes = TwitterSharePic.getAccessResult();
				session.setAttribute("auth", authRes);			
				return "auth.jsp";			
			}

			if (request.getParameter("verify") == null)
				return "auth.jsp";

			authRes = (AuthResult) session.getAttribute("auth");
			String verifier = request.getParameter("verify");
			BufferedImage img = (BufferedImage) session.getAttribute("img");

			TwitterSharePic.postTweetWithMedia(authRes, verifier, "Hello world!", img);
			System.out.println("Verifier: " + verifier + ". Update succeed!");

			session.setAttribute("auth", null);
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "index.jsp";
	}

}
