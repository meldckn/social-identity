
public class Face {
	
	float eyeRadius = 5; // spacing between eyes
	float eyeYOffset = 5; // height above center of body
	float eyeWidth;
	float eyeHeight;

	public Face () {
		eyeWidth = (int) random (1,2);
		eyeHeight = eyeWidth + (int) random (0,3);
	}

	public void setRadius (float bodyRadius) {

		// As eyeYOffset gets larger, eyeRadius gets smaller
		this.eyeYOffset = random (0, bodyRadius/2 + bodyRadius*.01);
		this.eyeRadius = bodyRadius * random (.5, .7);
	}

	private void simpleEyes () {

		fill (255);
		// stage left
		ellipse (-eyeRadius, -eyeYOffset, eyeWidth, eyeHeight); 
		// right
		ellipse (eyeRadius, -eyeYOffset, eyeWidth, eyeHeight);
	}

	// Eyes with white part
	private void eyesWithSclera () {
		float smWidth = eyeWidth;
		float lgWidth = smWidth*1.8;

		fill (255);
		// left
		ellipse (-eyeRadius, -eyeYOffset, lgWidth, lgWidth);
		ellipse (eyeRadius, -eyeYOffset, lgWidth, lgWidth);

		fill (0);
		// left
		ellipse (-eyeRadius, -eyeYOffset, smWidth, smWidth);
		ellipse (eyeRadius, -eyeYOffset, smWidth, smWidth);
	}

	private void crosshairs () {
		
		eyeWidth = 1;
		strokeWeight (.5);
		stroke (255);

		// left
		line (-eyeRadius-eyeWidth, -eyeYOffset, 
			  -eyeRadius+eyeWidth, -eyeYOffset);
		line (-eyeRadius, -eyeYOffset-eyeWidth,
			  -eyeRadius, -eyeYOffset+eyeWidth);

		// right
		line (eyeRadius-eyeWidth, -eyeYOffset,
			  eyeRadius+eyeWidth, -eyeYOffset);
		line (eyeRadius, -eyeYOffset-eyeWidth,
			  eyeRadius, -eyeYOffset+eyeWidth);
	}

	// Caller (Body class) should have already translated 
	// the origin to the center of the body spline
	public void display (int mode) {
		//if (mode == 0) 
			simpleEyes ();
		//else if (mode == 1) eyesWithSclera ();
		//else if (mode == 2) crosshairs ();
	}

}