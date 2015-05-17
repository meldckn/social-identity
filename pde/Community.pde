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
		int padding = 100;

		println ("width and height in Community: "+width+","+height);

		// Randomize initial character parameters
		for (int c=0; c<populationSize; c++) {
			Character character = new Character ();
			character.setPosition (random (padding, width-padding), 
								   random (padding, height-padding));
			character.setRadius (random (10,15));
			characters.put (c, character);
		}
	}

	public void display () {
		Iterator i = characters.entrySet().iterator();

		while (i.hasNext()) {
			Map.Entry characterKey = (Map.Entry)i.next();
			characterKey.getValue().display();
		}

	}

}