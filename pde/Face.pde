
public class Face {
	
	float eyeRadius = 5; // spacing between eyes
	float eyeHeight = 5; // height above center of body
	float eyeWidth = 2;

	public Face () {

	}

	public void setRadius (float bodyRadius) {

		// As eyeHeight gets larger, eyeRadius gets smaller
		this.eyeHeight = random (0, bodyRadius/2 + bodyRadius*.01);
		this.eyeRadius = bodyRadius * random (.5, .7);
	}

	private void simpleEyes () {

		fill (255);
		// stage left
		ellipse (-eyeRadius, -eyeHeight, eyeWidth, eyeWidth); 
		// right
		ellipse (eyeRadius, -eyeHeight, eyeWidth, eyeWidth);
	}

	// Eyes with white part
	private void eyesWithSclera () {
		float smWidth = eyeWidth;
		float lgWidth = smWidth*1.8;

		fill (255);
		// left
		ellipse (-eyeRadius, -eyeHeight, lgWidth, lgWidth);
		ellipse (eyeRadius, -eyeHeight, lgWidth, lgWidth);

		fill (0);
		// left
		ellipse (-eyeRadius, -eyeHeight, smWidth, smWidth);
		ellipse (eyeRadius, -eyeHeight, smWidth, smWidth);
	}

	private void crosshairs () {
		
		eyeWidth = 1;
		strokeWeight (.5);
		stroke (255);

		// left
		line (-eyeRadius-eyeWidth, -eyeHeight, 
			  -eyeRadius+eyeWidth, -eyeHeight);
		line (-eyeRadius, -eyeHeight-eyeWidth,
			  -eyeRadius, -eyeHeight+eyeWidth);

		// right
		line (eyeRadius-eyeWidth, -eyeHeight,
			  eyeRadius+eyeWidth, -eyeHeight);
		line (eyeRadius, -eyeHeight-eyeWidth,
			  eyeRadius, -eyeHeight+eyeWidth);
	}

	// Caller (Body class) should have already translated 
	// the origin to the center of the body spline
	public void display (int mode) {
		if (mode == 0) simpleEyes ();
		else if (mode == 1) eyesWithSclera ();
		else if (mode == 2) crosshairs ();
	}

}