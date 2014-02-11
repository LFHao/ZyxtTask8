package twitterapi;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;

import org.scribe.builder.ServiceBuilder;
import org.scribe.builder.api.TwitterApi;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.oauth.OAuthService;

import auth.TwitterAuth;
import databeans.Tweet;

public class TwitterSearchTopic {
	private static String getTopicSearchString(String topic) {
		final String RESOURCE_URL = "https://api.twitter.com/1.1/search/tweets.json";
		
		OAuthService service = new ServiceBuilder()
		.provider(TwitterApi.SSL.class)
		.apiKey(TwitterAuth.API_KEY)
		.apiSecret(TwitterAuth.API_SECRET)
		.build();

		Token accessToken = new Token(TwitterAuth.ACCESS_TOKEN, TwitterAuth.ACCESS_SECRET);

		// Now let's go and ask for a protected resource!
		OAuthRequest request = new OAuthRequest(Verb.GET, RESOURCE_URL);
		request.addQuerystringParameter("q", topic);
		request.addQuerystringParameter("count", "200");
		service.signRequest(accessToken, request);
		Response response = request.send();
		return response.getBody();
	}
	
	public static ArrayList<Tweet> searchTopic(String topic, int maxcount) {
		ArrayList<Tweet> ret = new ArrayList<Tweet>();
		String respStr = getTopicSearchString(topic);
		
		try (InputStream is = new ByteArrayInputStream(respStr.getBytes("UTF-8")); JsonReader rdr = Json.createReader(is)) {
			JsonArray results = rdr.readObject().getJsonArray("statuses");

			int count = 0;
			for (JsonObject result : results.getValuesAs(JsonObject.class)) {
				ret.add(new Tweet(result));
				if (++count >= maxcount)
					break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
}
