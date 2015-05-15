/** 
 * Singleton controller for keyboard (and mouse?) input.
 *
 * Controls hashmap of currently pressed keys.
 * Functions get called from Processing's built-in key
 * listener functions.
*/
public class Input {
	
	public static int KEY_UP = 119; // W
	public static int KEY_LEFT = 97; // A
	public static int KEY_DOWN = 115; // S
	public static int KEY_RIGHT = 100; // D

	public static int KEY_ENTER = ENTER;
	public static int KEY_SHIFT = SHIFT;

	private HashMap keysPressed = new HashMap();

	private int keyCodes[] = 
		{ KEY_UP, KEY_LEFT, KEY_DOWN, KEY_RIGHT };

	public Input () {

		for (int key=0; key<keyCodes.length; key++) {
			keysPressed.put (keyCodes[key], false);
		}

	}

	public HashMap getKeysPressed () {
		return keysPressed;
	}

	// Called from Processing's keyPressed()/Released()
	public void setKeyStatus (int key, boolean status) {
		if ( keysPressed.containsKey (key) )
			keysPressed.put (key, status);
	}

	// Return a string of <key,value> pairs, where the value is
	// true/false, the keyboard key is/not currently pressed
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