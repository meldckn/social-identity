
int numVertices = 8;
float[] vertices = new float[numVertices*2];
float radius = 15; 

Spline spline;
Body b1, b2;
Input input = new Input();

void setup() {
	
	jProcessingJS (this, {fullscreen:true, mouseoverlay:true});
	smooth();
	
	// Populate vertices for body
	for (int i=0; i<vertices.length; i+=2) {
		float theta = (float)(i/2) * 360/numVertices ;//+ random (10, 20);
	    float radiusScalar = radius * random (.9, 1.1);
	    vertices[i] = cos (radians(theta)) * radiusScalar; // x
	    vertices[i+1] = sin (radians(theta)) * radiusScalar; // y
	}

	spline = new Spline (vertices);
	
	b1 = new Body ();
	b1.setRadius (10);
	b1.resetSpline ();

	b2 = new Body ();
}

void draw() {
	background (210);

	boolean debug = keyPressed;

	println ("pressed: " + input);

	// Forward movement bitstream (4 bits)
	// player.setKeyMovement (input.getMovement());
	 
	println ("movement: " + binary( input.getMovement(), 4 ));

	// player.display(); // includes movement
	// community.display(); 

	pushMatrix ();
	translate (width/2, height/2);
	fill (0);
	spline.display (debug);
	popMatrix ();

	pushMatrix ();
	translate (width/3,height/4);
	fill(0);
	b1.display (debug);
	popMatrix ();

	pushMatrix ();
	translate (350, 300);
	fill (0);
	b2.display (debug);
	popMatrix ();
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
