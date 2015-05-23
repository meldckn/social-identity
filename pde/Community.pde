/**
 * Manager class for population of NP Characters.
 * 
 * Controls number, size, movement, global properties of NPCs,
 * and order of displaying each one relative to the others.
 */
public class Community {

	private int populationSize = 10;
	private HashMap characters = new HashMap ();

	public Community (int populationSize) {
		this.populationSize = populationSize;
		int padding = 200;

		println ("width and height in Community: "+width+","+height);

		// Randomize initial character parameters
		for (int c=0; c<populationSize; c++) {
			Character character = new Character ();
			character.setPosition (random (padding, width-padding), 
								   random (padding, height-padding));
			character.setRadius (random (7,15));
			characters.put (c, character);
		}
	}

	public void display () {

		// First draw shadows, outlines, etc,
		// so they appear below characters

		// Sort characters by increasing y-position
		
		// TODO: only re-sort keys when movement happens?
		// (probably not every frame)

		int[] sortedIndices = sortByDepth (characters);
		
		// Draw each character in characters HashMap
		for (int key=0; key<sortedIndices.length; key++) {
			characters.getValue(key).display();
		}

	}

	/** 
	 * Return array of Hashmap keys sorted by 
	 * increasing y-position (using Character
	 * y and radius properties)
	 * TODO: add sorting function parameter 
	 */
	public int[] sortByDepth (HashMap map) {

		int[] sortedIndices = new int[map.size()];

		Iterator i = map.entrySet().iterator();
		
		while (i.hasNext()) {
			// For each element: 

			Map.Entry key = (Map.Entry)i.next();
			
			// insertion sort(?) of each key by
			// key.getValue().getStandingDepth();
		}

		return sortedIndices;
	}

}