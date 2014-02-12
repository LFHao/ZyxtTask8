package flickrapi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.aetrion.flickr.Flickr;
import com.aetrion.flickr.FlickrException;
import com.aetrion.flickr.REST;
import com.aetrion.flickr.photos.Photo;
import com.aetrion.flickr.photos.PhotoList;
import com.aetrion.flickr.photos.PhotosInterface;
import com.aetrion.flickr.photos.SearchParameters;

import auth.*;
import databeans.*;

public class FlickrSearchTopic {	
	public static List<String> getPhotos(String searchParam) throws ParserConfigurationException, IOException, SAXException, FlickrException{
		List<String> result = new ArrayList<String>();
		REST rest=new REST();
		FlickrAuth flickrAuth = new FlickrAuth();
		Flickr flickr=new Flickr(flickrAuth.getKey(),rest);
		SearchParameters searchParams=new SearchParameters();
	    searchParams.setSort(SearchParameters.INTERESTINGNESS_DESC);
	   
	    //Create tag keyword array
	    String[] tags=new String[]{searchParam};
	    searchParams.setTags(tags);
	    Photo p  = new Photo();
	    
	    PhotosInterface photosInterface=flickr.getPhotosInterface();
	    //Execute search with entered tags
	    PhotoList photoList=photosInterface.search(searchParams,20,1);
//	    System.out.println(photoList.toString());
	    //get search result and fetch the photo object and get small square imag's url
	    if(photoList!=null){
	       //Get search result and check the size of photo result
	       for(int i=0;i<photoList.size();i++){
	    	   Photo photo=(Photo)photoList.get(i);
	    	   result.add("http://farm"+photo.getFarm()+".staticflickr.com/"+photo.getServer()+"/"+photo.getId()+"_"+photo.getSecret()+".jpg");
	    	   
	    	   
	       }
	    }
		return result;
	}
}
