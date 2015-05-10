// Closed, continuous Catmull-Rom spline
public class Spline {

	// Array of the form {x1,y1,x2,y2,...}
	private float[] vertices; 
	private color debugColor1 = color (255,0,0);
	private color debugColor2 = color (0,0,255);

	public Spline (int numVertices) {
		this.vertices = new float[numVertices*2];
		println("init Spline "+numVertices);
	}

	//public Spline (float[] v) {
	//	this.vertices = v;
	//}

	public void setVertex (int vertexNumber, float x, float y) {
		vertices[vertexNumber*2]   = x;
		vertices[vertexNumber*2+1] = y;
	}

	// Draw closed spline at the points in vertices array
	// (Should be aligned to the display origin (0,0), 
	// and the caller should translate)
	public void display (boolean showPoints) {

		beginShape();

		// First is control point
		curveVertex (vertices[0], vertices[1]);
		for (int i=0; i<vertices.length-1; i+=2) {
			curveVertex (vertices[i], vertices[i+1]);
		}
		// Repeat first 3 points for smooth closing curve (Processing only)
		for (int i=0; i<vertices.length-1; i+=2) {
			curveVertex (vertices[i], vertices[i+1]);
		}

		endShape(CLOSE);

		// Show vertex points (the first point in different color)
		if (showPoints) {
			noStroke ();
			fill (debugColor2);
			for (int i=0; i<vertices.length-1; i+=2) {
				if (i>1) fill (debugColor1);
				ellipse (vertices[i], vertices[i+1], 3, 3);
			}
		}

	}


}