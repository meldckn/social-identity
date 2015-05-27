
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

	/**
	 * Takes a 4-bitstring of currently pressed WASD keys 
	 */
	public void setKeyMovement (byte movement) {

		byte horiz = (movement & 1) - ((movement & 4)>>2); 
		byte vert  = ((movement & 2)>>1) - ((movement & 8)>>3);
		
		character.setPositionRelative (speed*horiz, speed*vert);
	}

}