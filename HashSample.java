package y;

import java.util.HashSet;

public class HashSample {

	public static void main(String[] args) {
		HashSet<String> set = new HashSet<>();
		set.add("A");
		set.add("B");
		set.add("C");
		set.add("D");
		set.add("E");
		set.add(new String("A"));
		set.remove("A");
		System.out.println(set);
	}

}

213213435436546345324
532
523
543
543
543

