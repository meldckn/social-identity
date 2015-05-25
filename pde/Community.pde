/**
 * Manager class for population of NP Characters.
 * 
 * Controls number, size, movement, global properties of NPCs,
 * and order of displaying each one relative to the others.
 */
public class Community {

	private int populationSize = 10; // includes player character
	private HashMap characters = new HashMap ();
	private int[] charsSortedByDepth;
	private Player playerCharacter;

	public Community (int populationSize) {

		this.populationSize = populationSize;
		this.charsSortedByDepth = new int[populationSize];

		int padding = 200;

		println ("width and height in Community: "+width+","+height);

		// Randomize initial character parameters
		for (int c=0; c<populationSize; c++) {
			Character character = new Character ();
			character.setPosition (random (padding, width-padding), 
								   random (padding, height-padding));
			character.setRadius (random (7,15));
			characters.put (c, character);
			charsSortedByDepth[c] = c;
		}


		this.playerCharacter = new Player (characters.get (0));
	}

	public Player getPlayerCharacter () {
		return this.playerCharacter;
	}

	public void display () {

		// First draw shadows, outlines, etc,
		// so they appear below characters

		// Sort characters by increasing y-position
		
		// TODO: only re-sort keys when movement happens?
		// (probably not every frame)

		sortByDepth (characters, charsSortedByDepth);
		
		// Draw each character in characters HashMap
		for (int i=0; i<charsSortedByDepth.length; i++) {
			int key = charsSortedByDepth [i];
			characters.get(key).display();
		}

	}

	/** 
	 * Return array of Hashmap keys sorted by increasing y-position.
	 * Use insertion sort (small set, stable, usually mostly sorted).
	 * TODO: add comparison function parameter?
	 * TODO: use different sort initially, when mostly unsorted?
	 */
	public int[] sortByDepth (HashMap map, int[] array) {

		int j = 0; 
		int temp = 0; 

		// For each index in array, going forwards
		for (int i=1; i<array.length; i++) {
			j = i;

			// For each index before i, (that's larger than i),
			// going backwards
			while ( j>0 && hasGreaterDepth (array[j-1],array[j]) ) {
				temp = array[j];
				array[j] = array[j-1];
				array[j-1] = temp;
				j--;
			}
		}
		return array;
	}

	/**
	 * Returns true if depth of character at key1 > depth of char at key2
	 */
	private boolean hasGreaterDepth (int key1, int key2) {
		return characters.get(key1).getStandingDepth() > 
			   characters.get(key2).getStandingDepth();
	}

}