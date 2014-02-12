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
		List<String> photos = new ArrayList<String>();
		try {
			photos.addAll(FlickrSearchTopic.getPhotos(location));
		} catch (Exception e) {
			e.printStackTrace();
		}
		ArrayList<Tweet> tweets = TwitterSearchTopic.searchTopic(location, 15);
		ArrayList<String> popular = TwitterGetHotWords.getPopularWords(location);
		
		request.setAttribute("popular", popular);
		request.setAttribute("tweets", tweets);
		request.setAttribute("location", location);
		request.setAttribute("photos", photos);
		return "searchresult.jsp";
	}

}
