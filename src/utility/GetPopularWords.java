package utility;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;

public class GetPopularWords {
	private static final String[] defaultStopWords={
			"i","me","my","myself","we","our","ours","ourselves","you","your","yours","yourself",
			"yourselves","he","him","his","himself","she","her","hers","herself","it","its","itself",
			"they","them","their","theirs","themselves","this","that","these","those","am","is","are",
			"was","were","be","been","being","have","has","had","having","do","does","did","doing","a",
			"an","the","and","if","or","as","while","of","at","by","for","with","about","between","into",
			"through","during","above","below","to","from","in","out","on","over","then","here","there","how",
			"all","any","both","each","few","other","some","such","only","own","too","can","will","off", "would",
			"could","can","will","should","shall"
			};
	private static final int MAX_RETURN = 10;
	
	public ArrayList<String> mostPopularWords(String text, String query) {
		ArrayList<String> ret = new ArrayList<String>();
		HashSet<String> stopWords = new HashSet<String>();
		HashMap<String, Integer> freq = new HashMap<String, Integer>();
		for (String s : defaultStopWords)
			stopWords.add(s);
		StringTokenizer topicst = new StringTokenizer(query);
		while (topicst.hasMoreTokens())
			stopWords.add(topicst.nextToken().toLowerCase());			
		
		StringTokenizer st = new StringTokenizer(text);
		while (st.hasMoreTokens()) {
			String word = st.nextToken().toLowerCase();
			
			word = word.replace("(\\.|;|,|:)", "");
			
			if (!(word.startsWith("#") || word.matches("[a-z]+")))
				continue;
			if (word.startsWith("http:"))
				continue;
			if (word.startsWith("rt"))
				continue;
			if (word.length() < 4)
				continue;
				
				
			if (stopWords.contains(word))
				continue;
			
			if (freq.get(word) != null)
				freq.put(word, freq.get(word) + 1);
			else
				freq.put(word, 1);
		}
		
		Set<String> keySet = freq.keySet();
		Object[] keyArray = keySet.toArray();
		ArrayList<Mapping> map = new ArrayList<Mapping>();
		for (Object s : keyArray)
			map.add(new Mapping((String) s, freq.get((String) s)));
		Collections.sort(map, new MapComparator());
		
		for (int i = 0; i < MAX_RETURN; i++)
			if (i < map.size()) {
				ret.add(map.get(i).key);
				System.out.println(map.get(i).key + "  " + map.get(i).value);
			}
		
		return ret;
	}
	
	private class Mapping {
		String key;
		int value;
		public Mapping(String _key, int _value) { key = _key; value = _value; }
	}
	
	private class MapComparator implements Comparator<Mapping> {
		public int compare(Mapping o1, Mapping o2) {
			return o2.value - o1.value;
		}
	}
}
