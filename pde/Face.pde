
public class Face {
	
	float eyeRadius = 5; // spacing between eyes
	float eyeHeight = 5; // height above center of body

	public Face () {

	}

	public void setRadius (float bodyRadius) {

		// As eyeHeight gets larger, eyeRadius gets smaller
		this.eyeHeight = random (0, bodyRadius/2 + bodyRadius*.01);
		this.eyeRadius = bodyRadius * random (.5, .7);
	}

	public void simpleEyes () {
		float eyeWidth = 2;

		fill (255);
		// stage left
		ellipse (-eyeRadius, -eyeHeight, eyeWidth, eyeWidth); 
		// right
		ellipse (eyeRadius, -eyeHeight, eyeWidth, eyeWidth);
	}

	// Eyes with white part
	private void eyesWithSclera () {
		float smWidth = 2;
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

	// Caller (Body class) should have already translated 
	// the origin to the center of the body spline
	public void display (int mode) {
		if (mode == 0) simpleEyes ();
		else if (mode == 1) eyesWithSclera ();
	}

}