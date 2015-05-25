
public class Player {
	
	private Character character;

	public Player () {
		this.character = new Character ();
	}

	public Player (Character character) {
		this.character = character;
	}

	public Character getCharacter () {
		return this.character;
	}

	// Takes a 4-bitstream of WASD keys currently pressed
	public void setKeyMovement (byte movement) {

		println ("movement: " + binary( movement, 4 ));

		// Pressing 2 keys creates diagonal movement
		// unless they are on the same axis (e.g., W and S)
		
		//character.setPosition (x+..,y+..);
	}

}