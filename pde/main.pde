
Input input = new Input ();
Community community;

void setup() {
	
	jProcessingJS (this, {fullscreen:true, mouseoverlay:true});
	smooth();

	community = new Community (50);
}

void draw() {
	background (195,207,82);

	// Forward movement bitstream (4 bits)
	// player.setKeyMovement (input.getMovement());

	println ("movement: " + binary( input.getMovement(), 4 ));

	// player.display(); // includes movement
	community.display(); 

}

// Called every time a key is pressed
void keyPressed () {
	// Set appropriate index to true
	input.setKeyStatus ((int) key, true);
}

// Called every time a key is released
void keyReleased () {
	// Set appropriate index to false
	input.setKeyStatus ((int) key, false);
}
