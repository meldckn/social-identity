
public class Player {
	
	private Character character;
	private float speed = 3;

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
		byte horiz = (movement & 1) - ((movement & 4)>>2); 
		byte vert  = ((movement & 2)>>1) - ((movement & 8)>>3);
		
		character.setPositionRelative (speed*horiz, speed*vert);
	}

}