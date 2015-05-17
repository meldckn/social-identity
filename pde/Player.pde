
public class Player {
	
	private Character character;

	public Player () {
		this.character = new Character ();
	}

	// Takes a 4-bitstream of WASD keys currently pressed
	public void setKeyMovement (byte movement) {

		// Pressing 2 keys creates diagonal movement
		// unless they are on the same axis (e.g., W and S)
		
		//character.setPosition (x+..,y+..);
	}

}