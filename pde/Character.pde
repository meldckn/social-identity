/**
 * Controls individual characters in a community.
 * 
 * Manages position on canvas, individual traits, (worldviews)
 */
public class Character {
	Body body;
	Face face;
	int faceMode;
	float x = 0;
	float y = 0; 

	public Character () {
		this.body = new Body ();
		this.face = new Face ();
		this.faceMode = (int) random (0,3);
	}

	// The y-position of the "feet" of the character
	public float getStandingDepth () {
		return this.y + body.getRadius();
	}

	public void setPosition (float x, float y) {
		this.x = x;
		this.y = y;
	}

	public void setPositionRelative (float x, float y) {
		this.x += x;
		this.y += y;
	}

	public void setRadius (int radius) {
		this.body.setRadius (radius);
		this.body.resetSpline ();
		this.face.setRadius (radius);
	}

	public void display () {
		display (this.x, this.y);
	}

	public void display (float x, float y) {
		pushMatrix ();
		translate (x, y);
		body.display (false);
		face.display (faceMode); 
		popMatrix ();
	}

}