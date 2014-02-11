package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import databeans.*;
import flickrapi.*;
import twitterapi.*;

public class MapAction extends Action {

	@Override
	public String getName() {
		return "map.do";
	}

	@Override
	public String perform(HttpServletRequest request) {
		if (request.getParameter("mapbutton") == null)
			return "map.jsp";
		
		String location = request.getParameter("location");
		ArrayList<Tweet> tweets = TwitterSearchTopic.searchTopic(location, 50);
		System.out.println(tweets.size() + " tweets returned.");
		
		request.setAttribute("tweets", tweets);
		request.setAttribute("location", location);
		return "searchresult.jsp";
	}

}
