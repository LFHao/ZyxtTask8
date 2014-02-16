package controller;

import java.awt.image.BufferedImage;
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

			int w = 800, h = 600;
			int sw = w / 20 * 14, sh = h / 20 * 14;
			BufferedImage fg = WordsThumb.drawWordsThumb(forPaint, sw, sh, null);
			BufferedImage img = MakeCollage.make(location, fg, photos, w, h);
			int pid = Pictures.addPic(img);
			
			System.out.println("Image added. ID: " + pid);
			request.setAttribute("pid", pid);
			request.setAttribute("popular", popular);
			request.setAttribute("tweets", tweets);
			request.setAttribute("location", location);
			request.setAttribute("photos", photos);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "searchresult.jsp";
	}

}
