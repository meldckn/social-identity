// Singleton controller for keyboard (and mouse?) input
public class Input {
	
	private static int KEY_W = 119;
	private static int KEY_A = 97;
	private static int KEY_S = 115;
	private static int KEY_D = 100;

	private static int KEY_ENTER = ENTER;
	private static int KEY_SHIFT = SHIFT;

	public HashMap keysPressed = new HashMap();

	public int keyCodes[] = { KEY_W, KEY_A, KEY_S, KEY_D };

	public Input () {

		for (int key=0; key<keyCodes.length; key++) {
			keysPressed.put (keyCodes[key], false);
		}
		//println ("keysPressed : "+keysPressed);
		//println ("keysPressed.get(KEY_W)"+keysPressed.get(KEY_W));
	}

	// Called from Processing's keyPressed()
	public void setKeyPressed (int key) {

		//println ("in setKeyPressed("+key+"): "+keysPressed.get(key));

		if ( keysPressed.containsKey (key) )
			keysPressed.put (key, true);
	}

	// Called from Processing's keyReleased()
	public void setKeyReleased (int key) {
		if ( keysPressed.containsKey (key) )
			keysPressed.put (key, false);
	}

}