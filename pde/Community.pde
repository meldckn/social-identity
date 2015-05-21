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
		Iterator i = characters.entrySet().iterator();

		// First draw shadows, outlines, etc,
		// so they appear below characters

		// Sort characters by increasing y-position
		// Bottom of a character = y+radius

		while (i.hasNext()) {
			Map.Entry characterKey = (Map.Entry)i.next();
			characterKey.getValue().display();
		}

	}

}