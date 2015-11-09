import java.util.ArrayList;
import java.util.Stack;

public class Hanoi {

	static Stack<Integer> s1 = new Stack<Integer>();
	static Stack<Integer> s2 = new Stack<Integer>();
	static Stack<Integer> s3 = new Stack<Integer>();
	static ArrayList<Float> times = new ArrayList<Float>();

	static int count = 0;

	public static void hanoi(Stack<Integer> source, Stack<Integer> dest, Stack<Integer> swap, int depth) {
		if (depth == 1) {
			dest.push(source.pop());
			count++;
			// System.out.println("----- After " + count + " moves");
			// System.out.println("s1: " + s1.toString());
			// System.out.println("s2: " + s2.toString());
			// System.out.println("s3: " + s3.toString());
			return;
		}
		// spostare la torre depth-1 strati preesistente in swap
		hanoi(source, swap, dest, depth - 1);

		// fare la seguente mossa
		dest.push(source.pop());
		count++;

		// System.out.println("----- After " + count + " moves");
		// System.out.println("s1: " + s1.toString());
		// System.out.println("s2: " + s2.toString());
		// System.out.println("s3: " + s3.toString());

		// ricreare la torre di depth-1 strati sopra la destinazione
		hanoi(swap, dest, source, depth - 1);
	}

	private static void doGame(int decks, boolean quiet) {
		s1.clear();
		s2.clear();
		s3.clear();
		count = 0;
		for (int i = 0; i < decks; i++) {
			s1.push(i);
		}
		if (!quiet) {
			System.out.println("Decks: " + decks);
			System.out.println("s1: " + s1.toString());
			System.out.println("s2: " + s2.toString());
			System.out.println("s3: " + s3.toString());
		}
		long start = System.currentTimeMillis();
		hanoi(s1, s3, s2, s1.size());
		long finish = System.currentTimeMillis();

		long totalMoves = (long) Math.pow(2, decks) - 1;
		float time = (float) (finish - start) / 1000;
		times.add(time);
		System.out.println("decks:\t" + decks + "\ttime:\t" + time);
		if (!quiet) {
			System.out.println("----- After " + count + " moves");
			System.out.println("s1: " + s1.toString());
			System.out.println("s2: " + s2.toString());
			System.out.println("s3: " + s3.toString());
			System.out.println("Time elapsed for " + totalMoves + " moves: " +
					time + "secs");
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int decks = Integer.parseInt(args[0]);
		doGame(decks, true);
		System.out.println("Decks: " + decks + " time: " + times.get(0));
		
	}

}
