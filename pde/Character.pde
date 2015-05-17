/**
 * Controls individual characters in a community.
 * 
 * Manages position on canvas, individual traits, (worldviews)
 */
public class Character {
	Body body;
	Face face;
	float x = 0;
	float y = 0; 

	public Character () {
		this.body = new Body ();
	}

	public void setPosition (float x, float y) {
		this.x = x;
		this.y = y;
	}

	public void display () {
		display (this.x, this.y);
	}

	public void display (float x, float y) {
		pushMatrix ();
		translate (x, y);
		body.display (false);
		//face.display ();
		popMatrix ();
	}

}