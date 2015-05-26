
Input input = new Input ();
Community community;
Landscape landscape;

void setup() {
	
	jProcessingJS (this, {fullscreen:true, mouseoverlay:true});
	smooth();

	landscape = new Landscape (width, height);
	community = new Community (30);
}

void draw() {
	background (255);
	//(151,191,125);//(167,207,141);//(172,225,175);//(195,207,82);

	landscape.display (width, height);
	community.getPlayerCharacter().setKeyMovement(input.getMovement());
	community.display (); 

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
