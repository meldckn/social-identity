/** 
 * Singleton controller for keyboard (and mouse?) input.
 *
 * Controls hashmap of currently pressed keys.
 * Functions get called from Processing's built-in key
 * listener functions.
*/
public class Input {
	
	private static int KEY_W = 119;
	private static int KEY_A = 97;
	private static int KEY_S = 115;
	private static int KEY_D = 100;

	private static int KEY_ENTER = ENTER;
	private static int KEY_SHIFT = SHIFT;

	private HashMap keysPressed = new HashMap();

	private int keyCodes[] = { KEY_W, KEY_A, KEY_S, KEY_D };

	public Input () {

		for (int key=0; key<keyCodes.length; key++) {
			keysPressed.put (keyCodes[key], false);
		}

	}

	public HashMap getKeysPressed () {
		return keysPressed;
	}

	// Called from Processing's keyPressed()
	public void setKeyPressed (int key) {
		if ( keysPressed.containsKey (key) )
			keysPressed.put (key, true);
	}

	// Called from Processing's keyReleased()
	public void setKeyReleased (int key) {
		if ( keysPressed.containsKey (key) )
			keysPressed.put (key, false);
	}

	// Return a string of <key,value> pairs
	// indicating which keyboard key is currently pressed (true)
	public String toString () {
		String str = new String();

		Iterator i = keysPressed.entrySet().iterator();

		while (i.hasNext()) {
			Map.Entry item = (Map.Entry)i.next();
			str += "<" + item.getKey() + ",";
			str += item.getValue() + "> ";
		}

		return str;
	}

}