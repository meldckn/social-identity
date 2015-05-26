/**
 * Inspired by Manfred Mohr's P-61, "geometric hints" (1970),
 * and Bild series (1960-61)
 */
public class Landscape {

	private float width;
	private float height;
	private float padding; // padding around main rect.
	private color background_color;

	static private color OLIVINE = color (151, 191, 125);
	static private color OLIVINE_LIGHT = color (167, 207, 141);
	static private color CELADON = color (172, 225, 175);
	static private color SPROUT_WARM = color (168, 207, 157);
	static private color GREEN_YELLOW = color (195, 255, 82);

	private color grassColor = GREEN_YELLOW;
	private int numGrassPatches = 1;
	private float[][][] grassPatches = new float[numGrassPatches][][];
	private float[] grassXOrigins = new float[numGrassPatches];
	private float[] grassYOrigins = new float[numGrassPatches];

	public Landscape (float width, float height) {
		this.width = width;
		this.height = height;
		this.padding = 40;

		this.background_color = OLIVINE;

		// Initialize each grass patch
		for (int patch=0; patch<numGrassPatches; patch++) {
			grassPatches[patch] = initGrass ();
			grassXOrigins[patch] = 80;//width/3;//random (100, width-100);
			grassYOrigins[patch] = 100;//height/3;//random (100, height-100);
		}
	}

	/**
	 * Return matrix of x,y positions of blades of grass
	 */
	public float[][] initGrass () {

		// Assign a number of x and y positions
		int numRows = 50;//random (5,20);
		int numCols;
		float yCounter;
		float ySpacing = 10; // regular spacing between columns

		// Jagged array
		float[][] patch = new float[numRows][];

		for (int x=0; x<numRows; x++) {

			// Each row has a different number of columns
			numCols = random (20,50);
			patch[x] = new float[numCols];

			// Assign starting point for the column
			yCounter = random (100, 500);
				// + ySpacing/2; // only on every other x value

			for (int y=0; y<numCols; y++) {
				patch[x][y] = yCounter;
				yCounter += ySpacing;
			}

		}

		return patch;
	}

	/**
	 * Display blades of grass at 
	 */
	public void displayGrass (float[][] positions, float height,
							  float xOrigin, float yOrigin) {

		noFill ();
		strokeWeight (.5);
		stroke (grassColor);
		float xVal, yVal;
		float xSpacing = 10;

		pushMatrix ();
		translate (xOrigin, yOrigin);

		for (int x=0; x<positions.length; x++) {
			xVal = x + xSpacing*x;

			for (int y=0; y<positions[x].length; y++) {
				yVal = positions[x][y];
				line (yVal, xVal, yVal, xVal - height);
			}
		}

		popMatrix();

	}

	public void display (float width, float height) {
		this.width = width;
		this.height = height;

		fill (background_color);
		noStroke ();
		rect (padding, padding, width - 2*padding, height - 2*padding);

		for (int patch=0; patch < grassPatches.length; patch++) {
			displayGrass (grassPatches[patch], 4,
						  grassXOrigins[patch], grassYOrigins[patch]);
		}
	}
}