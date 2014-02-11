package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.aetrion.flickr.FlickrException;
import com.aetrion.*;

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
		try {
			System.out.println("WTF");
			List<String> photos = FlickrSearchTopic.getPhotos(location);
			for (String url : photos) {
				System.out.println(url);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(tweets.size() + " tweets returned.");
		
		request.setAttribute("tweets", tweets);
		request.setAttribute("location", location);
		return "searchresult.jsp";
	}

}
