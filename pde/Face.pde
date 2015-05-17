
public class Face {
	
	Spline spline;
	int numVertices = 8;
	float x = 0;
	float y = 0; // center point
	float radius;
	float eyeRadius; 

	float w = 12;
	float wSquareness = .7; // bet .1 and .9 (larger => more square)

	float h = 8;
	float hFlatness = 5/8; // how 
	float h1 = 5;
	float h2 = 3;
	
	public Face (float r) {

		radius = r;
		float[] arr = new float[numVertices];

		// x values
  		arr[0]  = arr[8]  = x; 
		arr[2]  = arr[6]  = x - w*wSquareness; // 2,6 and 14,10 might be different
		arr[14] = arr[10] = x + w*wSquareness;
		arr[4]  = x - w;
		arr[12] = x + w;

		// y values
		arr[1] = arr[3] = arr[15] = y - h1;
		arr[7] = arr[9] = arr[11] = y + h2;
		arr[5] = arr[13] = y;

		spline = new Spline (arr, true);
	}

	public void display (float x, float y) {
		pushMatrix ();
		translate (x, y);
		spline.display ();
		popMatrix ();
	}

}