package databeans;

import java.util.Date;

import javax.json.JsonObject;

public class Tweet {
	String content;
	Date time;
	String name;
	String place;
	
	public void setContent(String s) { content = s; }
	public void setTime(Date d) { time = d; }
	public void setName(String s) { name = s; }
	public void setPlace(String s) { place = s; }
	
	public String getContent() { return content; }
	public Date getTime() { return time; }
	public String getName() { return name; }
	public String getPlace() { return place; }
		
	@SuppressWarnings("deprecation")
	public Tweet(JsonObject ob) {
		name = ob.getJsonObject("user").getString("screen_name");
		time = new Date(ob.getString("created_at")); 
		content = ob.getString("text");
		if (!ob.isNull("place"))
			place = ob.getJsonObject("place").getString("name");
		else
			place = "";
	}
	
	public void printTweet() {
		System.out.println(name + " posted an tweet in " + time + " at " + place);
		System.out.println("\t" + content);
		System.out.println();
	}
}
