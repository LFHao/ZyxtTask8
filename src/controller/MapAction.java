package controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.aetrion.flickr.FlickrException;
import com.aetrion.*;

import databeans.*;
import flickrapi.*;
import twitterapi.*;
import utility.MakeCollage;
import utility.WordsThumb;

public class MapAction extends Action {

	@Override
	public String getName() {
		return "map.do";
	}

	@Override
	public String perform(HttpServletRequest request) {
		String location = null;
		String val = request.getParameter("search");
		System.out.println(val);			
		
		if (request.getParameter("mapbutton") == null && request.getParameter("search")==null)
			return "map.jsp";
		if (val != null)
			location = val;
		else
			location = request.getParameter("location");
		List<String> photos = new ArrayList<String>();
		try {
			photos.addAll(FlickrSearchTopic.getPhotos(location));
			ArrayList<Tweet> tweets = TwitterSearchTopic.searchTopic(location, 15);
			ArrayList<Mapping> forPaint = TwitterGetHotWords.getPopularWords(location);
			ArrayList<Mapping> popular = new ArrayList<Mapping>();
			for (int i = 0; i < 10; i++) {
				if (i < forPaint.size())
					popular.add(forPaint.get(i));
			}
			
			HttpSession session = request.getSession(true);
			session.setAttribute("forPaint", forPaint);
			session.setAttribute("popular", popular);
			session.setAttribute("tweets", tweets);
			session.setAttribute("location", location);
			session.setAttribute("photos", photos);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "searchresult.jsp";
	}

}
