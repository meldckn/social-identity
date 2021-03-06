/**
 * Main body shape for a single character in the community.
 * 
 * Circular, closed spline, with slight randomness in radii
 * at different angles around the circumference.
 * 
 * Only controls points that make up the shape, not the 
 * position of the shape on the canvas.
 */
public class Body {

	private Spline spline;
	private int numVertices = 8;
	private float radius = 15;
	private color bodyColor = color(random(0,80)); 
	private float opacity;

	public Body () {
		this (numVertices); 
	}

	public Body (int numVertices) {
		this.numVertices = numVertices;
		this.spline = new Spline (numVertices);
		resetSpline ();
	}

	public float getRadius () { return this.radius; }

	// Whenever caller sets a new radius,
	// should probably also resetSpline() to see effect
	public void setRadius (float r) { radius = r; }
	public void setColor  (color c) { bodyColor = c; }
	public void setOpacity (float o) { opacity = o; }


	// Set spline vertices at radius given by this.radius
	public void resetSpline () {

		// Populate vertices of Spline shape
  		for (int i=0; i<numVertices; i++) {
    		float theta = radians ( (float)i * 360/numVertices) ;
    			//+ random (10, 20);
    		float radiusScalar = radius * random (1, 1.2);
    		spline.setVertex (i, cos (theta) * radiusScalar,  // x
    							 sin (theta) * radiusScalar); // y
  		}
	}

	// Vertices drawn around origin 
	// (The caller should translate)
	public void display (boolean showPoints) {

		noStroke ();
		fill (bodyColor);
		spline.display (showPoints);

	}
}