
public class Body {

	private Spline spline;
	private float radius = 30;
	private color bodyColor = color(0); 
	private float opacity;

	public Body () {
		this (8); 
	}

	public Body (int numVertices) {

		this.spline = new Spline (numVertices);
		println("initializing Body "+numVertices);

		// Populate vertices of Spline shape
  		for (int i=0; i<numVertices; i++) {
    		float theta = radians ( (float)i * 360/numVertices) ;//+ random (10, 20);
    		float radiusScalar = radius * random (.9, 1.1);
    		spline.setVertex (i, cos (theta) * radiusScalar,  // x
    							 sin (theta) * radiusScalar); // y
  		}
	}

	public void setRadius (float r) { radius = r; }
	public void setColor  (color c) { bodyColor = c; }
	public void setOpacity (float o) { opacity = o; }

	// Vertices drawn around origin 
	// (The caller should translate)
	public void display (boolean showPoints) {

		noStroke ();
		fill (bodyColor);
		spline.display (showPoints);

	}
}