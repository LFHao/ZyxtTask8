package databeans;

import java.awt.image.BufferedImage;
import java.util.ArrayList;


public class Pictures {
	private static ArrayList<BufferedImage> images = new ArrayList<BufferedImage>();
	
	public static int getSize() { return images.size(); }
	
	public static BufferedImage getPic(int index) {
		if (index >= images.size() || index < 0)
			return null;
		return images.get(index);
	}
	
	public static int addPic(BufferedImage img) {
		images.add(img);
		return images.size() - 1;
	}
}
